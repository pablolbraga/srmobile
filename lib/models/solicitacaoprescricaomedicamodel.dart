class SolicitacaoPrescricaoMedicaModel {
  int? idusuariosolicitante;
  String? datasolicitacao;
  int? idpaciente;
  String? observacaosolicitante;
  String? justificativa;
  String? medicamento;
  String? dose;
  String? posologia;
  String? status;
  String? duracao;
  String? via;
  int? idadmission;
  int? tipoenvio;
  int? tipoalteracao;

  SolicitacaoPrescricaoMedicaModel(
      {this.idusuariosolicitante,
        this.datasolicitacao,
        this.idpaciente,
        this.observacaosolicitante,
        this.justificativa,
        this.medicamento,
        this.dose,
        this.posologia,
        this.status,
        this.duracao,
        this.via,
        this.idadmission,
        this.tipoenvio,
        this.tipoalteracao});

  SolicitacaoPrescricaoMedicaModel.fromJson(Map<String, dynamic> json) {
    idusuariosolicitante = json['idusuariosolicitante'];
    datasolicitacao = json['datasolicitacao'];
    idpaciente = json['idpaciente'];
    observacaosolicitante = json['observacaosolicitante'];
    justificativa = json['justificativa'];
    medicamento = json['medicamento'];
    dose = json['dose'];
    posologia = json['posologia'];
    status = json['status'];
    duracao = json['duracao'];
    via = json['via'];
    idadmission = json['idadmission'];
    tipoenvio = json['tipoenvio'];
    tipoalteracao = json['tipoalteracao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idusuariosolicitante'] = idusuariosolicitante;
    data['datasolicitacao'] = datasolicitacao;
    data['idpaciente'] = idpaciente;
    data['observacaosolicitante'] = observacaosolicitante;
    data['justificativa'] = justificativa;
    data['medicamento'] = medicamento;
    data['dose'] = dose;
    data['posologia'] = posologia;
    data['status'] = status;
    data['duracao'] = duracao;
    data['via'] = via;
    data['idadmission'] = idadmission;
    data['tipoenvio'] = tipoenvio;
    data['tipoalteracao'] = tipoalteracao;
    return data;
  }
}
