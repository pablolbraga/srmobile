// ignore_for_file: prefer_collection_literals

class PrescricaoMedicaModel {
  int? id;
  int? idproduto;
  String? nmproduto;
  String? quantidade;
  String? unidmed;
  String? frequencia;
  String? instrucao;
  String? horarios;
  String? via;

  PrescricaoMedicaModel(
      {this.id,
      this.idproduto,
      this.nmproduto,
      this.quantidade,
      this.unidmed,
      this.frequencia,
      this.instrucao,
      this.horarios,
      this.via});

  PrescricaoMedicaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idproduto = json['idproduto'];
    nmproduto = json['nmproduto'];
    quantidade = json['quantidade'];
    unidmed = json['unidmed'];
    frequencia = json['frequencia'];
    instrucao = json['instrucao'];
    horarios = json['horarios'];
    via = json['via'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['idproduto'] = idproduto;
    data['nmproduto'] = nmproduto;
    data['quantidade'] = quantidade;
    data['unidmed'] = unidmed;
    data['frequencia'] = frequencia;
    data['instrucao'] = instrucao;
    data['horarios'] = horarios;
    data['via'] = via;
    return data;
  }
}
