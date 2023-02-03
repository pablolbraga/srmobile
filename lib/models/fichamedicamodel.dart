// ignore_for_file: unnecessary_new, prefer_collection_literals

class FichaMedicaModel {
  int? idadmission;
  int? idprofessional;
  int? idcapconsult;
  int? idprofagenda;
  String? datainicio;
  String? datafim;
  String? hd;
  String? acompanhante;
  String? situacaoclinica;
  String? justificativaatendimentodomiciliar;
  int? fisioterapiamotora;
  int? fisioterapiarespiratoria;
  int? nutricionista;
  int? fonoterapia;
  int? enfermagem;
  int? terapiaocupacional;
  int? psicologo;
  String? examefisico;
  String? antibiotico;
  int? nutricaooral;
  int? nutricaogt;
  int? nutricaocne;
  int? nutricaoiv;
  int? atividadevidadiaria;
  int? pamax;
  int? pamin;
  String? fc;
  String? fr;
  int? nivelconscienciarm;
  int? nivelconscienciarv;
  int? nivelconscienciaao;
  int? nivelconscienciapontos;
  int? ventilacaomecanica;
  String? ventilador;
  int? ostomiatraqueostomia;
  int? ostomiagastrostomia;
  int? ostomiacateternasoenteral;
  int? ostomiacistostomia;
  int? ostomiacolostomia;
  String? ostomiaoutros;
  int? aspiracaotraqueal;
  int? acessovenoso;
  int? suporteoxigeniocilindro;
  int? suporteoxigenioconcentrador;
  int? oxigenoterapia;
  int? solicitarexame;
  int? mudancaprescricao;
  String? problemas;
  String? orientacao;
  String? assinaturapaciente;
  String? assinaturaprofissional;
  String? latitude;
  String? longitude;

  FichaMedicaModel(
      {this.idadmission,
      this.idprofessional,
      this.idcapconsult,
      this.idprofagenda,
      this.datainicio,
      this.datafim,
      this.hd,
      this.acompanhante,
      this.situacaoclinica,
      this.justificativaatendimentodomiciliar,
      this.fisioterapiamotora,
      this.fisioterapiarespiratoria,
      this.nutricionista,
      this.fonoterapia,
      this.enfermagem,
      this.terapiaocupacional,
      this.psicologo,
      this.examefisico,
      this.antibiotico,
      this.nutricaooral,
      this.nutricaogt,
      this.nutricaocne,
      this.nutricaoiv,
      this.atividadevidadiaria,
      this.pamax,
      this.pamin,
      this.fc,
      this.fr,
      this.nivelconscienciarm,
      this.nivelconscienciarv,
      this.nivelconscienciaao,
      this.nivelconscienciapontos,
      this.ventilacaomecanica,
      this.ventilador,
      this.ostomiatraqueostomia,
      this.ostomiagastrostomia,
      this.ostomiacateternasoenteral,
      this.ostomiacistostomia,
      this.ostomiacolostomia,
      this.ostomiaoutros,
      this.aspiracaotraqueal,
      this.acessovenoso,
      this.suporteoxigeniocilindro,
      this.suporteoxigenioconcentrador,
      this.oxigenoterapia,
      this.solicitarexame,
      this.mudancaprescricao,
      this.problemas,
      this.orientacao,
      this.assinaturapaciente,
      this.assinaturaprofissional,
      this.latitude,
      this.longitude});

  FichaMedicaModel.fromJson(Map<String, dynamic> json) {
    idadmission = json['idadmission'];
    idprofessional = json['idprofessional'];
    idcapconsult = json['idcapconsult'];
    idprofagenda = json['idprofagenda'];
    datainicio = json['datainicio'];
    datafim = json['datafim'];
    hd = json['hd'];
    acompanhante = json['acompanhante'];
    situacaoclinica = json['situacaoclinica'];
    justificativaatendimentodomiciliar =
        json['justificativaatendimentodomiciliar'];
    fisioterapiamotora = json['fisioterapiamotora'];
    fisioterapiarespiratoria = json['fisioterapiarespiratoria'];
    nutricionista = json['nutricionista'];
    fonoterapia = json['fonoterapia'];
    enfermagem = json['enfermagem'];
    terapiaocupacional = json['terapiaocupacional'];
    psicologo = json['psicologo'];
    examefisico = json['examefisico'];
    antibiotico = json['antibiotico'];
    nutricaooral = json['nutricaooral'];
    nutricaogt = json['nutricaogt'];
    nutricaocne = json['nutricaocne'];
    nutricaoiv = json['nutricaoiv'];
    atividadevidadiaria = json['atividadevidadiaria'];
    pamax = json['pamax'];
    pamin = json['pamin'];
    fc = json['fc'];
    fr = json['fr'];
    nivelconscienciarm = json['nivelconscienciarm'];
    nivelconscienciarv = json['nivelconscienciarv'];
    nivelconscienciaao = json['nivelconscienciaao'];
    nivelconscienciapontos = json['nivelconscienciapontos'];
    ventilacaomecanica = json['ventilacaomecanica'];
    ventilador = json['ventilador'];
    ostomiatraqueostomia = json['ostomiatraqueostomia'];
    ostomiagastrostomia = json['ostomiagastrostomia'];
    ostomiacateternasoenteral = json['ostomiacateternasoenteral'];
    ostomiacistostomia = json['ostomiacistostomia'];
    ostomiacolostomia = json['ostomiacolostomia'];
    ostomiaoutros = json['ostomiaoutros'];
    aspiracaotraqueal = json['aspiracaotraqueal'];
    acessovenoso = json['acessovenoso'];
    suporteoxigeniocilindro = json['suporteoxigeniocilindro'];
    suporteoxigenioconcentrador = json['suporteoxigenioconcentrador'];
    oxigenoterapia = json['oxigenoterapia'];
    solicitarexame = json['solicitarexame'];
    mudancaprescricao = json['mudancaprescricao'];
    problemas = json['problemas'];
    orientacao = json['orientacao'];
    assinaturapaciente = json['assinaturapaciente'];
    assinaturaprofissional = json['assinaturaprofissional'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idadmission'] = idadmission;
    data['idprofessional'] = idprofessional;
    data['idcapconsult'] = idcapconsult;
    data['idprofagenda'] = idprofagenda;
    data['datainicio'] = datainicio;
    data['datafim'] = datafim;
    data['hd'] = hd;
    data['acompanhante'] = acompanhante;
    data['situacaoclinica'] = situacaoclinica;
    data['justificativaatendimentodomiciliar'] =
        justificativaatendimentodomiciliar;
    data['fisioterapiamotora'] = fisioterapiamotora;
    data['fisioterapiarespiratoria'] = fisioterapiarespiratoria;
    data['nutricionista'] = nutricionista;
    data['fonoterapia'] = fonoterapia;
    data['enfermagem'] = enfermagem;
    data['terapiaocupacional'] = terapiaocupacional;
    data['psicologo'] = psicologo;
    data['examefisico'] = examefisico;
    data['antibiotico'] = antibiotico;
    data['nutricaooral'] = nutricaooral;
    data['nutricaogt'] = nutricaogt;
    data['nutricaocne'] = nutricaocne;
    data['nutricaoiv'] = nutricaoiv;
    data['atividadevidadiaria'] = atividadevidadiaria;
    data['pamax'] = pamax;
    data['pamin'] = pamin;
    data['fc'] = fc;
    data['fr'] = fr;
    data['nivelconscienciarm'] = nivelconscienciarm;
    data['nivelconscienciarv'] = nivelconscienciarv;
    data['nivelconscienciaao'] = nivelconscienciaao;
    data['nivelconscienciapontos'] = nivelconscienciapontos;
    data['ventilacaomecanica'] = ventilacaomecanica;
    data['ventilador'] = ventilador;
    data['ostomiatraqueostomia'] = ostomiatraqueostomia;
    data['ostomiagastrostomia'] = ostomiagastrostomia;
    data['ostomiacateternasoenteral'] = ostomiacateternasoenteral;
    data['ostomiacistostomia'] = ostomiacistostomia;
    data['ostomiacolostomia'] = ostomiacolostomia;
    data['ostomiaoutros'] = ostomiaoutros;
    data['aspiracaotraqueal'] = aspiracaotraqueal;
    data['acessovenoso'] = acessovenoso;
    data['suporteoxigeniocilindro'] = suporteoxigeniocilindro;
    data['suporteoxigenioconcentrador'] = suporteoxigenioconcentrador;
    data['oxigenoterapia'] = oxigenoterapia;
    data['solicitarexame'] = solicitarexame;
    data['mudancaprescricao'] = mudancaprescricao;
    data['problemas'] = problemas;
    data['orientacao'] = orientacao;
    data['assinaturapaciente'] = assinaturapaciente;
    data['assinaturaprofissional'] = assinaturaprofissional;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
