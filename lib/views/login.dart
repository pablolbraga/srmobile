// ignore_for_file: unnecessary_new, unused_local_variable, unused_field, prefer_is_empty

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/models/usuariomodel.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _ctrLogin = TextEditingController();
  final TextEditingController _ctrSenha = TextEditingController();
  bool _esconderSenha = true;
  String _mensagemErro = "";
  bool _serviceStatus = false;
  late LocationPermission permission;
  bool _hasPermission = false;
  late ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context, showLogs: true);
    pr.style(message: "Validando dados...");
    _validarPermissoes();
    return WillPopScope(
      onWillPop: _voltarTela,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Color(0xffD9EFF3)),
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      "images/LogoNovaTransparente.png",
                      width: 300,
                      height: 250,
                    ),
                  ),
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        "Acessar",
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
                      child: GestureDetector(
                        child: const Text(
                          "Esqueceu a senha? Clique aqui.",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () {
                          setState(() {
                            _esqueceuSenha();
                          });
                        },
                      ),
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

  void _validarCampos() {
    String login = _ctrLogin.text;
    String senha = _ctrSenha.text;

    if (login.isNotEmpty) {
      if (senha.isNotEmpty) {
        setState(() {
          _mensagemErro = "";
          _acessarSistema();
        });
      } else {
        setState(() {
          _mensagemErro = "Senha não informada.";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Login não informado.";
      });
    }
  }

  void _esqueceuSenha() {
    Navigator.pushNamed(context, "esqueceusenha");
  }

  void _acessarSistema() async {
    pr.show();
    String url = "$URL_VALIDAR_LOGIN_SENHA${_ctrLogin.text}/${_ctrSenha.text}";
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      var usuarios = (response.data as List).map((item) {
        return UsuarioModel.fromJson(item);
      }).toList();
      Future.delayed(const Duration(seconds: 5)).then((value) {
        pr.hide().whenComplete(() {
          if (usuarios.length > 0) {
            if (usuarios[0].primeiroacesso == "S") {
              // Acessa a tela para colocar uma nova senha
            } else {
              // Acesso validado. Vai para à página de opções
            }
          } else {
            setState(() {
              _mensagemErro = "Login e/ou senha incorreto(s)";
            });
          }
        });
      });
    } else {
      setState(() {
        _mensagemErro = "Erro ao acessar o sistema.";
      });
    }
  }

  void _validarPermissoes() async {
    _serviceStatus = await Geolocator.isLocationServiceEnabled();
    if (_serviceStatus) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _hasPermission = false;
            _mensagemErro = "As permissões de localização foram negadas.";
          });
        } else if (permission == LocationPermission.deniedForever) {
          setState(() {
            _hasPermission = false;
            _mensagemErro =
                "AS permissões de localização estão negadas permanentemente.";
          });
        } else {
          _hasPermission = true;
        }
      } else {
        _hasPermission = true;
      }
    } else {
      setState(() {
        _hasPermission = false;
        _mensagemErro = "O serviço de GPS não está ativada. Ative o GPS";
      });
    }
  }
}
