// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:date_format/date_format.dart';
//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:signature/signature.dart';
import 'package:uno/uno.dart';

class AssinaturaProfissional extends StatefulWidget {
  const AssinaturaProfissional({super.key});

  @override
  State<AssinaturaProfissional> createState() => _AssinaturaProfissionalState();
}

class _AssinaturaProfissionalState extends State<AssinaturaProfissional> {
  final _ctrAssinaturaProfissional = SignatureController(
      penStrokeWidth: 4,
      penColor: Colors.black,
      exportBackgroundColor: Colors.transparent);
  final TextEditingController _ctrLatitude = TextEditingController();
  final TextEditingController _ctrLongitude = TextEditingController();
  String dataFinal = "";
  String long = "";
  String lat = "";
  late ProgressDialog pr;
  late Position position;
  final uno = Uno();

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context, showLogs: true);
    pr.style(message: "Enviando ficha...");
    _getLocation();
    dataFinal = formatDate(
        DateTime.now(), [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn, ':', ss]);
    return WillPopScope(
      onWillPop: _voltarTela,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Assinatura do Profissional"),
        ),
        body: Container(
          decoration: const BoxDecoration(color: Color(0xffD9EFF3)),
          child: ListView(
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Signature(
                      controller: _ctrAssinaturaProfissional,
                      height: 200,
                      backgroundColor: Colors.grey[200]!,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.black),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.check),
                      color: Colors.blue,
                      onPressed: () async {
                        if (_ctrAssinaturaProfissional.isNotEmpty) {
                          final Uint8List? dataProfissional =
                              await _ctrAssinaturaProfissional.toPngBytes();
                          if (dataProfissional != null) {
                            VariaveisGlobais.assinaturaProfissional =
                                base64Encode(dataProfissional);
                            switch (VariaveisGlobais
                                .dadosUsuario?.idespecialidade) {
                              case 148815: // Medico
                                {
                                  VariaveisGlobais.dadosFichaMedica?.datafim =
                                      dataFinal;
                                  VariaveisGlobais.dadosFichaMedica
                                          ?.assinaturapaciente =
                                      VariaveisGlobais.assinaturaPaciente;
                                  VariaveisGlobais.dadosFichaMedica
                                          ?.assinaturaprofissional =
                                      VariaveisGlobais.assinaturaProfissional;
                                  VariaveisGlobais.dadosFichaMedica?.latitude =
                                      _ctrLatitude.text;
                                  VariaveisGlobais.dadosFichaMedica?.longitude =
                                      _ctrLongitude.text;
                                  _enviarDados(
                                      URL_ADICIONAR_FICHA_MEDICA,
                                      VariaveisGlobais.dadosFichaMedica
                                          ?.toJson());
                                }
                                break;

                              case 122632: // Enfermeiro
                                {
                                  VariaveisGlobais.dadosFichaEnfermagem
                                      ?.datafim = dataFinal;
                                  VariaveisGlobais.dadosFichaEnfermagem
                                          ?.assinaturapaciente =
                                      VariaveisGlobais.assinaturaPaciente;
                                  VariaveisGlobais.dadosFichaEnfermagem
                                          ?.assinaturaprofissional =
                                      VariaveisGlobais.assinaturaProfissional;
                                  VariaveisGlobais.dadosFichaEnfermagem
                                      ?.latitude = _ctrLatitude.text;
                                  VariaveisGlobais.dadosFichaEnfermagem
                                      ?.longitude = _ctrLongitude.text;
                                  _enviarDados(
                                      URL_ADICIONAR_FICHA_ENFERMAGEM,
                                      VariaveisGlobais.dadosFichaEnfermagem
                                          ?.toJson());
                                }
                                break;

                              case 243379: // Enfermeiro Noturno
                                {
                                  VariaveisGlobais.dadosFichaEnfermagem
                                      ?.datafim = dataFinal;
                                  VariaveisGlobais.dadosFichaEnfermagem
                                          ?.assinaturapaciente =
                                      VariaveisGlobais.assinaturaPaciente;
                                  VariaveisGlobais.dadosFichaEnfermagem
                                          ?.assinaturaprofissional =
                                      VariaveisGlobais.assinaturaProfissional;
                                  VariaveisGlobais.dadosFichaEnfermagem
                                      ?.latitude = _ctrLatitude.text;
                                  VariaveisGlobais.dadosFichaEnfermagem
                                      ?.longitude = _ctrLongitude.text;
                                  _enviarDados(
                                      URL_ADICIONAR_FICHA_ENFERMAGEM,
                                      VariaveisGlobais.dadosFichaEnfermagem
                                          ?.toJson());
                                }
                                break;

                              case 122633: // Nutricionista
                                {
                                  VariaveisGlobais.dadosFichaNutricao?.datafim =
                                      dataFinal;
                                  VariaveisGlobais.dadosFichaNutricao
                                          ?.assinaturapaciente =
                                      VariaveisGlobais.assinaturaPaciente;
                                  VariaveisGlobais.dadosFichaNutricao
                                          ?.assinaturaprofissional =
                                      VariaveisGlobais.assinaturaProfissional;
                                  VariaveisGlobais.dadosFichaNutricao
                                      ?.latitude = _ctrLatitude.text;
                                  VariaveisGlobais.dadosFichaNutricao
                                      ?.longitude = _ctrLongitude.text;
                                  _enviarDados(
                                      URL_ADICIONAR_FICHA_NUTRICAO,
                                      VariaveisGlobais.dadosFichaNutricao
                                          ?.toJson());
                                }
                                break;

                              case 171086: // Técnico da Base
                                {
                                  VariaveisGlobais.dadosFichaTecnicoBase
                                      ?.datafim = dataFinal;
                                  VariaveisGlobais.dadosFichaTecnicoBase
                                          ?.assinaturapaciente =
                                      VariaveisGlobais.assinaturaPaciente;
                                  VariaveisGlobais.dadosFichaTecnicoBase
                                          ?.assinaturaprofissional =
                                      VariaveisGlobais.assinaturaProfissional;
                                  VariaveisGlobais.dadosFichaTecnicoBase
                                      ?.latitude = _ctrLatitude.text;
                                  VariaveisGlobais.dadosFichaTecnicoBase
                                      ?.longitude = _ctrLongitude.text;
                                  _enviarDados(
                                      URL_ADICIONAR_FICHA_TECNICOBASE,
                                      VariaveisGlobais.dadosFichaTecnicoBase
                                          ?.toJson());
                                }
                                break;

                              default: // Fisio, Fono e TO
                                {
                                  VariaveisGlobais.dadosFichaTerapia?.datafim =
                                      dataFinal;
                                  VariaveisGlobais.dadosFichaTerapia
                                          ?.assinaturapaciente =
                                      VariaveisGlobais.assinaturaPaciente;
                                  VariaveisGlobais.dadosFichaTerapia
                                          ?.assinaturaprofissional =
                                      VariaveisGlobais.assinaturaProfissional;
                                  VariaveisGlobais.dadosFichaTerapia?.latitude =
                                      _ctrLatitude.text;
                                  VariaveisGlobais.dadosFichaTerapia
                                      ?.longitude = _ctrLongitude.text;
                                  _enviarDados(
                                      URL_ADICIONAR_FICHA_TERAPIA,
                                      VariaveisGlobais.dadosFichaTerapia
                                          ?.toJson());
                                }
                            }
                          }
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.undo),
                      color: Colors.blue,
                      onPressed: () async {
                        setState(() {
                          _ctrAssinaturaProfissional.undo();
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.redo),
                      color: Colors.blue,
                      onPressed: () async {
                        setState(() {
                          _ctrAssinaturaProfissional.redo();
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.clear),
                      color: Colors.blue,
                      onPressed: () async {
                        setState(() {
                          _ctrAssinaturaProfissional.clear();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _voltarTela() async {
    Navigator.pushNamed(context, "assinatura_paciente");
    return true;
  }

  void _getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    long = position.longitude.toString();
    lat = position.latitude.toString();

    setState(() {
      _ctrLatitude.text = lat;
      _ctrLongitude.text = long;
    });

    LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high, distanceFilter: 100);
    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      long = position.longitude.toString();
      lat = position.latitude.toString();
      setState(() {
        _ctrLatitude.text = lat;
        _ctrLongitude.text = long;
      });
    });
  }

  void _enviarDados(String url, dynamic dados) async {
    pr.show();
    //Dio dio = Dio();
    //Response response = await dio.post(url, data: dados);
    Response response = await uno.post(url, data: dados);
    if (response.status == 200) {
      Future.delayed(const Duration(seconds: 10)).then((value) {
        pr.hide().whenComplete(() {
          Navigator.pushNamed(context, "agenda");
        });
      });
    } else {
      Uteis.mostrarAviso(context, "Erro",
          "Erro ao enviar os dados. Erro: ${response.status}$response");
    }
  }
}
