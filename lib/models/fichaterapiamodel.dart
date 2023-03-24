class FichaTerapiaModel {
  int? idadmission;
  int? idprofessional;
  int? idespecialidade;
  int? idcapconsult;
  int? idprofagenda;
  String? datainicio;
  String? datafim;
  String? participacaocliente;
  String? execucaotecnicaproposta;
  String? observacao;
  String? assinaturapaciente;
  String? assinaturaprofissional;
  String? latitude;
  String? longitude;

  FichaTerapiaModel(
      {this.idadmission,
        this.idprofessional,
        this.idespecialidade,
        this.idcapconsult,
        this.idprofagenda,
        this.datainicio,
        this.datafim,
        this.participacaocliente,
        this.execucaotecnicaproposta,
        this.observacao,
        this.assinaturapaciente,
        this.assinaturaprofissional,
        this.latitude,
        this.longitude});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idadmission'] = idadmission;
    data['idprofessional'] = idprofessional;
    data['idespecialidade'] = idespecialidade;
    data['idcapconsult'] = idcapconsult;
    data['idprofagenda'] = idprofagenda;
    data['datainicio'] = datainicio;
    data['datafim'] = datafim;
    data['participacaocliente'] = participacaocliente;
    data['execucaotecnicaproposta'] = execucaotecnicaproposta;
    data['observacao'] = observacao;
    data['assinaturapaciente'] = assinaturapaciente;
    data['assinaturaprofissional'] = assinaturaprofissional;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
