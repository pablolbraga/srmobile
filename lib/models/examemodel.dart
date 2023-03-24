// ignore_for_file: unnecessary_new, prefer_collection_literals

class ExameModel {
  int? id;
  int? idimagem;
  int? idexame;
  String? nmexame;
  String? datareq;
  String? dataprogres;
  String? datarealres;
  String? nmsolicitante;

  ExameModel(
      {this.id,
        this.idimagem,
        this.idexame,
        this.nmexame,
        this.datareq,
        this.dataprogres,
        this.datarealres,
        this.nmsolicitante});

  ExameModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idimagem = json['idimagem'];
    idexame = json['idexame'];
    nmexame = json['nmexame'];
    datareq = json['datareq'];
    dataprogres = json['dataprogres'];
    datarealres = json['datarealres'];
    nmsolicitante = json['nmsolicitante'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['idimagem'] = idimagem;
    data['idexame'] = idexame;
    data['nmexame'] = nmexame;
    data['datareq'] = datareq;
    data['dataprogres'] = dataprogres;
    data['datarealres'] = datarealres;
    data['nmsolicitante'] = nmsolicitante;
    return data;
  }
}
