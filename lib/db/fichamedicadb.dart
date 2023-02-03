import 'package:sqflite/sqflite.dart';
import 'package:srmobile/db/criabanco.dart';
import 'package:srmobile/models/fichamedicadbmodel.dart';

class FichaMedicaDb {
  Future<int> incluir(FichaMedicaDbModel ft) async {
    Database db = await CriaBanco.instance.database;
    Map<String, dynamic> linha = {
      "IDADMISSION": ft.idadmission,
      "IDCAPCONSULT": ft.idcapconsult,
      "IDPROFAGENDA": ft.idprofagenda,
      "DATAINICIO": ft.datainicio,
      "DATAFIM": ft.datafim,
      "IDPROFESSIONAL": ft.idprofessional,
      "HD": ft.hd,
      "ACOMPANHANTE": ft.acompanhante,
      "SITUACAOCLINICA": ft.situacaoclinica,
      "JUSTIFICATIVAATENDIMENTODOMICILIAR":
          ft.justificativaatendimentodomiciliar,
      "FISIOTERAPIAMOTORA": ft.fisioterapiamotora,
      "FISIOTERAPIARESPIRATORIA": ft.fisioterapiarespiratoria,
      "NUTRICIONISTA": ft.nutricionista,
      "FONOTERAPIA": ft.fonoterapia,
      "ENFERMAGEM": ft.enfermagem,
      "TERAPIAOCUPACIONAL": ft.idprofessional,
      "PSICOLOGO": ft.psicologo,
      "EXAMEFISICO": ft.examefisico,
      "ANTIBIOTICO": ft.antibiotico,
      "NUTRICAOORAL": ft.nutricaooral,
      "NUTRICAOGT": ft.nutricaogt,
      "NUTRICAOCNE": ft.nutricaocne,
      "NUTRICAOIV": ft.nutricaoiv,
      "ATIVIDADEVIDADIARIA": ft.atividadevidadiaria,
      "PAMAX": ft.pamax,
      "PAMIN": ft.pamin,
      "FC": ft.fc,
      "FR": ft.fr,
      "NIVELCONSCIENCIARM": ft.nivelconscienciarm,
      "NIVELCONSCIENCIARV": ft.nivelconscienciarv,
      "NIVELCONSCIENCIAAO": ft.nivelconscienciaao,
      "NIVELCONSCIENCIAPONTOS": ft.nivelconscienciapontos,
      "VENTILACAOMECANICA": ft.ventilacaomecanica,
      "VENTILADOR": ft.ventilador,
      "OSTOMIATRAQUEOSTOMIA": ft.ostomiatraqueostomia,
      "OSTOMIAGASTROSTOMIA": ft.ostomiagastrostomia,
      "OSTOMIACATETERNASOENTERAL": ft.ostomiacateternasoenteral,
      "OSTOMIACISTOSTOMIA": ft.ostomiacistostomia,
      "OSTOMIACOLOSTOMIA": ft.ostomiacolostomia,
      "OSTOMIAOUTROS": ft.ostomiaoutros,
      "ASPIRACAOTRAQUEAL": ft.aspiracaotraqueal,
      "ACESSOVENOSO": ft.acessovenoso,
      "SUPORTEOXIGENIOCILINDRO": ft.suporteoxigeniocilindro,
      "SUPORTEOXIGENIOCONCENTRADOR": ft.suporteoxigenioconcentrador,
      "OXIGENOTERAPIA": ft.oxigenoterapia,
      "SOLICITAREXAME": ft.solicitarexame,
      "MUDANCAPRESCRICAO": ft.mudancaprescricao,
      "PROBLEMAS": ft.problemas,
      "ORIENTACAO": ft.orientacao,
      "ASSINATURAPACIENTE": ft.assinaturapaciente,
      "ASSINATURAPROFISSIONAL": ft.assinaturaprofissional,
      "LATITUDE": ft.latitude,
      "LONGITUDE": ft.longitude,
      "NMPACIENTE": ft.nmpaciente
    };
    return await db.insert("TB_FICHAMEDICA", linha);
  }

  Future<List<Map<String, dynamic>>> listarFichas(int? idperson) async {
    Database db = await CriaBanco.instance.database;
    return await db.rawQuery(
        "SELECT * FROM TB_FICHAMEDICA WHERE IDPROFESSIONAL = $idperson");
  }

  void excluir(int codigo) async {
    Database db = await CriaBanco.instance.database;
    await db.delete("TB_FICHAMEDICA", where: "ID = ?", whereArgs: [codigo]);
  }
}
