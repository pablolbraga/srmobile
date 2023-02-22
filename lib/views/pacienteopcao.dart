// ignore_for_file: unnecessary_new, unused_local_variable, unused_field, prefer_is_empty, prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/visitasrealizadasmodel.dart';
import 'package:srmobile/views/visualizarpdf.dart';

class PacienteOpcao extends StatefulWidget {
  const PacienteOpcao({super.key});

  @override
  State<PacienteOpcao> createState() => _PacienteOpcaoState();
}

class _PacienteOpcaoState extends State<PacienteOpcao> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _voltarTela,
      child: Scaffold(
        appBar: AppBar(title: const Text("Selecione uma opção")),
        body: Container(
          decoration: const BoxDecoration(color: Color(0xffD9EFF3)),
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        "Prescrição Médica",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "prescricaomedicapesq");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        "Prescrição de Enfermagem",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, "prescricaoenfermagempesq");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        "Procedimento de Enfermagem",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, "procedimentoenfermagempesq");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        "Equipamentos",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "equipamentopesq");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        "Exames",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "examepesq");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        "Solicitar Retorno de Exame",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "retornoexame");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        "Intercorrências",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "intercorrencia");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        "Última Visita Realizada",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        _abrirUltimaFicha();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _voltarTela() async {
    Navigator.pushNamed(context, "pacientes");
    return true;
  }

  void _abrirUltimaFicha() async {
    var idadmissao = VariaveisGlobais.dadosPaciente?.idadmission;
    var idespecialidade = VariaveisGlobais.dadosUsuario?.idespecialidade;
    setState(() {
      VariaveisGlobais.pathPdf = "";
    });
    String urlLocal =
        "$URL_BUSCAR_ULTIMA_VISITA_REALIZADA$idadmissao/$idespecialidade";
    if (idespecialidade == 148815) {
      // Medico
      Response response = await Dio().get(urlLocal);
      var lista;
      if (response.statusCode == 200) {
        lista = (response.data as List).map((item) {
          return VisitasRealizadasModel.fromJson(item);
        }).toList();
        if (lista[0].imagem == "") {
          setState(() {
            VariaveisGlobais.pathPdf =
                "$URL_PDF_IMPRIMIR_FICHA_MEDICA$idadmissao&evol=${lista[0].idevolution}";
          });
        } else {
          setState(() {
            VariaveisGlobais.pathPdf = URL_PDF_VISUALIZAR_PDF + lista[0].imagem;
          });
        }
        VariaveisGlobais.tipoRedirecionamento = 1;
        Navigator.pushNamed(context, "visualizarpdf");
      } else {
        Uteis.mostrarAviso(context, "Aviso", "Erro ao visualizar a ficha.");
      }
    } else {
      Uteis.mostrarAviso(context, "Aviso", "Visualização não disponível.");
    }
  }
}
