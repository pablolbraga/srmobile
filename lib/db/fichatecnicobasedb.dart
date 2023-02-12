import 'package:sqflite/sqflite.dart';
import 'package:srmobile/db/criabanco.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/models/fichatecnicobasedbmodel.dart';

class FichaTecnicoBaseDb {
  Future<int> incluir(FichaTecnicoBaseDbModel ft) async {
    Database db = await CriaBanco.instance.database;
    Map<String, dynamic> linha = {
      TB_FICHATECNICOBASE_IDADMISSION: ft.idadmission,
      TB_FICHATECNICOBASE_IDCAPCONSULT: ft.idcapconsult,
      TB_FICHATECNICOBASE_IDPROFAGENDA: ft.idprofagenda,
      TB_FICHATECNICOBASE_DATAINICIO: ft.datainicio,
      TB_FICHATECNICOBASE_DATAFIM: ft.datafim,
      TB_FICHATECNICOBASE_TIPOCHAMADA: ft.tipochamada,
      TB_FICHATECNICOBASE_PROC001: ft.administracaomed,
      TB_FICHATECNICOBASE_PROC002: ft.administracaomediv,
      TB_FICHATECNICOBASE_PROC003: ft.administracaomedim,
      TB_FICHATECNICOBASE_PROC004: ft.administracaomedsc,
      TB_FICHATECNICOBASE_PROC005: ft.clister,
      TB_FICHATECNICOBASE_PROC006: ft.curativo,
      TB_FICHATECNICOBASE_PROC007: ft.cateterismovesicalalivio,
      TB_FICHATECNICOBASE_PROC008: ft.cateterismovericalurina,
      TB_FICHATECNICOBASE_PROC009: ft.cuidadogerais,
      TB_FICHATECNICOBASE_PROC010: ft.ecg,
      TB_FICHATECNICOBASE_PROC011: ft.puncao,
      TB_FICHATECNICOBASE_PROC012: ft.retiradapontos,
      TB_FICHATECNICOBASE_PROC_OUTROS: ft.outrosprocedimentos,
      TB_FICHATECNICOBASE_ABD: ft.abd,
      TB_FICHATECNICOBASE_ALGODAO: ft.algodao,
      TB_FICHATECNICOBASE_AGULHA: ft.agulha,
      TB_FICHATECNICOBASE_ALCOOL: ft.alcool,
      TB_FICHATECNICOBASE_ATADURA: ft.atadura,
      TB_FICHATECNICOBASE_CATETER: ft.cateter,
      TB_FICHATECNICOBASE_EQUIPO: ft.equipo,
      TB_FICHATECNICOBASE_EXTENSOR1VIA: ft.extensor1via,
      TB_FICHATECNICOBASE_EXTENSOR2VIA: ft.extensor2via,
      TB_FICHATECNICOBASE_GAZEACOLCHOADA: ft.gazeacolchoada,
      TB_FICHATECNICOBASE_GAZEEMBEBIDA: ft.gazeembebida,
      TB_FICHATECNICOBASE_GAZEESTERIL: ft.gazeesteril,
      TB_FICHATECNICOBASE_HEPARINA: ft.heparina,
      TB_FICHATECNICOBASE_IVFIX: ft.ivfix,
      TB_FICHATECNICOBASE_JELCO: ft.jelco,
      TB_FICHATECNICOBASE_BISTURI: ft.bisturi,
      TB_FICHATECNICOBASE_LUVAESTERIL: ft.luvaesteril,
      TB_FICHATECNICOBASE_LUVAPROCEDIMENTO: ft.luvaprocedimento,
      TB_FICHATECNICOBASE_MASCARA: ft.mascara,
      TB_FICHATECNICOBASE_MICROPORE2510: ft.micropore2510,
      TB_FICHATECNICOBASE_MICROPORE5010: ft.micropore5010,
      TB_FICHATECNICOBASE_SCALP: ft.scalp,
      TB_FICHATECNICOBASE_SERINGA: ft.seringa,
      TB_FICHATECNICOBASE_SOROFISIOLOGICO: ft.sorofisiologico,
      TB_FICHATECNICOBASE_OUTROSMATERIAIS: ft.outrosmateriais,
      TB_FICHATECNICOBASE_MEDICAMENTOS: ft.medicamentos,
      TB_FICHATECNICOBASE_EVOLUCAO: ft.evolucao,
      TB_FICHATECNICOBASE_ASSINATURAPACIENTE: ft.assinaturapaciente,
      TB_FICHATECNICOBASE_ASSINATURAPROFISSIONAL: ft.assinaturaprofissional,
      TB_FICHATECNICOBASE_LATITUDE: ft.latitude,
      TB_FICHATECNICOBASE_LONGITUDE: ft.longitude,
      TB_FICHATECNICOBASE_IDPROFESSIONAL: ft.idprofessional,
      TB_FICHATECNICOBASE_NMPACIENTE: ft.nmpaciente
    };
    return await db.insert(TB_FICHATECNICOBASE, linha);
  }

  Future<List<Map<String, dynamic>>> listarFichas(int? idperson) async {
    Database db = await CriaBanco.instance.database;
    return await db.rawQuery(
        "SELECT * FROM $TB_FICHATECNICOBASE WHERE IDPROFESSIONAL = $idperson");
  }

  void excluir(int codigo) async {
    Database db = await CriaBanco.instance.database;
    await db.delete(TB_FICHATECNICOBASE, where: "ID = ?", whereArgs: [codigo]);
  }
}
