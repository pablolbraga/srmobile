// ignore_for_file: unnecessary_new, prefer_collection_literals

class IntercorrenciaModel {
  int? idadmission;
  int? grauurgencia;
  int? classificacao;
  int? tipointercorrencia;
  String? dataevento;
  String? datamaxima;
  String? horamaxima;
  String? nmprofissional;
  String? registroprofissional;
  String? descricao;
  String? acaotomada;

  IntercorrenciaModel(
      {this.idadmission,
        this.grauurgencia,
        this.classificacao,
        this.tipointercorrencia,
        this.dataevento,
        this.datamaxima,
        this.horamaxima,
        this.nmprofissional,
        this.registroprofissional,
        this.descricao,
        this.acaotomada});

  IntercorrenciaModel.fromJson(Map<String, dynamic> json) {
    idadmission = json['idadmission'];
    grauurgencia = json['grauurgencia'];
    classificacao = json['classificacao'];
    tipointercorrencia = json['tipointercorrencia'];
    dataevento = json['dataevento'];
    datamaxima = json['datamaxima'];
    horamaxima = json['horamaxima'];
    nmprofissional = json['nmprofissional'];
    registroprofissional = json['registroprofissional'];
    descricao = json['descricao'];
    acaotomada = json['acaotomada'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idadmission'] = idadmission;
    data['grauurgencia'] = grauurgencia;
    data['classificacao'] = classificacao;
    data['tipointercorrencia'] = tipointercorrencia;
    data['dataevento'] = dataevento;
    data['datamaxima'] = datamaxima;
    data['horamaxima'] = horamaxima;
    data['nmprofissional'] = nmprofissional;
    data['registroprofissional'] = registroprofissional;
    data['descricao'] = descricao;
    data['acaotomada'] = acaotomada;
    return data;
  }
}
