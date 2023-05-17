// ignore_for_file: unnecessary_new, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:srmobile/helpers/constantes.dart';

class EsqueceuSenha extends StatefulWidget {
  const EsqueceuSenha({super.key});

  @override
  State<EsqueceuSenha> createState() => _EsqueceuSenhaState();
}

class _EsqueceuSenhaState extends State<EsqueceuSenha> {
  final TextEditingController _ctrLogin = TextEditingController();
  String _mensagemErro = "";
  late ProgressDialog pr;
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context, showLogs: true);
    pr.style(message: "Enviando solicitação...");
    return WillPopScope(
      onWillPop: _voltarTela,
      child: Scaffold(
        appBar: AppBar(title: const Text("Esqueceu a senha?")),
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
                      controller: _ctrLogin,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Login",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.blue,
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
                        "Solicitar Senha",
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

  void _validarCampos() {
    String login = _ctrLogin.text;

    if (login.isNotEmpty) {
      setState(() {
        _mensagemErro = "";
        _enviarSenha();
      });
    } else {
      setState(() {
        _mensagemErro = "Login não informado.";
      });
    }
  }

  void _enviarSenha() {
    String url = URL_ESQUECEU_SENHA + _ctrLogin.text;
    pr.show();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      pr.hide().whenComplete(() async {
        Response response = await dio.get(url);
        if (response.statusCode == 200) {
          Navigator.pushNamed(context, "/");
        } else {
          setState(() {
            _mensagemErro =
                "Erro ao enviar a senha. Tente novamente mais tarde.";
          });
        }
      });
    });
  }
}
