// ignore_for_file: unnecessary_new, unused_local_variable, unused_field, prefer_is_empty

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';

class AlterarSenha extends StatefulWidget {
  const AlterarSenha({super.key});

  @override
  State<AlterarSenha> createState() => _AlterarSenhaState();
}

class _AlterarSenhaState extends State<AlterarSenha> {
  final TextEditingController _ctrConfirmarSenha = TextEditingController();
  final TextEditingController _ctrSenha = TextEditingController();
  bool _esconderSenha = true;
  bool _esconderConfirmarSenha = true;
  String _mensagemErro = "";
  late ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context, showLogs: true);
    pr.style(message: "Validando dados...");
    return WillPopScope(
      onWillPop: _voltarTela,
      child: Scaffold(
        appBar: AppBar(title: const Text("Alterar Senha")),
        body: Container(
          decoration: const BoxDecoration(color: Color(0xffD9EFF3)),
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TextField(
                      controller: _ctrSenha,
                      obscureText: _esconderSenha,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Senha",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _mostrarSenha();
                          },
                          icon: Icon(
                            _esconderSenha == true
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TextField(
                      controller: _ctrConfirmarSenha,
                      obscureText: _esconderConfirmarSenha,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Confirmar Senha",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _mostrarConfirmarSenha();
                          },
                          icon: Icon(
                            _esconderConfirmarSenha == true
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        "Gravar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        _validarCampos();
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Center(
                      child: Text(
                        _mensagemErro,
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _voltarTela() async {
    Navigator.pushNamed(context, "/");
    return true;
  }

  void _mostrarSenha() {
    setState(() {
      _esconderSenha = !_esconderSenha;
    });
  }

  void _mostrarConfirmarSenha() {
    setState(() {
      _esconderConfirmarSenha = !_esconderConfirmarSenha;
    });
  }

  void _validarCampos() {
    String confirmarSenha = _ctrConfirmarSenha.text;
    String senha = _ctrSenha.text;

    if (confirmarSenha.isNotEmpty) {
      if (senha.isNotEmpty) {
        if (senha == confirmarSenha) {
          setState(() {
            _mensagemErro = "";
            _enviarDados();
          });
        } else {
          setState(() {
            _mensagemErro = "Senhas estão diferentes";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Senha não informada.";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Confirmação de senha não informada.";
      });
    }
  }

  void _enviarDados() async {
    var idperson = VariaveisGlobais.dadosUsuario?.idusuario;
    pr.show();
    String url = "$URL_ALTERAR_SENHA${idperson.toString()}/${_ctrSenha.text}";
    Future.delayed(const Duration(seconds: 5)).then((value) {
      pr.hide().whenComplete(() async {
        Response response = await Dio().get(url);
        if (response.statusCode == 200) {
          String retorno = response.data.toString();
          if (retorno == "true") {
            setState(() {
              _mensagemErro = "";
              Navigator.pushNamed(context, "/");
            });
          } else {
            setState(() {
              _mensagemErro =
                  "Erro em alterar a senha. Tente novamente mais tarde.";
            });
          }
        } else {
          setState(() {
            _mensagemErro =
                "Erro em alterar a senha. Tente novamente mais tarde.";
          });
        }
      });
    });
  }
}
