// ignore_for_file: unnecessary_new, prefer_collection_literals

class AgendaModel {
  int? idcapconsult;
  int? idadmission;
  int? idpatient;
  int? idperson;
  String? nmpaciente;
  int? idconvenio;
  String? nmconvenio;
  int? idade;
  int? idprofagenda;
  int? idevolucao;

  AgendaModel(
      {this.idcapconsult,
      this.idadmission,
      this.idpatient,
      this.idperson,
      this.nmpaciente,
      this.idconvenio,
      this.nmconvenio,
      this.idade,
      this.idprofagenda,
      this.idevolucao});

  AgendaModel.fromJson(Map<String, dynamic> json) {
    idcapconsult = json['idcapconsult'];
    idadmission = json['idadmission'];
    idpatient = json['idpatient'];
    idperson = json['idperson'];
    nmpaciente = json['nmpaciente'];
    idconvenio = json['idconvenio'];
    nmconvenio = json['nmconvenio'];
    idade = json['idade'];
    idprofagenda = json['idprofagenda'];
    idevolucao = json['idevolucao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idcapconsult'] = idcapconsult;
    data['idadmission'] = idadmission;
    data['idpatient'] = idpatient;
    data['idperson'] = idperson;
    data['nmpaciente'] = nmpaciente;
    data['idconvenio'] = idconvenio;
    data['nmconvenio'] = nmconvenio;
    data['idade'] = idade;
    data['idprofagenda'] = idprofagenda;
    data['idevolucao'] = idevolucao;
    return data;
  }
}
