// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/prescricaomedicamodel.dart';
import 'package:srmobile/models/solicitacaoprescricaomedicamodel.dart';

class PrescricaoMedicaPesq extends StatefulWidget {
  const PrescricaoMedicaPesq({super.key});

  @override
  State<PrescricaoMedicaPesq> createState() => _PrescricaoMedicaPesqState();
}

class _PrescricaoMedicaPesqState extends State<PrescricaoMedicaPesq> {
  var nome = VariaveisGlobais.dadosPaciente?.nome;
  final _ctrMotivoExclusao = TextEditingController();
  late ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context, showLogs: true);
    pr.style(message: "Enviando dados...");
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("PM: ${nome!}"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: IconButton(
                  icon: const Icon(
                    Icons.update,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      _listarItens();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: IconButton(
                  icon: const Icon(
                    Icons.add,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      VariaveisGlobais.dadosPrescricaoMedica = null;
                      Navigator.pushNamed(context, "prescricaomedicacad");
                    });
                  },
                ),
              ),
            ],
          ),
          body: Container(
            decoration: const BoxDecoration(color: Color(0xffD9EFF3)),
            padding: const EdgeInsets.all(16),
            child: FutureBuilder(
              future: _listarItens(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(
                              backgroundColor: Colors.blue,
                              strokeWidth: 5,
                            ),
                            Text(
                              "Carregando...",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, indice) {
                        return Card(
                          child: InkWell(
                            onTap: () {
                              VariaveisGlobais.dadosPrescricaoMedica =
                                  snapshot.data[indice];
                              _mostrarOpcao(snapshot.data[indice].nmproduto);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Produto: ' +
                                        snapshot.data[indice].nmproduto,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "Quantidade: " +
                                        snapshot.data[indice].quantidade +
                                        " " +
                                        snapshot.data[indice].unidmed +
                                        " (" +
                                        snapshot.data[indice].frequencia +
                                        ")",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          color: Colors.blue,
                        );
                      });
                }
              },
            ),
          ),
        ),
        onWillPop: _voltarTela);
  }

  Future<bool> _voltarTela() async {
    Navigator.pushNamed(context, "pacienteopcao");
    return true;
  }

  Future<List<PrescricaoMedicaModel>> _listarItens() async {
    var idpaciente = VariaveisGlobais.dadosPaciente?.idadmission;
    String url = URL_LISTAR_PRESCRICAO_MEDICA + idpaciente.toString();
    Response response = await Dio().get(url);
    var lista;
    if (response.statusCode == 200) {
      lista = (response.data as List).map((item) {
        return PrescricaoMedicaModel.fromJson(item);
      }).toList();
    }
    return lista;
  }

  void _mostrarOpcao(String titulo) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(titulo),
            content: const Text("Escolha uma das opções abaixo"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Sair")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "prescricaomedicacad");
                  },
                  child: const Text("Alterar")),
              ElevatedButton(
                  onPressed: () {
                    _abrirMotivoExclusao(context);
                  },
                  child: const Text("Excluir")),
            ],
          );
        });
  }

  Future<void> _abrirMotivoExclusao(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Informe o motivo da exclusão"),
            content: TextField(
              onChanged: (value) {},
              controller: _ctrMotivoExclusao,
              decoration: const InputDecoration(hintText: "Motivo"),
            ),
            actions: [
              ElevatedButton(
                child: const Text("Cancelar"),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              ElevatedButton(
                child: const Text("Ok"),
                onPressed: () {
                  setState(() {
                    var xnmproc =
                        VariaveisGlobais.dadosPrescricaoMedica?.nmproduto;
                    _enviarExclusao(xnmproc!, _ctrMotivoExclusao.text);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  void _enviarExclusao(String medicamento, String justificativa) async {
    try {
      SolicitacaoPrescricaoMedicaModel sol = SolicitacaoPrescricaoMedicaModel();
      sol.tipoenvio = 4;
      sol.tipoalteracao = 3;
      sol.idusuariosolicitante = VariaveisGlobais.dadosUsuario?.idusuario;
      sol.datasolicitacao = formatDate(
          DateTime.now(), [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn, ':', ss]);
      sol.idadmission = VariaveisGlobais.dadosPaciente?.idadmission;
      sol.idpaciente = VariaveisGlobais.dadosPaciente?.idpatient;
      sol.observacaosolicitante = "";
      sol.justificativa = justificativa;
      sol.medicamento = medicamento;
      sol.dose = VariaveisGlobais.dadosPrescricaoMedica?.quantidade;
      sol.posologia = "";
      sol.status = "S";
      sol.duracao = VariaveisGlobais.dadosPrescricaoMedica?.frequencia;
      sol.via = VariaveisGlobais.dadosPrescricaoMedica?.via;
      sol.via = "";

      Dio dio = Dio();
      pr.show();
      Response response =
          await dio.post(URL_ALTERAR_PRESCRICAO_MEDICA, data: sol.toJson());
      Future.delayed(const Duration(seconds: 10)).then((value) {
        pr.hide().whenComplete(() async {
          if (response.statusCode == 200) {
            Navigator.pushNamed(context, "prescricaomedicapesq");
          } else {
            Uteis.mostrarAviso(
                context,
                "Erro",
                "Erro ao enviar os dados. Erro: " +
                    response.statusMessage.toString() +
                    ", " +
                    response.toString());
          }
        });
      });
    } catch (ex) {
      Uteis.mostrarAviso(
          context, "Erro", "Erro ao enviar os dados. Erro: " + ex.toString());
    }
  }
}
