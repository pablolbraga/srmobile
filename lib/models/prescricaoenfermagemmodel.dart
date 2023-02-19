// ignore_for_file: unnecessary_new, prefer_collection_literals

class PrescricaoEnfermagemModel {
  int? id;
  int? idpatient;
  int? idprescricao;
  int? idadmission;
  String? nmpaciente;
  int? idproduto;
  String? nmproduto;
  String? quantidade;
  String? unidmed;
  String? frequencia;
  String? nmprocedimento;

  PrescricaoEnfermagemModel(
      {this.id,
      this.idpatient,
      this.idprescricao,
      this.idadmission,
      this.nmpaciente,
      this.idproduto,
      this.nmproduto,
      this.quantidade,
      this.unidmed,
      this.frequencia,
      this.nmprocedimento});

  PrescricaoEnfermagemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idpatient = json['idpatient'];
    idprescricao = json['idprescricao'];
    idadmission = json['idadmission'];
    nmpaciente = json['nmpaciente'];
    idproduto = json['idproduto'];
    nmproduto = json['nmproduto'];
    quantidade = json['quantidade'];
    unidmed = json['unidmed'];
    frequencia = json['frequencia'];
    nmprocedimento = json['nmprocedimento'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['idpatient'] = idpatient;
    data['idprescricao'] = idprescricao;
    data['idadmission'] = idadmission;
    data['nmpaciente'] = nmpaciente;
    data['idproduto'] = idproduto;
    data['nmproduto'] = nmproduto;
    data['quantidade'] = quantidade;
    data['unidmed'] = unidmed;
    data['frequencia'] = frequencia;
    data['nmprocedimento'] = nmprocedimento;
    return data;
  }
}
