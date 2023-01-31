// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:signature/signature.dart';
import 'package:srmobile/db/fichaterapiadb.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/fichaterapiadbmodel.dart';

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
                              case 0:
                                break;
                              default:
                                {
                                  _enviarDadosTerapiaBancoInterno();
                                  _enviarDadosTerapia();
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

  void _enviarDadosTerapia() async {
    pr.show();
    Dio dio = Dio();
    Response response = await dio.post(URL_ADICIONAR_FICHA_TERAPIA,
        data: VariaveisGlobais.dadosFichaTerapia?.toJson());
    if (response.statusCode == 200) {
      Future.delayed(const Duration(seconds: 10)).then((value) {
        pr.hide().whenComplete(() {
          Navigator.pushNamed(context, "agenda");
        });
      });
    } else {
      Uteis.mostrarAviso(context, "Erro",
          "Erro ao enviar os dados. Erro: ${response.statusMessage}$response");
    }
  }

  void _enviarDadosTerapiaBancoInterno() {
    var ft = FichaTerapiaDbModel();
    ft.idadmission = VariaveisGlobais.dadosFichaTerapia?.idadmission;
    ft.idprofessional = VariaveisGlobais.dadosFichaTerapia?.idprofessional;
    ft.idcapconsult = VariaveisGlobais.dadosFichaTerapia?.idcapconsult;
    ft.idprofagenda = VariaveisGlobais.dadosFichaTerapia?.idprofagenda;
    ft.datainicio = VariaveisGlobais.dadosFichaTerapia?.datainicio;
    ft.datafim = VariaveisGlobais.dadosFichaTerapia?.datafim;
    ft.participacaocliente =
        VariaveisGlobais.dadosFichaTerapia?.participacaocliente;
    ft.execucaotecnicaproposta =
        VariaveisGlobais.dadosFichaTerapia?.execucaotecnicaproposta;
    ft.observacao = VariaveisGlobais.dadosFichaTerapia?.observacao;
    ft.assinaturapaciente =
        VariaveisGlobais.dadosFichaTerapia?.assinaturapaciente;
    ft.assinaturaprofissional =
        VariaveisGlobais.dadosFichaTerapia?.assinaturaprofissional;
    ft.latitude = VariaveisGlobais.dadosFichaTerapia?.latitude;
    ft.longitude = VariaveisGlobais.dadosFichaTerapia?.longitude;
    ft.nmpaciente = VariaveisGlobais.dadosAgenda?.nmpaciente;
    FichaTerapiaDb db = FichaTerapiaDb();
    db.incluir(ft);
  }
}
