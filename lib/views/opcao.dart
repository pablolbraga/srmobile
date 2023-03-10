// ignore_for_file: unnecessary_new, unused_local_variable, unused_field, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';

class Opcao extends StatefulWidget {
  const Opcao({super.key});

  @override
  State<Opcao> createState() => _OpcaoState();
}

class _OpcaoState extends State<Opcao> {
  @override
  Widget build(BuildContext context) {
    var habilitaBotao =
        VariaveisGlobais.dadosUsuario?.idespecialidade == 148815 ||
            VariaveisGlobais.dadosUsuario?.idespecialidade == 122632 ||
            VariaveisGlobais.dadosUsuario?.idespecialidade == 243379;
    return WillPopScope(
      onWillPop: _voltarTela,
      child: Scaffold(
        appBar: AppBar(title: const Text("Selecione uma opção")),
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        "Agenda",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "agenda");
                      },
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
                        "Visitas Realizadas",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "visitasrealizadasfiltro");
                      },
                    ),
                  ),
                  Visibility(
                    visible: habilitaBotao,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(32),
                          ),
                        ),
                        child: const Text(
                          "Pacientes",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "pacientes");
                        },
                      ),
                    ),
                  )
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
}
