// ignore_for_file: prefer_collection_literals, unnecessary_new

class EquipamentoModel {
  int? idequipamento;
  String? nome;
  int? quantidade;

  EquipamentoModel({this.idequipamento, this.nome, this.quantidade});

  EquipamentoModel.fromJson(Map<String, dynamic> json) {
    idequipamento = json['idequipamento'];
    nome = json['nome'];
    quantidade = json['quantidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idequipamento'] = idequipamento;
    data['nome'] = nome;
    data['quantidade'] = quantidade;
    return data;
  }
}
