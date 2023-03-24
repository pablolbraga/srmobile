// ignore_for_file: unnecessary_new, prefer_collection_literals

class SolicitacaoPrescricaoEnfermagemModel {
  int? tipo;
  int? idprofissionalsolicitante;
  int? idpaciente;
  String? datasolicitacao;
  String? nmmaterial;
  String? quantidade;
  String? frequencia;
  String? posologia;
  String? via;
  String? duracao;
  String? observacao;
  String? justificativa;
  String? status;
  int? idadmission;

  SolicitacaoPrescricaoEnfermagemModel(
      {this.tipo,
        this.idprofissionalsolicitante,
        this.idpaciente,
        this.datasolicitacao,
        this.nmmaterial,
        this.quantidade,
        this.frequencia,
        this.posologia,
        this.via,
        this.duracao,
        this.observacao,
        this.justificativa,
        this.status,
        this.idadmission});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipo'] = tipo;
    data['idprofissionalsolicitante'] = idprofissionalsolicitante;
    data['idpaciente'] = idpaciente;
    data['datasolicitacao'] = datasolicitacao;
    data['nmmaterial'] = nmmaterial;
    data['quantidade'] = quantidade;
    data['frequencia'] = frequencia;
    data['posologia'] = posologia;
    data['via'] = via;
    data['duracao'] = duracao;
    data['observacao'] = observacao;
    data['justificativa'] = justificativa;
    data['status'] = status;
    data['idadmission'] = idadmission;
    return data;
  }
}
