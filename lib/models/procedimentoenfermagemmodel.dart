// ignore_for_file: unnecessary_new, unnecessary_this

class ProcedimentoEnfermagemModel {
  int? idprocedimento;
  int? idprescricao;
  String? nmprocedimento;
  String? nmfrequencia;

  ProcedimentoEnfermagemModel(
      {this.idprocedimento,
      this.idprescricao,
      this.nmprocedimento,
      this.nmfrequencia});

  ProcedimentoEnfermagemModel.fromJson(Map<String, dynamic> json) {
    idprocedimento = json['idprocedimento'];
    idprescricao = json['idprescricao'];
    nmprocedimento = json['nmprocedimento'];
    nmfrequencia = json['nmfrequencia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idprocedimento'] = this.idprocedimento;
    data['idprescricao'] = this.idprescricao;
    data['nmprocedimento'] = this.nmprocedimento;
    data['nmfrequencia'] = this.nmfrequencia;
    return data;
  }
}
