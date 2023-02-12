// ignore_for_file: unnecessary_this
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/models/fichatecnicobasemodel.dart';

class FichaTecnicoBaseDbModel extends FichaTecnicoBaseModel {
  int? id;
  String? nmpaciente;

  FichaTecnicoBaseDbModel({this.id, this.nmpaciente});

  FichaTecnicoBaseDbModel.fromMapObject(Map<String, dynamic> map) {
    this.id = map[TB_FICHATECNICOBASE_ID];
    this.nmpaciente = map[TB_FICHATECNICOBASE_NMPACIENTE];
    this.idadmission = map[TB_FICHATECNICOBASE_IDADMISSION];
    this.idprofessional = map[TB_FICHATECNICOBASE_IDPROFESSIONAL];
    this.idcapconsult = map[TB_FICHATECNICOBASE_IDCAPCONSULT];
    this.idprofagenda = map[TB_FICHATECNICOBASE_IDPROFAGENDA];
    this.datainicio = map[TB_FICHATECNICOBASE_DATAINICIO];
    this.datafim = map[TB_FICHATECNICOBASE_DATAFIM];
    this.tipochamada = map[TB_FICHATECNICOBASE_TIPOCHAMADA];
    this.administracaomed = map[TB_FICHATECNICOBASE_PROC001];
    this.administracaomediv = map[TB_FICHATECNICOBASE_PROC002];
    this.administracaomedim = map[TB_FICHATECNICOBASE_PROC003];
    this.administracaomedsc = map[TB_FICHATECNICOBASE_PROC004];
    this.clister = map[TB_FICHATECNICOBASE_PROC005];
    this.curativo = map[TB_FICHATECNICOBASE_PROC006];
    this.cateterismovesicalalivio = map[TB_FICHATECNICOBASE_PROC007];
    this.cateterismovericalurina = map[TB_FICHATECNICOBASE_PROC008];
    this.cuidadogerais = map[TB_FICHATECNICOBASE_PROC008];
    this.ecg = map[TB_FICHATECNICOBASE_PROC010];
    this.puncao = map[TB_FICHATECNICOBASE_PROC011];
    this.retiradapontos = map[TB_FICHATECNICOBASE_PROC012];
    this.outrosprocedimentos = map[TB_FICHATECNICOBASE_PROC_OUTROS];
    this.abd = map[TB_FICHATECNICOBASE_ABD];
    this.algodao = map[TB_FICHATECNICOBASE_ALGODAO];
    this.agulha = map[TB_FICHATECNICOBASE_AGULHA];
    this.alcool = map[TB_FICHATECNICOBASE_ALCOOL];
    this.atadura = map[TB_FICHATECNICOBASE_ATADURA];
    this.cateter = map[TB_FICHATECNICOBASE_CATETER];
    this.equipo = map[TB_FICHATECNICOBASE_EQUIPO];
    this.extensor1via = map[TB_FICHATECNICOBASE_EXTENSOR1VIA];
    this.extensor2via = map[TB_FICHATECNICOBASE_EXTENSOR2VIA];
    this.gazeacolchoada = map[TB_FICHATECNICOBASE_GAZEACOLCHOADA];
    this.gazeembebida = map[TB_FICHATECNICOBASE_GAZEEMBEBIDA];
    this.gazeesteril = map[TB_FICHATECNICOBASE_GAZEESTERIL];
    this.heparina = map[TB_FICHATECNICOBASE_HEPARINA];
    this.ivfix = map[TB_FICHATECNICOBASE_IVFIX];
    this.jelco = map[TB_FICHATECNICOBASE_JELCO];
    this.bisturi = map[TB_FICHATECNICOBASE_BISTURI];
    this.luvaesteril = map[TB_FICHATECNICOBASE_LUVAESTERIL];
    this.luvaprocedimento = map[TB_FICHATECNICOBASE_LUVAPROCEDIMENTO];
    this.mascara = map[TB_FICHATECNICOBASE_MASCARA];
    this.micropore2510 = map[TB_FICHATECNICOBASE_MICROPORE2510];
    this.micropore5010 = map[TB_FICHATECNICOBASE_MICROPORE5010];
    this.scalp = map[TB_FICHATECNICOBASE_SCALP];
    this.seringa = map[TB_FICHATECNICOBASE_SERINGA];
    this.sorofisiologico = map[TB_FICHATECNICOBASE_SOROFISIOLOGICO];
    this.outrosmateriais = map[TB_FICHATECNICOBASE_OUTROSMATERIAIS];
    this.medicamentos = map[TB_FICHATECNICOBASE_MEDICAMENTOS];
    this.evolucao = map[TB_FICHATECNICOBASE_EVOLUCAO];
    this.assinaturapaciente = map[TB_FICHATECNICOBASE_ASSINATURAPACIENTE];
    this.assinaturaprofissional =
        map[TB_FICHATECNICOBASE_ASSINATURAPROFISSIONAL];
    this.latitude = map[TB_FICHATECNICOBASE_LATITUDE];
    this.longitude = map[TB_FICHATECNICOBASE_LONGITUDE];
  }
}
