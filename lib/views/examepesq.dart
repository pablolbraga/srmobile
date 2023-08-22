// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, use_build_context_synchronously, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/examemodel.dart';

class ExamePesq extends StatefulWidget {
  const ExamePesq({super.key});

  @override
  State<ExamePesq> createState() => _ExamePesqState();
}

class _ExamePesqState extends State<ExamePesq> {
  var nome = VariaveisGlobais.dadosPaciente?.nome;
  late ProgressDialog pr;
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context, showLogs: true);
    pr.style(message: "Enviando dados...");
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Exame: ${nome!}"),
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
                      VariaveisGlobais.dadosExame = null;
                      Navigator.pushNamed(context, "examecad");
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
                              VariaveisGlobais.dadosExame =
                                  snapshot.data[indice];
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Exame: " + snapshot.data[indice].nmexame,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "Data da Solicitação: " +
                                        snapshot.data[indice].datareq,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  Text(
                                    "Data da Prog. Resultado: " +
                                        snapshot.data[indice].dataprogres,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  Text(
                                    "Data Realização: " +
                                        snapshot.data[indice].datarealres,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  Text(
                                    "Solicitante: " +
                                        snapshot.data[indice].nmsolicitante,
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

  Future<List<ExameModel>> _listarItens() async {
    var idpaciente = VariaveisGlobais.dadosPaciente?.idadmission;
    String url = URL_LISTAR_EXAME + idpaciente.toString();
    Response response = await dio.get(url);
    var lista;
    if (response.statusCode == 200) {
      lista = (response.data as List).map((item) {
        return ExameModel.fromJson(item);
      }).toList();
    }
    return lista;
  }
}
