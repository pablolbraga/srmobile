// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class UsuarioModel {
  int? idusuario;
  String? nome;
  String? login;
  String? email;
  int? idperson;
  String? primeiroacesso;
  int? idespecialidade;
  String? apelido;
  String? nmespecialidade;
  String? registro;

  UsuarioModel(
      {this.idusuario,
      this.nome,
      this.login,
      this.email,
      this.idperson,
      this.primeiroacesso,
      this.idespecialidade,
      this.apelido,
      this.nmespecialidade,
      this.registro});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    idusuario = json['idusuario'];
    nome = json['nome'];
    login = json['login'];
    email = json['email'];
    idperson = json['idperson'];
    primeiroacesso = json['primeiroacesso'];
    idespecialidade = json['idespecialidade'];
    apelido = json['apelido'];
    nmespecialidade = json['nmespecialidade'];
    registro = json['registro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idusuario'] = this.idusuario;
    data['nome'] = this.nome;
    data['login'] = this.login;
    data['email'] = this.email;
    data['idperson'] = this.idperson;
    data['primeiroacesso'] = this.primeiroacesso;
    data['idespecialidade'] = this.idespecialidade;
    data['apelido'] = this.apelido;
    data['nmespecialidade'] = this.nmespecialidade;
    data['registro'] = this.registro;
    return data;
  }
}
