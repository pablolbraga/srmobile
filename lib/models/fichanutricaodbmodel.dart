// ignore_for_file: unnecessary_this
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/models/fichanutricaomodel.dart';

class FichaNutricaoDbModel extends FichaNutricaoModel {
  int? id;
  String? nmpaciente;

  FichaNutricaoDbModel({this.id, this.nmpaciente});

  FichaNutricaoDbModel.fromMapObject(Map<String, dynamic> map) {
    this.id = map[TB_FICHANUTRICAO_ID];
    this.idadmission = map[TB_FICHANUTRICAO_IDADMISSION];
    this.datainicio = map[TB_FICHANUTRICAO_DATAINICIO];
    this.idprofessional = map[TB_FICHANUTRICAO_IDPROFESSIONAL];
    this.idprofagenda = map[TB_FICHANUTRICAO_IDPROFAGENDA];
    this.idcapconsult = map[TB_FICHANUTRICAO_IDCAPCONSULT];
    this.acompanhante = map[TB_FICHANUTRICAO_ACOMPANHANTE];
    this.grupohas = map[TB_FICHANUTRICAO_GRUPOHAS];
    this.grupodiabetes = map[TB_FICHANUTRICAO_GRUPODIABETES];
    this.grupodislipidemia = map[TB_FICHANUTRICAO_GRUPODISLIPIDEMIA];
    this.grupoimobilidade = map[TB_FICHANUTRICAO_GRUPOIMOBILIDADE];
    this.grupoobesidade = map[TB_FICHANUTRICAO_GRUPOOBESIDADE];
    this.grupodesnutricao = map[TB_FICHANUTRICAO_GRUPODESNUTRICAO];
    this.grupooutros = map[TB_FICHANUTRICAO_GRUPOOUTROS];
    this.nutricao = map[TB_FICHANUTRICAO_NUTRICAO];
    this.nutricaotipoenteral = map[TB_FICHANUTRICAO_NUTRICAOTIPOENTERAL];
    this.dietaenteral = map[TB_FICHANUTRICAO_DIETAENTERAL];
    this.dietaindustipo = map[TB_FICHANUTRICAO_DIETAINDUSTIPO];
    this.dietaindustfornecedor = map[TB_FICHANUTRICAO_DIETAINDUSFORNECEDOR];
    this.dietaindustmanipqtde = map[TB_FICHANUTRICAO_DIETAINDUSMANIPQTDE];
    this.dietaindustmanipdesc = map[TB_FICHANUTRICAO_DIETAINDUSMANIPDESC];
    this.dietaindustprontaqtde = map[TB_FICHANUTRICAO_DIETAINDUSPRONTAQTDE];
    this.dietaindustprontadesc = map[TB_FICHANUTRICAO_DIETAINDUSPRONTADESC];
    this.dietaindustprontafab = map[TB_FICHANUTRICAO_DIETAINDUSPRONTAFAB];
    this.avalsubjingesta = map[TB_FICHANUTRICAO_AVALSUBJINGESTA];
    this.avalsubjpesotipo = map[TB_FICHANUTRICAO_AVALSUBJPESOTIPO];
    this.avalsubjpesoqtde = map[TB_FICHANUTRICAO_AVALSUBJPESOQTDE];
    this.avalsubjpesotempo = map[TB_FICHANUTRICAO_AVALSUBJPESOTEMPO];
    this.avalsubjsintomadiarreia =
        map[TB_FICHANUTRICAO_AVALSUBJSINTOMADIARREIA];
    this.avalsubjsintomahiporexia =
        map[TB_FICHANUTRICAO_AVALSUBJSINTOMAHIPOREXIA];
    this.avalsubjsintomaconstipacao =
        map[TB_FICHANUTRICAO_AVALSUBJSINTOMACONSTIPACAO];
    this.avalsubjsintomaoutros = map[TB_FICHANUTRICAO_AVALSUBJSINTOMAOUTROS];
    this.avalsubjritmointestinal =
        map[TB_FICHANUTRICAO_AVALSUBJRITMOINTESTINAL];
    this.avalantroaj = map[TB_FICHANUTRICAO_AVALANTROAJ];
    this.avalantropeso = map[TB_FICHANUTRICAO_AVALANTROPESO];
    this.avalantrocircabd = map[TB_FICHANUTRICAO_AVALANTROCIRCABD];
    this.avalantroimc = map[TB_FICHANUTRICAO_AVALANTROIMC];
    this.avalantrocp = map[TB_FICHANUTRICAO_AVALANTROCP];
    this.avalantroidade = map[TB_FICHANUTRICAO_AVALANTROIDADE];
    this.avalantrodct = map[TB_FICHANUTRICAO_AVALANTRODCT];
    this.avalantrocb = map[TB_FICHANUTRICAO_AVALANTROCB];
    this.avalantrocmb = map[TB_FICHANUTRICAO_AVALANTROCMB];
    this.avalantroaltura = map[TB_FICHANUTRICAO_AVALANTROALTURA];
    this.diagnutriabaixo65 = map[TB_FICHANUTRICAO_DIAGNUTRIABAIXO65];
    this.diagnutriacima65 = map[TB_FICHANUTRICAO_DIAGNUTRIACIMA65];
    this.diagnutridesc = map[TB_FICHANUTRICAO_DIAGNUTRIDESC];
    this.manterconduta = map[TB_FICHANUTRICAO_MANTERCONDUTA];
    this.conduta = map[TB_FICHANUTRICAO_CONDUTA];
    this.nmpaciente = map[TB_FICHANUTRICAO_NMPACIENTE];
    this.assinaturapaciente = map[TB_FICHANUTRICAO_ASSINATURAPACIENTE];
    this.assinaturaprofissional = map[TB_FICHANUTRICAO_ASSINATURAPROFISSIONAL];
    this.latitude = map[TB_FICHANUTRICAO_LATITUDE];
    this.longitude = map[TB_FICHANUTRICAO_LONGITUDE];
  }
}
