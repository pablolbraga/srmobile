// ignore_for_file: prefer_collection_literals, unnecessary_new

class FichaTecnicoBaseModel {
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
  int? tipochamada;
  int? administracaomed;
  int? administracaomediv;
  int? administracaomedim;
  int? administracaomedsc;
  int? clister;
  int? curativo;
  int? cateterismovesicalalivio;
  int? cateterismovericalurina;
  int? cuidadogerais;
  int? ecg;
  int? puncao;
  int? retiradapontos;
  String? outrosprocedimentos;
  String? abd;
  String? algodao;
  String? agulha;
  String? alcool;
  String? atadura;
  String? cateter;
  String? equipo;
  String? extensor1via;
  String? extensor2via;
  String? gazeacolchoada;
  String? gazeembebida;
  String? gazeesteril;
  String? heparina;
  String? ivfix;
  String? jelco;
  String? bisturi;
  String? luvaesteril;
  String? luvaprocedimento;
  String? mascara;
  String? micropore2510;
  String? micropore5010;
  String? scalp;
  String? seringa;
  String? sorofisiologico;
  String? outrosmateriais;
  String? medicamentos;
  String? evolucao;

  FichaTecnicoBaseModel(
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
      this.tipochamada,
      this.administracaomed,
      this.administracaomediv,
      this.administracaomedim,
      this.administracaomedsc,
      this.clister,
      this.curativo,
      this.cateterismovesicalalivio,
      this.cateterismovericalurina,
      this.cuidadogerais,
      this.ecg,
      this.puncao,
      this.retiradapontos,
      this.outrosprocedimentos,
      this.abd,
      this.algodao,
      this.agulha,
      this.alcool,
      this.atadura,
      this.cateter,
      this.equipo,
      this.extensor1via,
      this.extensor2via,
      this.gazeacolchoada,
      this.gazeembebida,
      this.gazeesteril,
      this.heparina,
      this.ivfix,
      this.jelco,
      this.bisturi,
      this.luvaesteril,
      this.luvaprocedimento,
      this.mascara,
      this.micropore2510,
      this.micropore5010,
      this.scalp,
      this.seringa,
      this.sorofisiologico,
      this.outrosmateriais,
      this.medicamentos,
      this.evolucao});

  FichaTecnicoBaseModel.fromJson(Map<String, dynamic> json) {
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
    tipochamada = json['tipochamada'];
    administracaomed = json['administracaomed'];
    administracaomediv = json['administracaomediv'];
    administracaomedim = json['administracaomedim'];
    administracaomedsc = json['administracaomedsc'];
    clister = json['clister'];
    curativo = json['curativo'];
    cateterismovesicalalivio = json['cateterismovesicalalivio'];
    cateterismovericalurina = json['cateterismovericalurina'];
    cuidadogerais = json['cuidadogerais'];
    ecg = json['ecg'];
    puncao = json['puncao'];
    retiradapontos = json['retiradapontos'];
    outrosprocedimentos = json['outrosprocedimentos'];
    abd = json['abd'];
    algodao = json['algodao'];
    agulha = json['agulha'];
    alcool = json['alcool'];
    atadura = json['atadura'];
    cateter = json['cateter'];
    equipo = json['equipo'];
    extensor1via = json['extensor1via'];
    extensor2via = json['extensor2via'];
    gazeacolchoada = json['gazeacolchoada'];
    gazeembebida = json['gazeembebida'];
    gazeesteril = json['gazeesteril'];
    heparina = json['heparina'];
    ivfix = json['ivfix'];
    jelco = json['jelco'];
    bisturi = json['bisturi'];
    luvaesteril = json['luvaesteril'];
    luvaprocedimento = json['luvaprocedimento'];
    mascara = json['mascara'];
    micropore2510 = json['micropore2510'];
    micropore5010 = json['micropore5010'];
    scalp = json['scalp'];
    seringa = json['seringa'];
    sorofisiologico = json['sorofisiologico'];
    outrosmateriais = json['outrosmateriais'];
    medicamentos = json['medicamentos'];
    evolucao = json['evolucao'];
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
    data['tipochamada'] = tipochamada;
    data['administracaomed'] = administracaomed;
    data['administracaomediv'] = administracaomediv;
    data['administracaomedim'] = administracaomedim;
    data['administracaomedsc'] = administracaomedsc;
    data['clister'] = clister;
    data['curativo'] = curativo;
    data['cateterismovesicalalivio'] = cateterismovesicalalivio;
    data['cateterismovericalurina'] = cateterismovericalurina;
    data['cuidadogerais'] = cuidadogerais;
    data['ecg'] = ecg;
    data['puncao'] = puncao;
    data['retiradapontos'] = retiradapontos;
    data['outrosprocedimentos'] = outrosprocedimentos;
    data['abd'] = abd;
    data['algodao'] = algodao;
    data['agulha'] = agulha;
    data['alcool'] = alcool;
    data['atadura'] = atadura;
    data['cateter'] = cateter;
    data['equipo'] = equipo;
    data['extensor1via'] = extensor1via;
    data['extensor2via'] = extensor2via;
    data['gazeacolchoada'] = gazeacolchoada;
    data['gazeembebida'] = gazeembebida;
    data['gazeesteril'] = gazeesteril;
    data['heparina'] = heparina;
    data['ivfix'] = ivfix;
    data['jelco'] = jelco;
    data['bisturi'] = bisturi;
    data['luvaesteril'] = luvaesteril;
    data['luvaprocedimento'] = luvaprocedimento;
    data['mascara'] = mascara;
    data['micropore2510'] = micropore2510;
    data['micropore5010'] = micropore5010;
    data['scalp'] = scalp;
    data['seringa'] = seringa;
    data['sorofisiologico'] = sorofisiologico;
    data['outrosmateriais'] = outrosmateriais;
    data['medicamentos'] = medicamentos;
    data['evolucao'] = evolucao;
    return data;
  }
}
