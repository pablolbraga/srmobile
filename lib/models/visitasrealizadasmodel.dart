class VisitasRealizadasModel {
  int? idevolution;
  int? idadmission;
  String? nmpaciente;
  int? idprofessional;
  String? nmprofessional;
  String? dataini;
  String? datafim;
  int? idprofagenda;
  int? idespecialidade;
  String? nmespecialidade;
  String? imagem;

  VisitasRealizadasModel(
      {this.idevolution,
        this.idadmission,
        this.nmpaciente,
        this.idprofessional,
        this.nmprofessional,
        this.dataini,
        this.datafim,
        this.idprofagenda,
        this.idespecialidade,
        this.nmespecialidade,
        this.imagem});

  VisitasRealizadasModel.fromJson(Map<String, dynamic> json) {
    idevolution = json['idevolution'];
    idadmission = json['idadmission'];
    nmpaciente = json['nmpaciente'];
    idprofessional = json['idprofessional'];
    nmprofessional = json['nmprofessional'];
    dataini = json['dataini'];
    datafim = json['datafim'];
    idprofagenda = json['idprofagenda'];
    idespecialidade = json['idespecialidade'];
    nmespecialidade = json['nmespecialidade'];
    imagem = json['imagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idevolution'] = idevolution;
    data['idadmission'] = idadmission;
    data['nmpaciente'] = nmpaciente;
    data['idprofessional'] = idprofessional;
    data['nmprofessional'] = nmprofessional;
    data['dataini'] = dataini;
    data['datafim'] = datafim;
    data['idprofagenda'] = idprofagenda;
    data['idespecialidade'] = idespecialidade;
    data['nmespecialidade'] = nmespecialidade;
    data['imagem'] = imagem;
    return data;
  }
}
