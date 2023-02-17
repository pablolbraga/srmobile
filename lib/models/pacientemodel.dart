class PacienteModel {
  int? idadmission;
  String? nome;
  String? nmconvenio;
  String? nmservico;
  int? idpatient;

  PacienteModel(
      {this.idadmission,
      this.nome,
      this.nmconvenio,
      this.nmservico,
      this.idpatient});

  PacienteModel.fromJson(Map<String, dynamic> json) {
    idadmission = json['idadmission'];
    nome = json['nome'];
    nmconvenio = json['nmconvenio'];
    nmservico = json['nmservico'];
    idpatient = json['idpatient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idadmission'] = idadmission;
    data['nome'] = nome;
    data['nmconvenio'] = nmconvenio;
    data['nmservico'] = nmservico;
    data['idpatient'] = idpatient;
    return data;
  }
}
