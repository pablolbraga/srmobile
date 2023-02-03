// ignore_for_file: unnecessary_this

import 'package:srmobile/models/fichamedicamodel.dart';

class FichaMedicaDbModel extends FichaMedicaModel {
  int? id;
  String? nmpaciente;

  FichaMedicaDbModel({this.id, this.nmpaciente});

  FichaMedicaDbModel.fromMapObject(Map<String, dynamic> map) {
    this.id = map['ID'];
    this.nmpaciente = map['NMPACIENTE'];
    this.idadmission = map['IDADMISSION'];
    this.idprofessional = map['IDPROFESSIONAL'];
    this.idcapconsult = map['IDCAPCONSULT'];
    this.idprofagenda = map['IDPROFAGENDA'];
    this.datainicio = map['DATAINICIO'];
    this.datafim = map['DATAFIM'];
    this.hd = map['HD'];
    this.acompanhante = map['ACOMPANHANTE'];
    this.situacaoclinica = map['SITUACAOCLINICA'];
    this.justificativaatendimentodomiciliar =
        map['JUSTIFICATIVAATENDIMENTODOMICILIAR'];
    this.fisioterapiamotora = map["FISIOTERAPIAMOTORA"];
    this.fisioterapiarespiratoria = map["FISIOTERAPIARESPIRATORIA"];
    this.nutricionista = map["NUTRICIONISTA"];
    this.fonoterapia = map["FONOTERAPIA"];
    this.enfermagem = map["ENFERMAGEM"];
    this.terapiaocupacional = map["TERAPIAOCUPACIONAL"];
    this.psicologo = map["PSICOLOGO"];
    this.examefisico = map["EXAMEFISICO"];
    this.antibiotico = map["ANTIBIOTICO"];
    this.nutricaooral = map["NUTRICAOORAL"];
    this.nutricaogt = map["NUTRICAOGT"];
    this.nutricaocne = map["NUTRICAOCNE"];
    this.nutricaoiv = map["NUTRICAOIV"];
    this.atividadevidadiaria = map["ATIVIDADEVIDADIARIA"];
    this.pamax = map["PAMAX"];
    this.pamin = map["PAMIN"];
    this.fc = map["FC"];
    this.fr = map["FR"];
    this.nivelconscienciarm = map["NIVELCONSCIENCIARM"];
    this.nivelconscienciarv = map["NIVELCONSCIENCIARV"];
    this.nivelconscienciaao = map["NIVELCONSCIENCIAAO"];
    this.nivelconscienciapontos = map["NIVELCONSCIENCIAPONTOS"];
    this.ventilacaomecanica = map["VENTILACAOMECANICA"];
    this.ventilador = map["VENTILADOR"];
    this.ostomiatraqueostomia = map["OSTOMIATRAQUEOSTOMIA"];
    this.ostomiagastrostomia = map["OSTOMIAGASTROSTOMIA"];
    this.ostomiacateternasoenteral = map["OSTOMIACATETERNASOENTERAL"];
    this.ostomiacistostomia = map["OSTOMIACISTOSTOMIA"];
    this.ostomiacolostomia = map["OSTOMIACOLOSTOMIA"];
    this.ostomiaoutros = map["OSTOMIAOUTROS"];
    this.aspiracaotraqueal = map["ASPIRACAOTRAQUEAL"];
    this.acessovenoso = map["ACESSOVENOSO"];
    this.suporteoxigeniocilindro = map["SUPORTEOXIGENIOCILINDRO"];
    this.suporteoxigenioconcentrador = map["SUPORTEOXIGENIOCONCENTRADOR"];
    this.oxigenoterapia = map["OXIGENOTERAPIA"];
    this.solicitarexame = map["SOLICITAREXAME"];
    this.mudancaprescricao = map["MUDANCAPRESCRICAO"];
    this.problemas = map["PROBLEMAS"];
    this.orientacao = map["ORIENTACAO"];
    this.assinaturapaciente = map['ASSINATURAPACIENTE'];
    this.assinaturaprofissional = map['ASSINATURAPROFISSIONAL'];
    this.latitude = map['LATITUDE'];
    this.longitude = map['LONGITUDE'];
  }
}
