import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';

class AssinaturaPaciente extends StatefulWidget {
  const AssinaturaPaciente({super.key});

  @override
  State<AssinaturaPaciente> createState() => _AssinaturaPacienteState();
}

class _AssinaturaPacienteState extends State<AssinaturaPaciente> {
  final _ctrAssinaturaPaciente = SignatureController(
      penStrokeWidth: 4,
      penColor: Colors.black,
      exportBackgroundColor: Colors.transparent);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _voltarTela,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Assinatura do Paciente"),
        ),
        body: Container(
          decoration: const BoxDecoration(color: Color(0xffD9EFF3)),
          child: ListView(
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Signature(
                      controller: _ctrAssinaturaPaciente,
                      height: 200,
                      backgroundColor: Colors.grey[200]!,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.black),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.check),
                      color: Colors.blue,
                      onPressed: () async {
                        if (_ctrAssinaturaPaciente.isNotEmpty) {
                          final Uint8List? dataPaciente =
                              await _ctrAssinaturaPaciente.toPngBytes();
                          if (dataPaciente != null) {
                            VariaveisGlobais.assinaturaPaciente =
                                base64Encode(dataPaciente);
                            Navigator.pushNamed(
                                context, "assinatura_profissional");
                          }
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.undo),
                      color: Colors.blue,
                      onPressed: () async {
                        setState(() {
                          _ctrAssinaturaPaciente.undo();
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.redo),
                      color: Colors.blue,
                      onPressed: () async {
                        setState(() {
                          _ctrAssinaturaPaciente.redo();
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.clear),
                      color: Colors.blue,
                      onPressed: () async {
                        setState(() {
                          _ctrAssinaturaPaciente.clear();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _voltarTela() async {
    switch (VariaveisGlobais.dadosUsuario?.idespecialidade) {
      case 148815: // Medico

        break;
      default:
        Navigator.pushNamed(context, "fichaterapia");
    }
    return true;
  }
}
