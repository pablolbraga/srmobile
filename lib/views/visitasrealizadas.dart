// ignore_for_file: deprecated_member_use, sort_child_properties_last, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps, unused_local_variable, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/visitasrealizadasmodel.dart';

class VisitasRealizadas extends StatefulWidget {
  const VisitasRealizadas({Key? key}) : super(key: key);

  @override
  State<VisitasRealizadas> createState() => _VisitasRealizadasState();
}

class _VisitasRealizadasState extends State<VisitasRealizadas> {
  @override
  void initState() {
    super.initState();
    setState(() {
      _listarVisitasRealizadas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Visitas Realizadas"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: IconButton(
                  icon: const Icon(Icons.update, size: 40),
                  onPressed: () {
                    setState(() {
                      _listarVisitasRealizadas();
                    });
                  },
                ),
              )
            ],
          ),
          body: Container(
            decoration: const BoxDecoration(color: Color(0xffD9EFF3)),
            padding: const EdgeInsets.all(16),
            child: FutureBuilder(
              future: _listarVisitasRealizadas(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
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
                              _visualizarFicha(
                                  snapshot.data[indice].idadmission,
                                  snapshot.data[indice].idevolution);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Paciente: " +
                                        snapshot.data[indice].nmpaciente,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "Profissional: " +
                                        snapshot.data[indice].nmprofessional,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  Text(
                                    "Inicio: " + snapshot.data[indice].dataini,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  Text(
                                    "Fim: " + snapshot.data[indice].datafim,
                                    style: TextStyle(
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
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    Navigator.pushNamed(context, "visitasrealizadasfiltro");
    return true;
  }

  Future<List<VisitasRealizadasModel>> _listarVisitasRealizadas() async {
    var idperson = VariaveisGlobais.dadosUsuario?.idperson;
    String url = URL_BASE +
        "listarvisitasrealizadas/" +
        VariaveisGlobais.dataIniVisitaRealizada! +
        "/" +
        VariaveisGlobais.dataFimVisitaRealizada! +
        "/" +
        idperson.toString();
    Response response = await Dio().get(url);
    var lista;
    if (response.statusCode == 200) {
      lista = (response.data as List).map((item) {
        return VisitasRealizadasModel.fromJson(item);
      }).toList();
    } else {
      Uteis.mostrarAviso(context, "Erro",
          "Erro ao enviar os dados. Erro: ${response.statusMessage}$response");
    }
    return lista;
  }

  void _visualizarFicha(int idadmission, int idevolucao) async {
    var idespecialidade = VariaveisGlobais.dadosUsuario?.idespecialidade;
    var url;
    List<VisitasRealizadasModel> lista = [];
    String urlVisita = URL_BASE +
        "buscarvisitarealizadaporevolucao/" +
        idevolucao.toString() +
        "/" +
        idespecialidade.toString();
    Response response = await Dio().get(urlVisita);
    if (response.statusCode == 200) {
      lista = (response.data as List).map((item) {
        return VisitasRealizadasModel.fromJson(item);
      }).toList();

      if (lista.isNotEmpty) {
        if (lista[0].imagem != "") {
          VariaveisGlobais.pathPdf =
              URL_PDF_VISUALIZAR_PDF + lista[0].imagem.toString();
        } else {
          switch (idespecialidade) {
            case 122632:
              // Enfermeiro
              VariaveisGlobais.pathPdf =
                  "$URL_PDF_IMPRIMIR_FICHA_ENFERMAGEM$idadmission&evol=${idevolucao}";
              break;
            case 243379:
              // Enfermeiro
              VariaveisGlobais.pathPdf =
                  "$URL_PDF_IMPRIMIR_FICHA_ENFERMAGEM$idadmission&evol=${idevolucao}";
              break;
            case 148815:
              // Médico
              VariaveisGlobais.pathPdf =
                  "$URL_PDF_IMPRIMIR_FICHA_MEDICA$idadmission&evol=${idevolucao}";
              break;
            case 122633:
              // Nutrição
              VariaveisGlobais.pathPdf =
                  "$URL_PDF_IMPRIMIR_FICHA_NUTRICAO$idadmission&evol=${idevolucao}";
              break;
            case 171086:
              // Técnico da Base
              VariaveisGlobais.pathPdf =
                  "$URL_PDF_IMPRIMIR_FICHA_TECNICOBASE$idadmission&evol=${idevolucao}";
              break;
            default:
              // Fisio, Fono e TO
              VariaveisGlobais.pathPdf = URL_PDF_IMPRIMIR_FICHA_ESPECIALIDADE +
                  "?adm=" +
                  idadmission.toString() +
                  "&evol=" +
                  idevolucao.toString();
          }
        }

        VariaveisGlobais.tipoRedirecionamento = 2;
        Navigator.pushNamed(context, "visualizarpdf");
      }
    }
  }
}
