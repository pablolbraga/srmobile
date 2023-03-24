class FichaNutricaoModel {
  int? idadmission;
  int? idprofessional;
  int? idcapconsult;
  int? idprofagenda;
  String? datainicio;
  String? datafim;
  String? assinaturapaciente;
  String? assinaturaprofissional;
  String? latitude;
  String? longitude;
  String? acompanhante;
  String? grupohas;
  String? grupodiabetes;
  String? grupodislipidemia;
  String? grupoimobilidade;
  String? grupoobesidade;
  String? grupodesnutricao;
  String? grupooutros;
  int? nutricao;
  int? nutricaotipoenteral;
  String? nutricaotipoenteraloutros;
  int? dietaenteral;
  String? dietaenteralentupimento;
  int? dietaindustipo;
  String? dietaindustmanipqtde;
  String? dietaindustmanipdesc;
  String? dietaindustprontaqtde;
  String? dietaindustprontadesc;
  String? dietaindustprontafab;
  int? dietaindustfornecedor;
  int? avalsubjingesta;
  int? avalsubjpesotipo;
  String? avalsubjpesoqtde;
  String? avalsubjpesotempo;
  String? avalsubjsintomadiarreia;
  String? avalsubjsintomahiporexia;
  String? avalsubjsintomaconstipacao;
  String? avalsubjsintomaoutros;
  String? avalsubjritmointestinal;
  String? avalantroaj;
  String? avalantropeso;
  String? avalantrocircabd;
  String? avalantroimc;
  String? avalantrocp;
  String? avalantroidade;
  String? avalantrodct;
  String? avalantrocb;
  String? avalantrocmb;
  String? avalantroaltura;
  int? diagnutriabaixo65;
  int? diagnutriacima65;
  String? diagnutridesc;
  String? manterconduta;
  String? conduta;

  FichaNutricaoModel(
      {this.idadmission,
        this.idprofessional,
        this.idcapconsult,
        this.idprofagenda,
        this.datainicio,
        this.datafim,
        this.assinaturapaciente,
        this.assinaturaprofissional,
        this.latitude,
        this.longitude,
        this.acompanhante,
        this.grupohas,
        this.grupodiabetes,
        this.grupodislipidemia,
        this.grupoimobilidade,
        this.grupoobesidade,
        this.grupodesnutricao,
        this.grupooutros,
        this.nutricao,
        this.nutricaotipoenteral,
        this.nutricaotipoenteraloutros,
        this.dietaenteral,
        this.dietaenteralentupimento,
        this.dietaindustipo,
        this.dietaindustmanipqtde,
        this.dietaindustmanipdesc,
        this.dietaindustprontaqtde,
        this.dietaindustprontadesc,
        this.dietaindustprontafab,
        this.dietaindustfornecedor,
        this.avalsubjingesta,
        this.avalsubjpesotipo,
        this.avalsubjpesoqtde,
        this.avalsubjpesotempo,
        this.avalsubjsintomadiarreia,
        this.avalsubjsintomahiporexia,
        this.avalsubjsintomaconstipacao,
        this.avalsubjsintomaoutros,
        this.avalsubjritmointestinal,
        this.avalantroaj,
        this.avalantropeso,
        this.avalantrocircabd,
        this.avalantroimc,
        this.avalantrocp,
        this.avalantroidade,
        this.avalantrodct,
        this.avalantrocb,
        this.avalantrocmb,
        this.avalantroaltura,
        this.diagnutriabaixo65,
        this.diagnutriacima65,
        this.diagnutridesc,
        this.manterconduta,
        this.conduta});

  FichaNutricaoModel.fromJson(Map<String, dynamic> json) {
    idadmission = json['idadmission'];
    idprofessional = json['idprofessional'];
    idcapconsult = json['idcapconsult'];
    idprofagenda = json['idprofagenda'];
    datainicio = json['datainicio'];
    datafim = json['datafim'];
    assinaturapaciente = json['assinaturapaciente'];
    assinaturaprofissional = json['assinaturaprofissional'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    acompanhante = json['acompanhante'];
    grupohas = json['grupohas'];
    grupodiabetes = json['grupodiabetes'];
    grupodislipidemia = json['grupodislipidemia'];
    grupoimobilidade = json['grupoimobilidade'];
    grupoobesidade = json['grupoobesidade'];
    grupodesnutricao = json['grupodesnutricao'];
    grupooutros = json['grupooutros'];
    nutricao = json['nutricao'];
    nutricaotipoenteral = json['nutricaotipoenteral'];
    nutricaotipoenteraloutros = json['nutricaotipoenteraloutros'];
    dietaenteral = json['dietaenteral'];
    dietaenteralentupimento = json['dietaenteralentupimento'];
    dietaindustipo = json['dietaindustipo'];
    dietaindustmanipqtde = json['dietaindustmanipqtde'];
    dietaindustmanipdesc = json['dietaindustmanipdesc'];
    dietaindustprontaqtde = json['dietaindustprontaqtde'];
    dietaindustprontadesc = json['dietaindustprontadesc'];
    dietaindustprontafab = json['dietaindustprontafab'];
    dietaindustfornecedor = json['dietaindustfornecedor'];
    avalsubjingesta = json['avalsubjingesta'];
    avalsubjpesotipo = json['avalsubjpesotipo'];
    avalsubjpesoqtde = json['avalsubjpesoqtde'];
    avalsubjpesotempo = json['avalsubjpesotempo'];
    avalsubjsintomadiarreia = json['avalsubjsintomadiarreia'];
    avalsubjsintomahiporexia = json['avalsubjsintomahiporexia'];
    avalsubjsintomaconstipacao = json['avalsubjsintomaconstipacao'];
    avalsubjsintomaoutros = json['avalsubjsintomaoutros'];
    avalsubjritmointestinal = json['avalsubjritmointestinal'];
    avalantroaj = json['avalantroaj'];
    avalantropeso = json['avalantropeso'];
    avalantrocircabd = json['avalantrocircabd'];
    avalantroimc = json['avalantroimc'];
    avalantrocp = json['avalantrocp'];
    avalantroidade = json['avalantroidade'];
    avalantrodct = json['avalantrodct'];
    avalantrocb = json['avalantrocb'];
    avalantrocmb = json['avalantrocmb'];
    avalantroaltura = json['avalantroaltura'];
    diagnutriabaixo65 = json['diagnutriabaixo65'];
    diagnutriacima65 = json['diagnutriacima65'];
    diagnutridesc = json['diagnutridesc'];
    manterconduta = json['manterconduta'];
    conduta = json['conduta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idadmission'] = idadmission;
    data['idprofessional'] = idprofessional;
    data['idcapconsult'] = idcapconsult;
    data['idprofagenda'] = idprofagenda;
    data['datainicio'] = datainicio;
    data['datafim'] = datafim;
    data['assinaturapaciente'] = assinaturapaciente;
    data['assinaturaprofissional'] = assinaturaprofissional;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['acompanhante'] = acompanhante;
    data['grupohas'] = grupohas;
    data['grupodiabetes'] = grupodiabetes;
    data['grupodislipidemia'] = grupodislipidemia;
    data['grupoimobilidade'] = grupoimobilidade;
    data['grupoobesidade'] = grupoobesidade;
    data['grupodesnutricao'] = grupodesnutricao;
    data['grupooutros'] = grupooutros;
    data['nutricao'] = nutricao;
    data['nutricaotipoenteral'] = nutricaotipoenteral;
    data['nutricaotipoenteraloutros'] = nutricaotipoenteraloutros;
    data['dietaenteral'] = dietaenteral;
    data['dietaenteralentupimento'] = dietaenteralentupimento;
    data['dietaindustipo'] = dietaindustipo;
    data['dietaindustmanipqtde'] = dietaindustmanipqtde;
    data['dietaindustmanipdesc'] = dietaindustmanipdesc;
    data['dietaindustprontaqtde'] = dietaindustprontaqtde;
    data['dietaindustprontadesc'] = dietaindustprontadesc;
    data['dietaindustprontafab'] = dietaindustprontafab;
    data['dietaindustfornecedor'] = dietaindustfornecedor;
    data['avalsubjingesta'] = avalsubjingesta;
    data['avalsubjpesotipo'] = avalsubjpesotipo;
    data['avalsubjpesoqtde'] = avalsubjpesoqtde;
    data['avalsubjpesotempo'] = avalsubjpesotempo;
    data['avalsubjsintomadiarreia'] = avalsubjsintomadiarreia;
    data['avalsubjsintomahiporexia'] = avalsubjsintomahiporexia;
    data['avalsubjsintomaconstipacao'] = avalsubjsintomaconstipacao;
    data['avalsubjsintomaoutros'] = avalsubjsintomaoutros;
    data['avalsubjritmointestinal'] = avalsubjritmointestinal;
    data['avalantroaj'] = avalantroaj;
    data['avalantropeso'] = avalantropeso;
    data['avalantrocircabd'] = avalantrocircabd;
    data['avalantroimc'] = avalantroimc;
    data['avalantrocp'] = avalantrocp;
    data['avalantroidade'] = avalantroidade;
    data['avalantrodct'] = avalantrodct;
    data['avalantrocb'] = avalantrocb;
    data['avalantrocmb'] = avalantrocmb;
    data['avalantroaltura'] = avalantroaltura;
    data['diagnutriabaixo65'] = diagnutriabaixo65;
    data['diagnutriacima65'] = diagnutriacima65;
    data['diagnutridesc'] = diagnutridesc;
    data['manterconduta'] = manterconduta;
    data['conduta'] = conduta;
    return data;
  }
}
