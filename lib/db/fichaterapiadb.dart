import 'package:sqflite/sqflite.dart';
import 'package:srmobile/db/criabanco.dart';
import 'package:srmobile/models/fichaterapiadbmodel.dart';

class FichaTerapiaDb {
  Future<int> incluir(FichaTerapiaDbModel ft) async {
    Database db = await CriaBanco.instance.database;
    Map<String, dynamic> linha = {
      "IDADMISSION": ft.idadmission,
      "IDCAPCONSULT": ft.idcapconsult,
      "IDPROFAGENDA": ft.idprofagenda,
      "DATAINICIO": ft.datainicio,
      "DATAFIM": ft.datafim,
      "PARTICIPACAOCLIENTE": ft.participacaocliente,
      "EXECUCAOTECNICAPROPOSTA": ft.execucaotecnicaproposta,
      "OBSERVACAO": ft.observacao,
      "ASSINATURAPACIENTE": ft.assinaturapaciente,
      "ASSINATURAPROFISSIONAL": ft.assinaturaprofissional,
      "LATITUDE": ft.latitude,
      "LONGITUDE": ft.longitude,
      "IDPROFESSIONAL": ft.idprofessional,
      "NMPACIENTE": ft.nmpaciente
    };
    return await db.insert("TB_FICHATERAPIA", linha);
  }

  Future<List<Map<String, dynamic>>> listarFichas(int? idperson) async {
    Database db = await CriaBanco.instance.database;
    return await db.rawQuery(
        "SELECT * FROM TB_FICHATERAPIA WHERE IDPROFESSIONAL = $idperson");
  }

  void excluir(int codigo) async {
    Database db = await CriaBanco.instance.database;
    await db.delete("TB_FICHATERAPIA", where: "ID = ?", whereArgs: [codigo]);
  }
}
