// ignore_for_file: unnecessary_new, prefer_collection_literals

class SolicitacaoEquipamentoModel {
  String? nmsolicitante;
  int? idadmission;
  int? idusuario;
  int? idpaciente;
  int? idperson;
  String? nmpaciente;
  int? tipoalteracao;
  String? equipamento;
  String? observacao;
  String? justificativa;

  SolicitacaoEquipamentoModel(
      {this.nmsolicitante,
      this.idadmission,
      this.idusuario,
      this.idpaciente,
      this.idperson,
      this.nmpaciente,
      this.tipoalteracao,
      this.equipamento,
      this.observacao,
      this.justificativa});

  SolicitacaoEquipamentoModel.fromJson(Map<String, dynamic> json) {
    nmsolicitante = json['nmsolicitante'];
    idadmission = json['idadmission'];
    idusuario = json['idusuario'];
    idpaciente = json['idpaciente'];
    idperson = json['idperson'];
    nmpaciente = json['nmpaciente'];
    tipoalteracao = json['tipoalteracao'];
    equipamento = json['equipamento'];
    observacao = json['observacao'];
    justificativa = json['justificativa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nmsolicitante'] = nmsolicitante;
    data['idadmission'] = idadmission;
    data['idusuario'] = idusuario;
    data['idpaciente'] = idpaciente;
    data['idperson'] = idperson;
    data['nmpaciente'] = nmpaciente;
    data['tipoalteracao'] = tipoalteracao;
    data['equipamento'] = equipamento;
    data['observacao'] = observacao;
    data['justificativa'] = justificativa;
    return data;
  }
}
