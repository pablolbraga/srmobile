// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, use_build_context_synchronously, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/equipamentomodel.dart';
import 'package:srmobile/models/solicitacaoequipamentomodel.dart';

class EquipamentoPesq extends StatefulWidget {
  const EquipamentoPesq({super.key});

  @override
  State<EquipamentoPesq> createState() => _EquipamentoPesqState();
}

class _EquipamentoPesqState extends State<EquipamentoPesq> {
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
            title: Text("Equip: ${nome!}"),
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
                      VariaveisGlobais.dadosEquipamento = null;
                      Navigator.pushNamed(context, "equipamentocad");
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
                              VariaveisGlobais.dadosEquipamento =
                                  snapshot.data[indice];
                              _mostrarOpcao(snapshot.data[indice].nome);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Descrição: " + snapshot.data[indice].nome,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "Quantidade: " +
                                        snapshot.data[indice].quantidade
                                            .toString(),
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

  Future<List<EquipamentoModel>> _listarItens() async {
    var idpaciente = VariaveisGlobais.dadosPaciente?.idadmission;
    String url = URL_LISTAR_EQUIPAMENTO + idpaciente.toString();
    Response response = await dio.get(url);
    var lista;
    if (response.statusCode == 200) {
      lista = (response.data as List).map((item) {
        return EquipamentoModel.fromJson(item);
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
                    Navigator.pushNamed(context, "equipamentocad");
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
                    var xnmproc = VariaveisGlobais.dadosEquipamento?.nome;
                    _enviarExclusao(xnmproc!, _ctrMotivoExclusao.text);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  void _enviarExclusao(String equipamento, String justificativa) async {
    try {
      SolicitacaoEquipamentoModel sol = SolicitacaoEquipamentoModel();
      sol.nmsolicitante = VariaveisGlobais.dadosUsuario?.nome;
      sol.idadmission = VariaveisGlobais.dadosPaciente?.idadmission;
      sol.idusuario = VariaveisGlobais.dadosUsuario?.idusuario;
      sol.idpaciente = VariaveisGlobais.dadosPaciente?.idpatient;
      sol.idperson = VariaveisGlobais.dadosUsuario?.idperson;
      sol.nmpaciente = VariaveisGlobais.dadosPaciente?.nome;
      sol.tipoalteracao = 3;
      sol.equipamento = equipamento;
      sol.observacao = "";
      sol.justificativa = justificativa;

      pr.show();
      Response response =
          await dio.post(URL_ALTERAR_EQUIPAMENTO, data: sol.toJson());
      Future.delayed(const Duration(seconds: 10)).then((value) {
        pr.hide().whenComplete(() async {
          if (response.statusCode == 200) {
            Navigator.pushNamed(context, "equipamentopesq");
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
