import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';

class VisitasRealizadasFiltro extends StatefulWidget {
  const VisitasRealizadasFiltro({super.key});

  @override
  State<VisitasRealizadasFiltro> createState() =>
      _VisitasRealizadasFiltroState();
}

class _VisitasRealizadasFiltroState extends State<VisitasRealizadasFiltro> {
  final TextEditingController _dataInicio = TextEditingController();
  final TextEditingController _dataFim = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _voltarTela,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Visitas Realizadas - Filtro"),
        ),
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
                    child: InputDecorator(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                        labelText: "Data Inicio",
                        labelStyle: const TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: TextFormField(
                        controller: _dataInicio,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.blue),
                        validator: (value) {
                          if (value == null || value == '') {
                            return "Data Inicio não informada";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));
                              if (newDate == null) return;
                              setState(() {
                                _dataInicio.text = formatDate(
                                    newDate, [dd, '/', mm, '/', yyyy]);
                              });
                            },
                            icon: const Icon(
                              Icons.calendar_month,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                        labelText: "Data Fim",
                        labelStyle: const TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: TextFormField(
                        controller: _dataFim,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.blue),
                        validator: (value) {
                          if (value == null || value == '') {
                            return "Data Fim não informada";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));
                              if (newDate == null) return;
                              setState(() {
                                _dataFim.text = formatDate(
                                    newDate, [dd, '/', mm, '/', yyyy]);
                              });
                            },
                            icon: const Icon(
                              Icons.calendar_month,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32))),
                        child: const Text(
                          "Pesquisar",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          _validarCampos();
                        }),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
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
    Navigator.pushNamed(context, "opcao");
    return true;
  }

  void _validarCampos() {
    String dataini = _dataInicio.text;
    String datafim = _dataFim.text;

    if (dataini.isNotEmpty) {
      if (datafim.isNotEmpty) {
        setState(() {
          VariaveisGlobais.dataIniVisitaRealizada =
              _dataInicio.text.replaceAll("/", "-");
          VariaveisGlobais.dataFimVisitaRealizada =
              _dataFim.text.replaceAll("/", "-");
          Navigator.pushNamed(context, "visitasrealizadas");
        });
      } else {
        Uteis.mostrarAviso(context, "Aviso", "Data inicio não informada");
      }
    } else {
      Uteis.mostrarAviso(context, "Aviso", "Data fim não informado");
    }
  }
}
