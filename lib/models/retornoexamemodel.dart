// ignore_for_file: unnecessary_new, prefer_collection_literals

class RetornoExameModel {
  int? idadmission;
  int? idprofessional;
  String? dataretorno;
  String? acompanhante;
  String? observacao;

  RetornoExameModel(
      {this.idadmission,
        this.idprofessional,
        this.dataretorno,
        this.acompanhante,
        this.observacao});

  RetornoExameModel.fromJson(Map<String, dynamic> json) {
    idadmission = json['idadmission'];
    idprofessional = json['idprofessional'];
    dataretorno = json['dataretorno'];
    acompanhante = json['acompanhante'];
    observacao = json['observacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idadmission'] = idadmission;
    data['idprofessional'] = idprofessional;
    data['dataretorno'] = dataretorno;
    data['acompanhante'] = acompanhante;
    data['observacao'] = observacao;
    return data;
  }
}
