// ignore_for_file: unnecessary_this

import 'package:srmobile/models/fichaterapiamodel.dart';

class FichaTerapiaDbModel extends FichaTerapiaModel {
  int? id;
  String? nmpaciente;

  FichaTerapiaDbModel({this.id, this.nmpaciente});

  FichaTerapiaDbModel.fromMapObject(Map<String, dynamic> map) {
    this.id = map['ID'];
    this.nmpaciente = map['NMPACIENTE'];
    this.idadmission = map['IDADMISSION'];
    this.idprofessional = map['IDPROFESSIONAL'];
    this.idcapconsult = map['IDCAPCONSULT'];
    this.idprofagenda = map['IDPROFAGENDA'];
    this.datainicio = map['DATAINICIO'];
    this.datafim = map['DATAFIM'];
    this.participacaocliente = map['PARTICIPACAOCLIENTE'];
    this.execucaotecnicaproposta = map['EXECUCAOTECNICAPROPOSTA'];
    this.observacao = map['OBSERVACAO'];
    this.assinaturapaciente = map['ASSINATURAPACIENTE'];
    this.assinaturaprofissional = map['ASSINATURAPROFISSIONAL'];
    this.latitude = map['LATITUDE'];
    this.longitude = map['LONGITUDE'];
  }
}
