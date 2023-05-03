// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers, prefer_typing_uninitialized_variables

//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/pacientemodel.dart';
import 'package:uno/uno.dart';

class Pacientes extends StatefulWidget {
  const Pacientes({super.key});

  @override
  State<Pacientes> createState() => _PacientesState();
}

class _PacientesState extends State<Pacientes> {
  final uno = Uno();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Pacientes"),
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
                      _listarPacientes();
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
              future: _listarPacientes(),
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
                              VariaveisGlobais.dadosPaciente =
                                  snapshot.data[indice];
                              Navigator.pushNamed(context, "pacienteopcao");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data[indice].nome,
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
                                    snapshot.data[indice].nmservico,
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
    Navigator.pushNamed(context, "opcao");
    return true;
  }

  Future<List<PacienteModel>> _listarPacientes() async {
    String url = URL_LISTAR_PACIENTES;
    Response response = await uno.get(url);
    var lista;
    if (response.status == 200) {
      lista = (response.data as List).map((item) {
        return PacienteModel.fromJson(item);
      }).toList();
    }
    return lista;
  }
}
