// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/agendamodel.dart';

class Agenda extends StatefulWidget {
  const Agenda({super.key});

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Agenda Disponível"),
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
                      _listarAgenda();
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
              future: _listarAgenda(),
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
                              VariaveisGlobais.dadosAgenda =
                                  snapshot.data[indice];
                              VariaveisGlobais.dataInicioAtendimento =
                                  formatDate(DateTime.now(), [
                                dd,
                                '/',
                                mm,
                                '/',
                                yyyy,
                                ' ',
                                HH,
                                ':',
                                nn,
                                ':',
                                ss
                              ]);
                              // Verifica a especialidade e abre a ficha
                              switch (VariaveisGlobais
                                  .dadosUsuario?.idespecialidade) {
                                case 148815:
                                  Navigator.pushNamed(context, "fichamedica");
                                  break;
                                default:
                                  Navigator.pushNamed(context, "fichaterapia");
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data[indice].nmpaciente,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    snapshot.data[indice].nmconvenio,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  Text(
                                    '${snapshot.data[indice].idade} ano(s)',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          color: snapshot.data[indice].idevolucao == 0
                              ? Colors.blue
                              : Colors.black,
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
    Navigator.pushNamed(context, "opcao");
    return true;
  }

  Future<List<AgendaModel>> _listarAgenda() async {
    var idperson = VariaveisGlobais.dadosUsuario?.idperson;
    String url = URL_LISTAR_AGENDA + idperson.toString();
    Response response = await Dio().get(url);
    var lista;
    if (response.statusCode == 200) {
      lista = (response.data as List).map((item) {
        return AgendaModel.fromJson(item);
      }).toList();
    }
    return lista;
  }
}
