// ignore_for_file: unnecessary_new, prefer_collection_literals

class FichaEnfermagemModel {
  int? idadmission;
  int? idprofessional;
  int? idcapconsult;
  int? idprofagenda;
  String? datainicio;
  String? datafim;
  String? acompanhante;
  String? hospital;
  int? cuidadobanho;
  int? cuidadovestir;
  int? cuidadotransferencia;
  int? cuidadocontinencia;
  int? cuidadoalimentacao;
  int? utilizacaotqt;
  int? utilizacaocne;
  int? utilizacaogt;
  int? utilizacaocvd;
  int? utilizacaooutros;
  String? utilizacaooutrostexto;
  int? oxigenoterapiacilindro;
  int? oxigenoterapiaconcentrador;
  int? oxigenoterapiacontinuo;
  int? oxigenoterapianao;
  int? ventilacaomecanica;
  String? ventilacaomecanicaequipamento;
  int? pamax;
  int? pamin;
  int? feridapressao;
  int? feridavasculogencia;
  int? feridacirurgia;
  String? feridaoutros;
  int? diag001;
  int? diag002;
  int? diag003;
  int? diag004;
  int? diag005;
  int? diag006;
  int? diag007;
  int? diag008;
  int? diag009;
  int? diag010;
  int? diag011;
  int? diag012;
  int? diag013;
  int? diag014;
  int? diag015;
  int? proc001;
  int? proc002;
  int? proc003;
  int? proc004;
  int? proc005;
  int? proc006;
  int? proc007;
  int? proc008;
  int? procoutros;
  String? procoutrostexto;
  int? cuid001;
  int? cuid002;
  int? cuid003;
  int? cuid004;
  int? cuid005;
  int? cuid006;
  int? cuid007;
  int? cuid008;
  int? cuidoutros;
  String? cuidoutrostexto;
  int? bradenpercepcaosensorial;
  int? bradenumidade;
  int? bradenatividade;
  int? bradenmobilidade;
  int? bradennutricao;
  int? bradenficcao;
  String? observacao;
  String? assinaturapaciente;
  String? assinaturaprofissional;
  String? latitude;
  String? longitude;

  FichaEnfermagemModel(
      {this.idadmission,
      this.idprofessional,
      this.idcapconsult,
      this.idprofagenda,
      this.datainicio,
      this.datafim,
      this.acompanhante,
      this.hospital,
      this.cuidadobanho,
      this.cuidadovestir,
      this.cuidadotransferencia,
      this.cuidadocontinencia,
      this.cuidadoalimentacao,
      this.utilizacaotqt,
      this.utilizacaocne,
      this.utilizacaogt,
      this.utilizacaocvd,
      this.utilizacaooutros,
      this.utilizacaooutrostexto,
      this.oxigenoterapiacilindro,
      this.oxigenoterapiaconcentrador,
      this.oxigenoterapiacontinuo,
      this.oxigenoterapianao,
      this.ventilacaomecanica,
      this.ventilacaomecanicaequipamento,
      this.pamax,
      this.pamin,
      this.feridapressao,
      this.feridavasculogencia,
      this.feridacirurgia,
      this.feridaoutros,
      this.diag001,
      this.diag002,
      this.diag003,
      this.diag004,
      this.diag005,
      this.diag006,
      this.diag007,
      this.diag008,
      this.diag009,
      this.diag010,
      this.diag011,
      this.diag012,
      this.diag013,
      this.diag014,
      this.diag015,
      this.proc001,
      this.proc002,
      this.proc003,
      this.proc004,
      this.proc005,
      this.proc006,
      this.proc007,
      this.proc008,
      this.procoutros,
      this.procoutrostexto,
      this.cuid001,
      this.cuid002,
      this.cuid003,
      this.cuid004,
      this.cuid005,
      this.cuid006,
      this.cuid007,
      this.cuid008,
      this.cuidoutros,
      this.cuidoutrostexto,
      this.bradenpercepcaosensorial,
      this.bradenumidade,
      this.bradenatividade,
      this.bradenmobilidade,
      this.bradennutricao,
      this.bradenficcao,
      this.observacao,
      this.assinaturapaciente,
      this.assinaturaprofissional,
      this.latitude,
      this.longitude});

  FichaEnfermagemModel.fromJson(Map<String, dynamic> json) {
    idadmission = json['idadmission'];
    idprofessional = json['idprofessional'];
    idcapconsult = json['idcapconsult'];
    idprofagenda = json['idprofagenda'];
    datainicio = json['datainicio'];
    datafim = json['datafim'];
    acompanhante = json['acompanhante'];
    hospital = json['hospital'];
    cuidadobanho = json['cuidadobanho'];
    cuidadovestir = json['cuidadovestir'];
    cuidadotransferencia = json['cuidadotransferencia'];
    cuidadocontinencia = json['cuidadocontinencia'];
    cuidadoalimentacao = json['cuidadoalimentacao'];
    utilizacaotqt = json['utilizacaotqt'];
    utilizacaocne = json['utilizacaocne'];
    utilizacaogt = json['utilizacaogt'];
    utilizacaocvd = json['utilizacaocvd'];
    utilizacaooutros = json['utilizacaooutros'];
    utilizacaooutrostexto = json['utilizacaooutrostexto'];
    oxigenoterapiacilindro = json['oxigenoterapiacilindro'];
    oxigenoterapiaconcentrador = json['oxigenoterapiaconcentrador'];
    oxigenoterapiacontinuo = json['oxigenoterapiacontinuo'];
    oxigenoterapianao = json['oxigenoterapianao'];
    ventilacaomecanica = json['ventilacaomecanica'];
    ventilacaomecanicaequipamento = json['ventilacaomecanicaequipamento'];
    pamax = json['pamax'];
    pamin = json['pamin'];
    feridapressao = json['feridapressao'];
    feridavasculogencia = json['feridavasculogencia'];
    feridacirurgia = json['feridacirurgia'];
    feridaoutros = json['feridaoutros'];
    diag001 = json['diag001'];
    diag002 = json['diag002'];
    diag003 = json['diag003'];
    diag004 = json['diag004'];
    diag005 = json['diag005'];
    diag006 = json['diag006'];
    diag007 = json['diag007'];
    diag008 = json['diag008'];
    diag009 = json['diag009'];
    diag010 = json['diag010'];
    diag011 = json['diag011'];
    diag012 = json['diag012'];
    diag013 = json['diag013'];
    diag014 = json['diag014'];
    diag015 = json['diag015'];
    proc001 = json['proc001'];
    proc002 = json['proc002'];
    proc003 = json['proc003'];
    proc004 = json['proc004'];
    proc005 = json['proc005'];
    proc006 = json['proc006'];
    proc007 = json['proc007'];
    proc008 = json['proc008'];
    procoutros = json['procoutros'];
    procoutrostexto = json['procoutrostexto'];
    cuid001 = json['cuid001'];
    cuid002 = json['cuid002'];
    cuid003 = json['cuid003'];
    cuid004 = json['cuid004'];
    cuid005 = json['cuid005'];
    cuid006 = json['cuid006'];
    cuid007 = json['cuid007'];
    cuid008 = json['cuid008'];
    cuidoutros = json['cuidoutros'];
    cuidoutrostexto = json['cuidoutrostexto'];
    bradenpercepcaosensorial = json['bradenpercepcaosensorial'];
    bradenumidade = json['bradenumidade'];
    bradenatividade = json['bradenatividade'];
    bradenmobilidade = json['bradenmobilidade'];
    bradennutricao = json['bradennutricao'];
    bradenficcao = json['bradenficcao'];
    observacao = json['observacao'];
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
    data['acompanhante'] = acompanhante;
    data['hospital'] = hospital;
    data['cuidadobanho'] = cuidadobanho;
    data['cuidadovestir'] = cuidadovestir;
    data['cuidadotransferencia'] = cuidadotransferencia;
    data['cuidadocontinencia'] = cuidadocontinencia;
    data['cuidadoalimentacao'] = cuidadoalimentacao;
    data['utilizacaotqt'] = utilizacaotqt;
    data['utilizacaocne'] = utilizacaocne;
    data['utilizacaogt'] = utilizacaogt;
    data['utilizacaocvd'] = utilizacaocvd;
    data['utilizacaooutros'] = utilizacaooutros;
    data['utilizacaooutrostexto'] = utilizacaooutrostexto;
    data['oxigenoterapiacilindro'] = oxigenoterapiacilindro;
    data['oxigenoterapiaconcentrador'] = oxigenoterapiaconcentrador;
    data['oxigenoterapiacontinuo'] = oxigenoterapiacontinuo;
    data['oxigenoterapianao'] = oxigenoterapianao;
    data['ventilacaomecanica'] = ventilacaomecanica;
    data['ventilacaomecanicaequipamento'] = ventilacaomecanicaequipamento;
    data['pamax'] = pamax;
    data['pamin'] = pamin;
    data['feridapressao'] = feridapressao;
    data['feridavasculogencia'] = feridavasculogencia;
    data['feridacirurgia'] = feridacirurgia;
    data['feridaoutros'] = feridaoutros;
    data['diag001'] = diag001;
    data['diag002'] = diag002;
    data['diag003'] = diag003;
    data['diag004'] = diag004;
    data['diag005'] = diag005;
    data['diag006'] = diag006;
    data['diag007'] = diag007;
    data['diag008'] = diag008;
    data['diag009'] = diag009;
    data['diag010'] = diag010;
    data['diag011'] = diag011;
    data['diag012'] = diag012;
    data['diag013'] = diag013;
    data['diag014'] = diag014;
    data['diag015'] = diag015;
    data['proc001'] = proc001;
    data['proc002'] = proc002;
    data['proc003'] = proc003;
    data['proc004'] = proc004;
    data['proc005'] = proc005;
    data['proc006'] = proc006;
    data['proc007'] = proc007;
    data['proc008'] = proc008;
    data['procoutros'] = procoutros;
    data['procoutrostexto'] = procoutrostexto;
    data['cuid001'] = cuid001;
    data['cuid002'] = cuid002;
    data['cuid003'] = cuid003;
    data['cuid004'] = cuid004;
    data['cuid005'] = cuid005;
    data['cuid006'] = cuid006;
    data['cuid007'] = cuid007;
    data['cuid008'] = cuid008;
    data['cuidoutros'] = cuidoutros;
    data['cuidoutrostexto'] = cuidoutrostexto;
    data['bradenpercepcaosensorial'] = bradenpercepcaosensorial;
    data['bradenumidade'] = bradenumidade;
    data['bradenatividade'] = bradenatividade;
    data['bradenmobilidade'] = bradenmobilidade;
    data['bradennutricao'] = bradennutricao;
    data['bradenficcao'] = bradenficcao;
    data['observacao'] = observacao;
    data['assinaturapaciente'] = assinaturapaciente;
    data['assinaturaprofissional'] = assinaturaprofissional;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
