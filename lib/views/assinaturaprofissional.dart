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
import 'package:srmobile/db/fichaenfermagemdb.dart';
import 'package:srmobile/db/fichamedicadb.dart';
import 'package:srmobile/db/fichanutricaodb.dart';
import 'package:srmobile/db/fichatecnicobasedb.dart';
import 'package:srmobile/db/fichaterapiadb.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/fichaenfermagemdbmodel.dart';
import 'package:srmobile/models/fichamedicadbmodel.dart';
import 'package:srmobile/models/fichanutricaodbmodel.dart';
import 'package:srmobile/models/fichatecnicobasedbmodel.dart';
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
                                  _enviarDadosMedicoBancoInterno();
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
                                  _enviarDadosEnfermagemBancoInterno();
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
                                  _enviarDadosEnfermagemBancoInterno();
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
                                  _enviarDadosNutricaoBancoInterno();
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
                                  _enviarDadosTecnicoBaseBancoInterno();
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
    Navigator.pushNamed(context, "agenda");
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
        VariaveisGlobais.dadosFichaMedica?.assinaturapaciente;
    ficha.assinaturaprofissional =
        VariaveisGlobais.dadosFichaMedica?.assinaturaprofissional;
    ficha.latitude = VariaveisGlobais.dadosFichaMedica?.latitude;
    ficha.longitude = VariaveisGlobais.dadosFichaMedica?.longitude;
    ficha.nmpaciente = VariaveisGlobais.dadosAgenda?.nmpaciente;
    FichaMedicaDb db = FichaMedicaDb();
    db.incluir(ficha);
    Navigator.pushNamed(context, "agenda");
  }

  void _enviarDadosEnfermagemBancoInterno() {
    var ficha = FichaEnfermagemDbModel();
    ficha.idadmission = VariaveisGlobais.dadosFichaEnfermagem?.idadmission;
    ficha.datainicio = VariaveisGlobais.dadosFichaEnfermagem?.datainicio;
    ficha.datafim = VariaveisGlobais.dadosFichaEnfermagem?.datafim;
    ficha.idprofessional =
        VariaveisGlobais.dadosFichaEnfermagem?.idprofessional;
    ficha.idprofagenda = VariaveisGlobais.dadosFichaEnfermagem?.idprofagenda;
    ficha.idcapconsult = VariaveisGlobais.dadosFichaEnfermagem?.idcapconsult;
    ficha.acompanhante = VariaveisGlobais.dadosFichaEnfermagem?.acompanhante;
    ficha.hospital = VariaveisGlobais.dadosFichaEnfermagem?.hospital;
    ficha.cuidadobanho = VariaveisGlobais.dadosFichaEnfermagem?.cuidadobanho;
    ficha.cuidadovestir = VariaveisGlobais.dadosFichaEnfermagem?.cuidadovestir;
    ficha.cuidadotransferencia =
        VariaveisGlobais.dadosFichaEnfermagem?.cuidadotransferencia;
    ficha.cuidadocontinencia =
        VariaveisGlobais.dadosFichaEnfermagem?.cuidadocontinencia;
    ficha.cuidadoalimentacao =
        VariaveisGlobais.dadosFichaEnfermagem?.cuidadoalimentacao;
    ficha.utilizacaotqt = VariaveisGlobais.dadosFichaEnfermagem?.utilizacaotqt;
    ficha.utilizacaocne = VariaveisGlobais.dadosFichaEnfermagem?.utilizacaocne;
    ficha.utilizacaogt = VariaveisGlobais.dadosFichaEnfermagem?.utilizacaogt;
    ficha.utilizacaocvd = VariaveisGlobais.dadosFichaEnfermagem?.utilizacaocvd;
    ficha.utilizacaooutros =
        VariaveisGlobais.dadosFichaEnfermagem?.utilizacaooutros;
    ficha.utilizacaooutrostexto =
        VariaveisGlobais.dadosFichaEnfermagem?.utilizacaooutrostexto;
    ficha.oxigenoterapiacilindro =
        VariaveisGlobais.dadosFichaEnfermagem?.oxigenoterapiacilindro;
    ficha.oxigenoterapiaconcentrador =
        VariaveisGlobais.dadosFichaEnfermagem?.oxigenoterapiaconcentrador;
    ficha.oxigenoterapiacontinuo =
        VariaveisGlobais.dadosFichaEnfermagem?.oxigenoterapiacontinuo;
    ficha.oxigenoterapianao =
        VariaveisGlobais.dadosFichaEnfermagem?.oxigenoterapianao;
    ficha.ventilacaomecanica =
        VariaveisGlobais.dadosFichaEnfermagem?.ventilacaomecanica;
    ficha.ventilacaomecanicaequipamento =
        VariaveisGlobais.dadosFichaEnfermagem?.ventilacaomecanicaequipamento;
    ficha.pamax = VariaveisGlobais.dadosFichaEnfermagem?.pamax;
    ficha.pamin = VariaveisGlobais.dadosFichaEnfermagem?.pamin;
    ficha.feridapressao = VariaveisGlobais.dadosFichaEnfermagem?.feridapressao;
    ficha.feridavasculogencia =
        VariaveisGlobais.dadosFichaEnfermagem?.feridavasculogencia;
    ficha.feridacirurgia =
        VariaveisGlobais.dadosFichaEnfermagem?.feridacirurgia;
    ficha.feridaoutros = VariaveisGlobais.dadosFichaEnfermagem?.feridaoutros;
    ficha.diag001 = VariaveisGlobais.dadosFichaEnfermagem?.diag001;
    ficha.diag002 = VariaveisGlobais.dadosFichaEnfermagem?.diag002;
    ficha.diag003 = VariaveisGlobais.dadosFichaEnfermagem?.diag003;
    ficha.diag004 = VariaveisGlobais.dadosFichaEnfermagem?.diag004;
    ficha.diag005 = VariaveisGlobais.dadosFichaEnfermagem?.diag005;
    ficha.diag006 = VariaveisGlobais.dadosFichaEnfermagem?.diag006;
    ficha.diag007 = VariaveisGlobais.dadosFichaEnfermagem?.diag007;
    ficha.diag008 = VariaveisGlobais.dadosFichaEnfermagem?.diag008;
    ficha.diag009 = VariaveisGlobais.dadosFichaEnfermagem?.diag009;
    ficha.diag010 = VariaveisGlobais.dadosFichaEnfermagem?.diag010;
    ficha.diag011 = VariaveisGlobais.dadosFichaEnfermagem?.diag011;
    ficha.diag012 = VariaveisGlobais.dadosFichaEnfermagem?.diag012;
    ficha.diag013 = VariaveisGlobais.dadosFichaEnfermagem?.diag013;
    ficha.diag014 = VariaveisGlobais.dadosFichaEnfermagem?.diag014;
    ficha.diag015 = VariaveisGlobais.dadosFichaEnfermagem?.diag015;
    ficha.proc001 = VariaveisGlobais.dadosFichaEnfermagem?.proc001;
    ficha.proc002 = VariaveisGlobais.dadosFichaEnfermagem?.proc002;
    ficha.proc003 = VariaveisGlobais.dadosFichaEnfermagem?.proc003;
    ficha.proc004 = VariaveisGlobais.dadosFichaEnfermagem?.proc004;
    ficha.proc005 = VariaveisGlobais.dadosFichaEnfermagem?.proc005;
    ficha.proc006 = VariaveisGlobais.dadosFichaEnfermagem?.proc006;
    ficha.proc007 = VariaveisGlobais.dadosFichaEnfermagem?.proc007;
    ficha.proc008 = VariaveisGlobais.dadosFichaEnfermagem?.proc008;
    ficha.procoutros = VariaveisGlobais.dadosFichaEnfermagem?.procoutros;
    ficha.procoutrostexto =
        VariaveisGlobais.dadosFichaEnfermagem?.procoutrostexto;
    ficha.cuid001 = VariaveisGlobais.dadosFichaEnfermagem?.cuid001;
    ficha.cuid002 = VariaveisGlobais.dadosFichaEnfermagem?.cuid002;
    ficha.cuid003 = VariaveisGlobais.dadosFichaEnfermagem?.cuid003;
    ficha.cuid004 = VariaveisGlobais.dadosFichaEnfermagem?.cuid004;
    ficha.cuid005 = VariaveisGlobais.dadosFichaEnfermagem?.cuid005;
    ficha.cuid006 = VariaveisGlobais.dadosFichaEnfermagem?.cuid006;
    ficha.cuid007 = VariaveisGlobais.dadosFichaEnfermagem?.cuid007;
    ficha.cuid008 = VariaveisGlobais.dadosFichaEnfermagem?.cuid008;
    ficha.cuidoutros = VariaveisGlobais.dadosFichaEnfermagem?.cuidoutros;
    ficha.cuidoutrostexto =
        VariaveisGlobais.dadosFichaEnfermagem?.cuidoutrostexto;
    ficha.bradenpercepcaosensorial =
        VariaveisGlobais.dadosFichaEnfermagem?.bradenpercepcaosensorial;
    ficha.bradenumidade = VariaveisGlobais.dadosFichaEnfermagem?.bradenumidade;
    ficha.bradenatividade =
        VariaveisGlobais.dadosFichaEnfermagem?.bradenatividade;
    ficha.bradenmobilidade =
        VariaveisGlobais.dadosFichaEnfermagem?.bradenmobilidade;
    ficha.bradennutricao =
        VariaveisGlobais.dadosFichaEnfermagem?.bradennutricao;
    ficha.bradenficcao = VariaveisGlobais.dadosFichaEnfermagem?.bradenficcao;
    ficha.observacao = VariaveisGlobais.dadosFichaEnfermagem?.observacao;
    ficha.assinaturapaciente =
        VariaveisGlobais.dadosFichaEnfermagem?.assinaturapaciente;
    ficha.assinaturaprofissional =
        VariaveisGlobais.dadosFichaEnfermagem?.assinaturaprofissional;
    ficha.latitude = VariaveisGlobais.dadosFichaEnfermagem?.latitude;
    ficha.longitude = VariaveisGlobais.dadosFichaEnfermagem?.longitude;
    ficha.nmpaciente = VariaveisGlobais.dadosAgenda?.nmpaciente;
    FichaEnfermagemDb db = FichaEnfermagemDb();
    db.incluir(ficha);
    Navigator.pushNamed(context, "agenda");
  }

  void _enviarDadosNutricaoBancoInterno() {
    var ficha = FichaNutricaoDbModel();
    ficha.idadmission = VariaveisGlobais.dadosAgenda?.idadmission;
    ficha.datainicio = VariaveisGlobais.dataInicioAtendimento;
    ficha.datafim = VariaveisGlobais.dadosFichaNutricao?.datafim;
    ficha.idprofessional = VariaveisGlobais.dadosUsuario?.idperson;
    ficha.idprofagenda = VariaveisGlobais.dadosAgenda?.idprofagenda;
    ficha.idcapconsult = VariaveisGlobais.dadosAgenda?.idcapconsult;
    ficha.acompanhante = VariaveisGlobais.dadosFichaNutricao?.acompanhante;
    ficha.grupohas = VariaveisGlobais.dadosFichaNutricao?.grupohas;
    ficha.grupodiabetes = VariaveisGlobais.dadosFichaNutricao?.grupodiabetes;
    ficha.grupodislipidemia =
        VariaveisGlobais.dadosFichaNutricao?.grupodislipidemia;
    ficha.grupoimobilidade =
        VariaveisGlobais.dadosFichaNutricao?.grupoimobilidade;
    ficha.grupoobesidade = VariaveisGlobais.dadosFichaNutricao?.grupoobesidade;
    ficha.grupodesnutricao =
        VariaveisGlobais.dadosFichaNutricao?.grupodesnutricao;
    ficha.grupooutros = VariaveisGlobais.dadosFichaNutricao?.grupooutros;
    ficha.nutricao = VariaveisGlobais.dadosFichaNutricao?.nutricao;
    ficha.nutricaotipoenteral =
        VariaveisGlobais.dadosFichaNutricao?.nutricaotipoenteral;
    ficha.dietaenteral = VariaveisGlobais.dadosFichaNutricao?.dietaenteral;
    ficha.dietaindustipo = VariaveisGlobais.dadosFichaNutricao?.dietaindustipo;
    ficha.dietaindustfornecedor =
        VariaveisGlobais.dadosFichaNutricao?.dietaindustfornecedor;
    ficha.dietaindustmanipqtde =
        VariaveisGlobais.dadosFichaNutricao?.dietaindustmanipqtde;
    ficha.dietaindustmanipdesc =
        VariaveisGlobais.dadosFichaNutricao?.dietaindustmanipdesc;
    ficha.dietaindustprontaqtde =
        VariaveisGlobais.dadosFichaNutricao?.dietaindustprontaqtde;
    ficha.dietaindustprontadesc =
        VariaveisGlobais.dadosFichaNutricao?.dietaindustprontadesc;
    ficha.dietaindustprontafab =
        VariaveisGlobais.dadosFichaNutricao?.dietaindustprontafab;
    ficha.avalsubjingesta =
        VariaveisGlobais.dadosFichaNutricao?.avalsubjingesta;
    ficha.avalsubjpesotipo =
        VariaveisGlobais.dadosFichaNutricao?.avalsubjpesotipo;
    ficha.avalsubjpesoqtde =
        VariaveisGlobais.dadosFichaNutricao?.avalsubjpesoqtde;
    ficha.avalsubjpesotempo =
        VariaveisGlobais.dadosFichaNutricao?.avalsubjpesotempo;
    ficha.avalsubjsintomadiarreia =
        VariaveisGlobais.dadosFichaNutricao?.avalsubjsintomadiarreia;
    ficha.avalsubjsintomahiporexia =
        VariaveisGlobais.dadosFichaNutricao?.avalsubjsintomahiporexia;
    ficha.avalsubjsintomaconstipacao =
        VariaveisGlobais.dadosFichaNutricao?.avalsubjsintomaconstipacao;
    ficha.avalsubjsintomaoutros =
        VariaveisGlobais.dadosFichaNutricao?.avalsubjsintomaoutros;
    ficha.avalsubjritmointestinal =
        VariaveisGlobais.dadosFichaNutricao?.avalsubjritmointestinal;
    ficha.avalantroaj = VariaveisGlobais.dadosFichaNutricao?.avalantroaj;
    ficha.avalantropeso = VariaveisGlobais.dadosFichaNutricao?.avalantropeso;
    ficha.avalantrocircabd =
        VariaveisGlobais.dadosFichaNutricao?.avalantrocircabd;
    ficha.avalantroimc = VariaveisGlobais.dadosFichaNutricao?.avalantroimc;
    ficha.avalantrocp = VariaveisGlobais.dadosFichaNutricao?.avalantrocp;
    ficha.avalantroidade = VariaveisGlobais.dadosFichaNutricao?.avalantroidade;
    ficha.avalantrodct = VariaveisGlobais.dadosFichaNutricao?.avalantrodct;
    ficha.avalantrocb = VariaveisGlobais.dadosFichaNutricao?.avalantrocb;
    ficha.avalantrocmb = VariaveisGlobais.dadosFichaNutricao?.avalantrocmb;
    ficha.avalantroaltura =
        VariaveisGlobais.dadosFichaNutricao?.avalantroaltura;
    ficha.diagnutriabaixo65 =
        VariaveisGlobais.dadosFichaNutricao?.diagnutriabaixo65;
    ficha.diagnutriacima65 =
        VariaveisGlobais.dadosFichaNutricao?.diagnutriacima65;
    ficha.diagnutridesc = VariaveisGlobais.dadosFichaNutricao?.diagnutridesc;
    ficha.manterconduta = VariaveisGlobais.dadosFichaNutricao?.manterconduta;
    ficha.conduta = VariaveisGlobais.dadosFichaNutricao?.conduta;
    ficha.assinaturapaciente =
        VariaveisGlobais.dadosFichaNutricao?.assinaturapaciente;
    ficha.assinaturaprofissional =
        VariaveisGlobais.dadosFichaNutricao?.assinaturaprofissional;
    ficha.latitude = VariaveisGlobais.dadosFichaNutricao?.latitude;
    ficha.longitude = VariaveisGlobais.dadosFichaNutricao?.longitude;
    ficha.nmpaciente = VariaveisGlobais.dadosAgenda?.nmpaciente;
    FichaNutricaoDb db = FichaNutricaoDb();
    db.incluir(ficha);
    Navigator.pushNamed(context, "agenda");
  }

  void _enviarDadosTecnicoBaseBancoInterno() {
    var ficha = FichaTecnicoBaseDbModel();
    ficha.idadmission = VariaveisGlobais.dadosFichaTecnicoBase?.idadmission;
    ficha.datainicio = VariaveisGlobais.dadosFichaTecnicoBase?.datainicio;
    ficha.datafim = VariaveisGlobais.dadosFichaTecnicoBase?.datafim;
    ficha.idprofessional =
        VariaveisGlobais.dadosFichaTecnicoBase?.idprofessional;
    ficha.idprofagenda = VariaveisGlobais.dadosFichaTecnicoBase?.idprofagenda;
    ficha.idcapconsult = VariaveisGlobais.dadosFichaTecnicoBase?.idcapconsult;
    ficha.tipochamada = VariaveisGlobais.dadosFichaTecnicoBase?.tipochamada;
    ficha.administracaomedim =
        VariaveisGlobais.dadosFichaTecnicoBase?.administracaomedim;
    ficha.administracaomediv =
        VariaveisGlobais.dadosFichaTecnicoBase?.administracaomediv;
    ficha.administracaomedsc =
        VariaveisGlobais.dadosFichaTecnicoBase?.administracaomedsc;
    ficha.administracaomed =
        VariaveisGlobais.dadosFichaTecnicoBase?.administracaomed;
    ficha.clister = VariaveisGlobais.dadosFichaTecnicoBase?.clister;
    ficha.curativo = VariaveisGlobais.dadosFichaTecnicoBase?.curativo;
    ficha.cateterismovesicalalivio =
        VariaveisGlobais.dadosFichaTecnicoBase?.cateterismovesicalalivio;
    ficha.cateterismovericalurina =
        VariaveisGlobais.dadosFichaTecnicoBase?.cateterismovericalurina;
    ficha.cuidadogerais = VariaveisGlobais.dadosFichaTecnicoBase?.cuidadogerais;
    ficha.ecg = VariaveisGlobais.dadosFichaTecnicoBase?.ecg;
    ficha.puncao = VariaveisGlobais.dadosFichaTecnicoBase?.puncao;
    ficha.retiradapontos =
        VariaveisGlobais.dadosFichaTecnicoBase?.retiradapontos;
    ficha.outrosprocedimentos =
        VariaveisGlobais.dadosFichaTecnicoBase?.outrosprocedimentos;
    ficha.abd = VariaveisGlobais.dadosFichaTecnicoBase?.abd;
    ficha.algodao = VariaveisGlobais.dadosFichaTecnicoBase?.algodao;
    ficha.agulha = VariaveisGlobais.dadosFichaTecnicoBase?.agulha;
    ficha.alcool = VariaveisGlobais.dadosFichaTecnicoBase?.alcool;
    ficha.atadura = VariaveisGlobais.dadosFichaTecnicoBase?.atadura;
    ficha.cateter = VariaveisGlobais.dadosFichaTecnicoBase?.cateter;
    ficha.equipo = VariaveisGlobais.dadosFichaTecnicoBase?.equipo;
    ficha.extensor1via = VariaveisGlobais.dadosFichaTecnicoBase?.extensor1via;
    ficha.extensor2via = VariaveisGlobais.dadosFichaTecnicoBase?.extensor2via;
    ficha.gazeacolchoada =
        VariaveisGlobais.dadosFichaTecnicoBase?.gazeacolchoada;
    ficha.gazeembebida = VariaveisGlobais.dadosFichaTecnicoBase?.gazeembebida;
    ficha.gazeesteril = VariaveisGlobais.dadosFichaTecnicoBase?.gazeesteril;
    ficha.heparina = VariaveisGlobais.dadosFichaTecnicoBase?.heparina;
    ficha.ivfix = VariaveisGlobais.dadosFichaTecnicoBase?.ivfix;
    ficha.jelco = VariaveisGlobais.dadosFichaTecnicoBase?.jelco;
    ficha.bisturi = VariaveisGlobais.dadosFichaTecnicoBase?.bisturi;
    ficha.luvaesteril = VariaveisGlobais.dadosFichaTecnicoBase?.luvaesteril;
    ficha.luvaprocedimento =
        VariaveisGlobais.dadosFichaTecnicoBase?.luvaprocedimento;
    ficha.mascara = VariaveisGlobais.dadosFichaTecnicoBase?.mascara;
    ficha.micropore2510 = VariaveisGlobais.dadosFichaTecnicoBase?.micropore2510;
    ficha.micropore5010 = VariaveisGlobais.dadosFichaTecnicoBase?.micropore5010;
    ficha.scalp = VariaveisGlobais.dadosFichaTecnicoBase?.scalp;
    ficha.seringa = VariaveisGlobais.dadosFichaTecnicoBase?.seringa;
    ficha.sorofisiologico =
        VariaveisGlobais.dadosFichaTecnicoBase?.sorofisiologico;
    ficha.outrosmateriais =
        VariaveisGlobais.dadosFichaTecnicoBase?.outrosmateriais;
    ficha.medicamentos = VariaveisGlobais.dadosFichaTecnicoBase?.medicamentos;
    ficha.evolucao = VariaveisGlobais.dadosFichaTecnicoBase?.evolucao;
    ficha.assinaturapaciente =
        VariaveisGlobais.dadosFichaTecnicoBase?.assinaturapaciente;
    ficha.assinaturaprofissional =
        VariaveisGlobais.dadosFichaTecnicoBase?.assinaturaprofissional;
    ficha.latitude = VariaveisGlobais.dadosFichaTecnicoBase?.latitude;
    ficha.longitude = VariaveisGlobais.dadosFichaTecnicoBase?.longitude;
    ficha.nmpaciente = VariaveisGlobais.dadosAgenda?.nmpaciente;
    FichaTecnicoBaseDb db = FichaTecnicoBaseDb();
    db.incluir(ficha);
    Navigator.pushNamed(context, "agenda");
  }
}
