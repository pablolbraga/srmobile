// ignore_for_file: unnecessary_new, prefer_collection_literals

class SolicitacaoProcedimentoEnfermagemModel {
  String? nmsolicitante;
  int? idadmission;
  String? nmpaciente;
  int? tipoalteracao;
  String? procedimento;
  String? observacao;
  String? justificativa;

  SolicitacaoProcedimentoEnfermagemModel(
      {this.nmsolicitante,
      this.idadmission,
      this.nmpaciente,
      this.tipoalteracao,
      this.procedimento,
      this.observacao,
      this.justificativa});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nmsolicitante'] = nmsolicitante;
    data['idadmission'] = idadmission;
    data['nmpaciente'] = nmpaciente;
    data['tipoalteracao'] = tipoalteracao;
    data['procedimento'] = procedimento;
    data['observacao'] = observacao;
    data['justificativa'] = justificativa;
    return data;
  }
}
