// ignore_for_file: unnecessary_new, prefer_collection_literals

class SolicitacaoExameModel {
  String? nmsolicitante;
  int? idadmission;
  String? nmpaciente;
  int? tipoalteracao;
  String? exames;
  String? observacao;
  String? justificativa;

  SolicitacaoExameModel(
      {this.nmsolicitante,
      this.idadmission,
      this.nmpaciente,
      this.tipoalteracao,
      this.exames,
      this.observacao,
      this.justificativa});

  SolicitacaoExameModel.fromJson(Map<String, dynamic> json) {
    nmsolicitante = json['nmsolicitante'];
    idadmission = json['idadmission'];
    nmpaciente = json['nmpaciente'];
    tipoalteracao = json['tipoalteracao'];
    exames = json['exames'];
    observacao = json['observacao'];
    justificativa = json['justificativa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nmsolicitante'] = nmsolicitante;
    data['idadmission'] = idadmission;
    data['nmpaciente'] = nmpaciente;
    data['tipoalteracao'] = tipoalteracao;
    data['exames'] = exames;
    data['observacao'] = observacao;
    data['justificativa'] = justificativa;
    return data;
  }
}
