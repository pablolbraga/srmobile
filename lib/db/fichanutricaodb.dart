import 'package:sqflite/sqflite.dart';
import 'package:srmobile/db/criabanco.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/models/fichanutricaodbmodel.dart';

class FichaNutricaoDb {
  Future<int> incluir(FichaNutricaoDbModel ficha) async {
    Database db = await CriaBanco.instance.database;
    Map<String, dynamic> linha = {
      TB_FICHANUTRICAO_IDADMISSION: ficha.idadmission,
      TB_FICHANUTRICAO_IDPROFAGENDA: ficha.idprofagenda,
      TB_FICHANUTRICAO_IDCAPCONSULT: ficha.idcapconsult,
      TB_FICHANUTRICAO_DATAINICIO: ficha.datainicio,
      TB_FICHANUTRICAO_DATAFIM: ficha.datafim,
      TB_FICHANUTRICAO_IDPROFESSIONAL: ficha.idprofessional,
      TB_FICHANUTRICAO_ACOMPANHANTE: ficha.acompanhante,
      TB_FICHANUTRICAO_GRUPOHAS: ficha.grupohas,
      TB_FICHANUTRICAO_GRUPODIABETES: ficha.grupodiabetes,
      TB_FICHANUTRICAO_GRUPODISLIPIDEMIA: ficha.grupodislipidemia,
      TB_FICHANUTRICAO_GRUPOIMOBILIDADE: ficha.grupoimobilidade,
      TB_FICHANUTRICAO_GRUPOOBESIDADE: ficha.grupoobesidade,
      TB_FICHANUTRICAO_GRUPODESNUTRICAO: ficha.grupodesnutricao,
      TB_FICHANUTRICAO_GRUPOOUTROS: ficha.grupooutros,
      TB_FICHANUTRICAO_NUTRICAO: ficha.nutricao,
      TB_FICHANUTRICAO_NUTRICAOTIPOENTERAL: ficha.nutricaotipoenteral,
      TB_FICHANUTRICAO_NUTRICAOOUTROS: ficha.nutricaotipoenteraloutros,
      TB_FICHANUTRICAO_DIETAENTERAL: ficha.dietaenteral,
      TB_FICHANUTRICAO_DIETAENTERALENTUPIMENTO: ficha.dietaenteralentupimento,
      TB_FICHANUTRICAO_DIETAINDUSTIPO: ficha.dietaindustipo,
      TB_FICHANUTRICAO_DIETAINDUSFORNECEDOR: ficha.dietaindustfornecedor,
      TB_FICHANUTRICAO_DIETAINDUSMANIPQTDE: ficha.dietaindustmanipqtde,
      TB_FICHANUTRICAO_DIETAINDUSMANIPDESC: ficha.dietaindustmanipdesc,
      TB_FICHANUTRICAO_DIETAINDUSPRONTAQTDE: ficha.dietaindustprontaqtde,
      TB_FICHANUTRICAO_DIETAINDUSPRONTADESC: ficha.dietaindustprontadesc,
      TB_FICHANUTRICAO_DIETAINDUSPRONTAFAB: ficha.dietaindustprontafab,
      TB_FICHANUTRICAO_AVALSUBJINGESTA: ficha.avalsubjingesta,
      TB_FICHANUTRICAO_AVALSUBJPESOTIPO: ficha.avalsubjpesotipo,
      TB_FICHANUTRICAO_AVALSUBJPESOQTDE: ficha.avalsubjpesoqtde,
      TB_FICHANUTRICAO_AVALSUBJPESOTEMPO: ficha.avalsubjpesotempo,
      TB_FICHANUTRICAO_AVALSUBJSINTOMADIARREIA: ficha.avalsubjsintomadiarreia,
      TB_FICHANUTRICAO_AVALSUBJSINTOMAHIPOREXIA: ficha.avalsubjsintomahiporexia,
      TB_FICHANUTRICAO_AVALSUBJSINTOMACONSTIPACAO:
          ficha.avalsubjsintomaconstipacao,
      TB_FICHANUTRICAO_AVALSUBJSINTOMAOUTROS: ficha.avalsubjsintomaoutros,
      TB_FICHANUTRICAO_AVALSUBJRITMOINTESTINAL: ficha.avalsubjritmointestinal,
      TB_FICHANUTRICAO_AVALANTROAJ: ficha.avalantroaj,
      TB_FICHANUTRICAO_AVALANTROPESO: ficha.avalantropeso,
      TB_FICHANUTRICAO_AVALANTROCIRCABD: ficha.avalantrocircabd,
      TB_FICHANUTRICAO_AVALANTROIMC: ficha.avalantroimc,
      TB_FICHANUTRICAO_AVALANTROCP: ficha.avalantrocp,
      TB_FICHANUTRICAO_AVALANTROIDADE: ficha.avalantroidade,
      TB_FICHANUTRICAO_AVALANTRODCT: ficha.avalantrodct,
      TB_FICHANUTRICAO_AVALANTROCB: ficha.avalantrocb,
      TB_FICHANUTRICAO_AVALANTROCMB: ficha.avalantrocmb,
      TB_FICHANUTRICAO_AVALANTROALTURA: ficha.avalantroaltura,
      TB_FICHANUTRICAO_DIAGNUTRIABAIXO65: ficha.diagnutriabaixo65,
      TB_FICHANUTRICAO_DIAGNUTRIACIMA65: ficha.diagnutriacima65,
      TB_FICHANUTRICAO_DIAGNUTRIDESC: ficha.diagnutridesc,
      TB_FICHANUTRICAO_MANTERCONDUTA: ficha.manterconduta,
      TB_FICHANUTRICAO_CONDUTA: ficha.conduta,
      TB_FICHANUTRICAO_ASSINATURAPACIENTE: ficha.assinaturapaciente,
      TB_FICHANUTRICAO_ASSINATURAPROFISSIONAL: ficha.assinaturaprofissional,
      TB_FICHANUTRICAO_LATITUDE: ficha.latitude,
      TB_FICHANUTRICAO_LONGITUDE: ficha.longitude,
      TB_FICHANUTRICAO_NMPACIENTE: ficha.nmpaciente
    };
    return await db.insert(TB_FICHANUTRICAO, linha);
  }

  Future<List<Map<String, dynamic>>> listarFichas(int? idperson) async {
    Database db = await CriaBanco.instance.database;
    return await db.rawQuery(
        "SELECT * FROM $TB_FICHANUTRICAO WHERE IDPROFESSIONAL = $idperson");
  }

  void excluir(int codigo) async {
    Database db = await CriaBanco.instance.database;
    await db.delete(TB_FICHANUTRICAO,
        where: "$TB_FICHANUTRICAO_ID = ?", whereArgs: [codigo]);
  }
}
