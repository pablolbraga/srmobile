import 'package:sqflite/sqflite.dart';
import 'package:srmobile/db/criabanco.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/models/fichaenfermagemdbmodel.dart';

class FichaEnfermagemDb {
  Future<int> incluir(FichaEnfermagemDbModel ft) async {
    Database db = await CriaBanco.instance.database;
    Map<String, dynamic> linha = {
      TB_FICHAENFERMAGEM_IDADMISSION: ft.idadmission,
      TB_FICHAENFERMAGEM_IDPROFAGENDA: ft.idprofagenda,
      TB_FICHAENFERMAGEM_IDCAPCONSULT: ft.idcapconsult,
      TB_FICHAENFERMAGEM_DATAINICIO: ft.datainicio,
      TB_FICHAENFERMAGEM_DATAFIM: ft.datafim,
      TB_FICHAENFERMAGEM_IDPROFESSIONAL: ft.idprofessional,
      TB_FICHAENFERMAGEM_ACOMPANHANTE: ft.acompanhante,
      TB_FICHAENFERMAGEM_HOSPITAL: ft.hospital,
      TB_FICHAENFERMAGEM_CUIDADOBANHO: ft.cuidadobanho,
      TB_FICHAENFERMAGEM_CUIDADOVESTIR: ft.cuidadovestir,
      TB_FICHAENFERMAGEM_CUIDADOTRANSFERENCIA: ft.cuidadotransferencia,
      TB_FICHAENFERMAGEM_CUIDADOCONTINENCIA: ft.cuidadocontinencia,
      TB_FICHAENFERMAGEM_CUIDADOALIMENTACAO: ft.cuidadoalimentacao,
      TB_FICHAENFERMAGEM_UTILIZACAOTQT: ft.utilizacaotqt,
      TB_FICHAENFERMAGEM_UTILIZACAOCNE: ft.utilizacaocne,
      TB_FICHAENFERMAGEM_UTILIZACAOGT: ft.utilizacaogt,
      TB_FICHAENFERMAGEM_UTILIZACAOCVD: ft.utilizacaocvd,
      TB_FICHAENFERMAGEM_UTILIZACAOOUTROS: ft.utilizacaooutros,
      TB_FICHAENFERMAGEM_UTILIZACAOOUTROSTEXTO: ft.utilizacaooutrostexto,
      TB_FICHAENFERMAGEM_OXIGENOTERAPIACILINDRO: ft.oxigenoterapiacilindro,
      TB_FICHAENFERMAGEM_OXIGENOTERAPIACONCENTRADOR:
          ft.oxigenoterapiaconcentrador,
      TB_FICHAENFERMAGEM_OXIGENOTERAPIACONTINUO: ft.oxigenoterapiacontinuo,
      TB_FICHAENFERMAGEM_OXIGENOTERAPIANAO: ft.oxigenoterapianao,
      TB_FICHAENFERMAGEM_VENTILACAOMECANICA: ft.ventilacaomecanica,
      TB_FICHAENFERMAGEM_VENTILACAOMECANICAEQUIPAMENTO:
          ft.ventilacaomecanicaequipamento,
      TB_FICHAENFERMAGEM_PAMAX: ft.pamax,
      TB_FICHAENFERMAGEM_PAMIN: ft.pamin,
      TB_FICHAENFERMAGEM_FERIDAPRESSAO: ft.feridapressao,
      TB_FICHAENFERMAGEM_FERIDAVASCULOGENCIA: ft.feridavasculogencia,
      TB_FICHAENFERMAGEM_FERIDACIRURGIA: ft.feridacirurgia,
      TB_FICHAENFERMAGEM_FERIDAOUTROS: ft.feridaoutros,
      TB_FICHAENFERMAGEM_DIAG001: ft.diag001,
      TB_FICHAENFERMAGEM_DIAG002: ft.diag002,
      TB_FICHAENFERMAGEM_DIAG003: ft.diag003,
      TB_FICHAENFERMAGEM_DIAG004: ft.diag004,
      TB_FICHAENFERMAGEM_DIAG005: ft.diag005,
      TB_FICHAENFERMAGEM_DIAG006: ft.diag006,
      TB_FICHAENFERMAGEM_DIAG007: ft.diag007,
      TB_FICHAENFERMAGEM_DIAG008: ft.diag008,
      TB_FICHAENFERMAGEM_DIAG009: ft.diag009,
      TB_FICHAENFERMAGEM_DIAG010: ft.diag010,
      TB_FICHAENFERMAGEM_DIAG011: ft.diag011,
      TB_FICHAENFERMAGEM_DIAG012: ft.diag012,
      TB_FICHAENFERMAGEM_DIAG013: ft.diag013,
      TB_FICHAENFERMAGEM_DIAG014: ft.diag014,
      TB_FICHAENFERMAGEM_DIAG015: ft.diag015,
      TB_FICHAENFERMAGEM_PROC001: ft.proc001,
      TB_FICHAENFERMAGEM_PROC002: ft.proc002,
      TB_FICHAENFERMAGEM_PROC003: ft.proc003,
      TB_FICHAENFERMAGEM_PROC004: ft.proc004,
      TB_FICHAENFERMAGEM_PROC005: ft.proc005,
      TB_FICHAENFERMAGEM_PROC006: ft.proc006,
      TB_FICHAENFERMAGEM_PROC007: ft.proc007,
      TB_FICHAENFERMAGEM_PROC008: ft.proc008,
      TB_FICHAENFERMAGEM_PROCOUTROS: ft.procoutros,
      TB_FICHAENFERMAGEM_PROCOUTROSTEXTO: ft.procoutrostexto,
      TB_FICHAENFERMAGEM_CUID001: ft.cuid001,
      TB_FICHAENFERMAGEM_CUID002: ft.cuid002,
      TB_FICHAENFERMAGEM_CUID003: ft.cuid003,
      TB_FICHAENFERMAGEM_CUID004: ft.cuid004,
      TB_FICHAENFERMAGEM_CUID005: ft.cuid005,
      TB_FICHAENFERMAGEM_CUID006: ft.cuid006,
      TB_FICHAENFERMAGEM_CUID007: ft.cuid007,
      TB_FICHAENFERMAGEM_CUID008: ft.cuid008,
      TB_FICHAENFERMAGEM_CUIDOUTROS: ft.cuidoutros,
      TB_FICHAENFERMAGEM_CUIDOUTROSTEXTO: ft.cuidoutrostexto,
      TB_FICHAENFERMAGEM_BRADENPERCEPCAOSENSORIAL: ft.bradenpercepcaosensorial,
      TB_FICHAENFERMAGEM_BRADENUMIDADE: ft.bradenumidade,
      TB_FICHAENFERMAGEM_BRADENATIVIDADE: ft.bradenatividade,
      TB_FICHAENFERMAGEM_BRADENMOBILIDADE: ft.bradenmobilidade,
      TB_FICHAENFERMAGEM_BRADENNUTRICAO: ft.bradennutricao,
      TB_FICHAENFERMAGEM_BRADENFICCAO: ft.bradenficcao,
      TB_FICHAENFERMAGEM_OBSERVACAO: ft.observacao,
      TB_FICHAENFERMAGEM_ASSINATURAPACIENTE: ft.assinaturapaciente,
      TB_FICHAENFERMAGEM_ASSINATURAPROFISSIONAL: ft.assinaturaprofissional,
      TB_FICHAENFERMAGEM_LATITUDE: ft.latitude,
      TB_FICHAENFERMAGEM_LONGITUDE: ft.longitude,
      TB_FICHAENFERMAGEM_NMPACIENTE: ft.nmpaciente
    };
    return await db.insert(TB_FICHAENFERMAGEM, linha);
  }

  Future<List<Map<String, dynamic>>> listarFichas(int? idperson) async {
    Database db = await CriaBanco.instance.database;
    return await db.rawQuery(
        "SELECT * FROM $TB_FICHAENFERMAGEM WHERE IDPROFESSIONAL = $idperson");
  }

  void excluir(int codigo) async {
    Database db = await CriaBanco.instance.database;
    await db.delete(TB_FICHAENFERMAGEM,
        where: "$TB_FICHAENFERMAGEM_ID = ?", whereArgs: [codigo]);
  }
}
