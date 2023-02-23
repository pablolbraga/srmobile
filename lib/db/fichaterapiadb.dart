import 'package:sqflite/sqflite.dart';
import 'package:srmobile/db/criabanco.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/models/fichaterapiadbmodel.dart';

class FichaTerapiaDb {
  Future<int> incluir(FichaTerapiaDbModel ft) async {
    Database db = await CriaBanco.instance.database;
    Map<String, dynamic> linha = {
      TB_FICHATERAPIA_IDADMISSION: ft.idadmission,
      TB_FICHATERAPIA_IDCAPCONSULT: ft.idcapconsult,
      TB_FICHATERAPIA_IDPROFAGENDA: ft.idprofagenda,
      TB_FICHATERAPIA_DATAINICIO: ft.datainicio,
      TB_FICHATERAPIA_DATAFIM: ft.datafim,
      TB_FICHATERAPIA_PARTICIPACAOCLIENTE: ft.participacaocliente,
      TB_FICHATERAPIA_EXECUCAOTECNICAPROPOSTA: ft.execucaotecnicaproposta,
      TB_FICHATERAPIA_OBSERVACAO: ft.observacao,
      TB_FICHATERAPIA_ASSINATURAPACIENTE: ft.assinaturapaciente,
      TB_FICHATERAPIA_ASSINATURAPROFISSIONAL: ft.assinaturaprofissional,
      TB_FICHATERAPIA_LATITUDE: ft.latitude,
      TB_FICHATERAPIA_LONGITUDE: ft.longitude,
      TB_FICHATERAPIA_IDPROFESSIONAL: ft.idprofessional,
      TB_FICHATERAPIA_IDESPECIALIDADE: ft.idespecialidade,
      TB_FICHATERAPIA_NMPACIENTE: ft.nmpaciente
    };
    return await db.insert(TB_FICHATERAPIA, linha);
  }

  Future<List<Map<String, dynamic>>> listarFichas(int? idperson) async {
    Database db = await CriaBanco.instance.database;
    return await db.rawQuery(
        "SELECT * FROM $TB_FICHATERAPIA WHERE $TB_FICHATERAPIA_IDPROFESSIONAL = $idperson");
  }

  void excluir(int codigo) async {
    Database db = await CriaBanco.instance.database;
    await db.delete(TB_FICHATERAPIA,
        where: "$TB_FICHATERAPIA_ID = ?", whereArgs: [codigo]);
  }
}
