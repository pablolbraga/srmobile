// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/prescricaoenfermagemmodel.dart';
import 'package:srmobile/models/solicitacaoprescricaoenfermagemmodel.dart';

class PrescricaoEnfermagemPesq extends StatefulWidget {
  const PrescricaoEnfermagemPesq({super.key});

  @override
  State<PrescricaoEnfermagemPesq> createState() =>
      _PrescricaoEnfermagemPesqState();
}

class _PrescricaoEnfermagemPesqState extends State<PrescricaoEnfermagemPesq> {
  var nome = VariaveisGlobais.dadosPaciente?.nome;
  final _ctrMotivoExclusao = TextEditingController();
  late ProgressDialog pr;
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context, showLogs: true);
    pr.style(message: "Enviando dados...");
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("PE: ${nome!}"),
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
                      VariaveisGlobais.dadosPrescricaoEnfermagem = null;
                      Navigator.pushNamed(context, "prescricaoenfermagemcad");
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
                    child: const Center(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
                              VariaveisGlobais.dadosPrescricaoEnfermagem =
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
                                    "Produto: " +
                                        snapshot.data[indice].nmproduto,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "Procedimento: " +
                                        snapshot.data[indice].nmprocedimento,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  Text(
                                    "Quantidade: " +
                                        snapshot.data[indice].quantidade +
                                        " (" +
                                        snapshot.data[indice].unidmed +
                                        ")",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  Text(
                                    "Frequência: " +
                                        snapshot.data[indice].frequencia,
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

  Future<List<PrescricaoEnfermagemModel>> _listarItens() async {
    var idpaciente = VariaveisGlobais.dadosPaciente?.idadmission;
    String url = URL_LISTAR_PRESCRICAO_ENFERMAGEM + idpaciente.toString();
    Response response = await dio.get(url);
    var lista;
    if (response.statusCode == 200) {
      lista = (response.data as List).map((item) {
        return PrescricaoEnfermagemModel.fromJson(item);
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
                    Navigator.pushNamed(context, "prescricaoenfermagemcad");
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
                        VariaveisGlobais.dadosPrescricaoEnfermagem?.nmproduto;
                    _enviarExclusao(xnmproc!, _ctrMotivoExclusao.text);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  void _enviarExclusao(String procedimento, String justificativa) async {
    try {
      SolicitacaoPrescricaoEnfermagemModel sol =
          SolicitacaoPrescricaoEnfermagemModel();
      sol.tipo = 3;
      sol.idprofissionalsolicitante = VariaveisGlobais.dadosUsuario?.idusuario;
      sol.idpaciente = VariaveisGlobais.dadosPaciente?.idpatient;
      sol.datasolicitacao = formatDate(
          DateTime.now(), [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn, ':', ss]);
      sol.nmmaterial = procedimento;
      sol.quantidade = "";
      sol.frequencia = "";
      sol.duracao = "";
      sol.observacao = "";
      sol.justificativa = justificativa;
      sol.idadmission = VariaveisGlobais.dadosPaciente?.idadmission;
      sol.via = "";

      pr.show();
      Response response =
          await dio.post(URL_ALTERAR_PRESCRICAO_ENFERMAGEM, data: sol.toJson());
      Future.delayed(const Duration(seconds: 10)).then((value) {
        pr.hide().whenComplete(() async {
          if (response.statusCode == 200) {
            Navigator.pushNamed(context, "prescricaoenfermagempesq");
          } else {
            Uteis.mostrarAviso(
                context,
                "Erro",
                "Erro ao enviar os dados. Erro: " +
                    response.statusCode.toString() +
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
