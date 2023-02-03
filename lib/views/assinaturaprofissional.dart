// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:signature/signature.dart';
import 'package:srmobile/db/fichamedicadb.dart';
import 'package:srmobile/db/fichaterapiadb.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/fichamedicadbmodel.dart';
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
                              case 148815: // Medico
                                {
                                  VariaveisGlobais.dadosFichaMedica?.datafim =
                                      dataFinal;
                                  _enviarDadosMedicoBancoInterno();
                                  _enviarDados(
                                      URL_ADICIONAR_FICHA_MEDICA,
                                      VariaveisGlobais.dadosFichaMedica
                                          ?.toJson());
                                }
                                break;
                              default: // Fisio, Fono e TO
                                {
                                  VariaveisGlobais.dadosFichaTerapia?.datafim =
                                      dataFinal;
                                  _enviarDadosTerapiaBancoInterno();
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
    Dio dio = Dio();
    Response response = await dio.post(url, data: dados);
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

  void _enviarDadosMedicoBancoInterno() {
    var ficha = FichaMedicaDbModel();
    ficha.idadmission = VariaveisGlobais.dadosFichaMedica?.idadmission;
    ficha.idprofessional = VariaveisGlobais.dadosFichaMedica?.idprofessional;
    ficha.idcapconsult = VariaveisGlobais.dadosFichaMedica?.idcapconsult;
    ficha.idprofagenda = VariaveisGlobais.dadosFichaMedica?.idprofagenda;
    ficha.datainicio = VariaveisGlobais.dadosFichaMedica?.datainicio;
    ficha.datafim = VariaveisGlobais.dadosFichaMedica?.datafim;
    ficha.hd = VariaveisGlobais.dadosFichaMedica?.hd;
    ficha.acompanhante = VariaveisGlobais.dadosFichaMedica?.acompanhante;
    ficha.situacaoclinica = VariaveisGlobais.dadosFichaMedica?.situacaoclinica;
    ficha.justificativaatendimentodomiciliar =
        VariaveisGlobais.dadosFichaMedica?.justificativaatendimentodomiciliar;
    ficha.fisioterapiamotora =
        VariaveisGlobais.dadosFichaMedica?.fisioterapiamotora;
    ficha.fisioterapiarespiratoria =
        VariaveisGlobais.dadosFichaMedica?.fisioterapiarespiratoria;
    ficha.nutricionista = VariaveisGlobais.dadosFichaMedica?.nutricionista;
    ficha.fonoterapia = VariaveisGlobais.dadosFichaMedica?.fonoterapia;
    ficha.enfermagem = VariaveisGlobais.dadosFichaMedica?.enfermagem;
    ficha.terapiaocupacional =
        VariaveisGlobais.dadosFichaMedica?.terapiaocupacional;
    ficha.psicologo = VariaveisGlobais.dadosFichaMedica?.psicologo;
    ficha.examefisico = VariaveisGlobais.dadosFichaMedica?.examefisico;
    ficha.antibiotico = VariaveisGlobais.dadosFichaMedica?.antibiotico;
    ficha.nutricaooral = VariaveisGlobais.dadosFichaMedica?.nutricaooral;
    ficha.nutricaogt = VariaveisGlobais.dadosFichaMedica?.nutricaogt;
    ficha.nutricaocne = VariaveisGlobais.dadosFichaMedica?.nutricaocne;
    ficha.nutricaoiv = VariaveisGlobais.dadosFichaMedica?.nutricaoiv;
    ficha.atividadevidadiaria =
        VariaveisGlobais.dadosFichaMedica?.atividadevidadiaria;
    ficha.pamax = VariaveisGlobais.dadosFichaMedica?.pamax;
    ficha.pamin = VariaveisGlobais.dadosFichaMedica?.pamin;
    ficha.fc = VariaveisGlobais.dadosFichaMedica?.fc;
    ficha.fr = VariaveisGlobais.dadosFichaMedica?.fr;
    ficha.nivelconscienciarm =
        VariaveisGlobais.dadosFichaMedica?.nivelconscienciarm;
    ficha.nivelconscienciarv =
        VariaveisGlobais.dadosFichaMedica?.nivelconscienciarv;
    ficha.nivelconscienciaao =
        VariaveisGlobais.dadosFichaMedica?.nivelconscienciaao;
    ficha.nivelconscienciapontos =
        VariaveisGlobais.dadosFichaMedica?.nivelconscienciapontos;
    ficha.ventilacaomecanica =
        VariaveisGlobais.dadosFichaMedica?.ventilacaomecanica;
    ficha.ventilador = VariaveisGlobais.dadosFichaMedica?.ventilador;
    ficha.ostomiatraqueostomia =
        VariaveisGlobais.dadosFichaMedica?.ostomiatraqueostomia;
    ficha.ostomiagastrostomia =
        VariaveisGlobais.dadosFichaMedica?.ostomiagastrostomia;
    ficha.ostomiacateternasoenteral =
        VariaveisGlobais.dadosFichaMedica?.ostomiacateternasoenteral;
    ficha.ostomiacistostomia =
        VariaveisGlobais.dadosFichaMedica?.ostomiacistostomia;
    ficha.ostomiacolostomia =
        VariaveisGlobais.dadosFichaMedica?.ostomiacolostomia;
    ficha.ostomiaoutros = VariaveisGlobais.dadosFichaMedica?.ostomiaoutros;
    ficha.aspiracaotraqueal =
        VariaveisGlobais.dadosFichaMedica?.aspiracaotraqueal;
    ficha.acessovenoso = VariaveisGlobais.dadosFichaMedica?.acessovenoso;
    ficha.suporteoxigeniocilindro =
        VariaveisGlobais.dadosFichaMedica?.suporteoxigeniocilindro;
    ficha.suporteoxigenioconcentrador =
        VariaveisGlobais.dadosFichaMedica?.suporteoxigenioconcentrador;
    ficha.oxigenoterapia = VariaveisGlobais.dadosFichaMedica?.oxigenoterapia;
    ficha.solicitarexame = VariaveisGlobais.dadosFichaMedica?.solicitarexame;
    ficha.mudancaprescricao =
        VariaveisGlobais.dadosFichaMedica?.mudancaprescricao;
    ficha.problemas = VariaveisGlobais.dadosFichaMedica?.problemas;
    ficha.orientacao = VariaveisGlobais.dadosFichaMedica?.orientacao;
    ficha.assinaturapaciente =
        VariaveisGlobais.dadosFichaTerapia?.assinaturapaciente;
    ficha.assinaturaprofissional =
        VariaveisGlobais.dadosFichaTerapia?.assinaturaprofissional;
    ficha.latitude = VariaveisGlobais.dadosFichaMedica?.latitude;
    ficha.longitude = VariaveisGlobais.dadosFichaMedica?.longitude;
    ficha.nmpaciente = VariaveisGlobais.dadosAgenda?.nmpaciente;
    FichaMedicaDb db = FichaMedicaDb();
    db.incluir(ficha);
  }
}
