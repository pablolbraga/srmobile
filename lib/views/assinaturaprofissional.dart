import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';

class AssinaturaProfissional extends StatefulWidget {
  const AssinaturaProfissional({super.key});

  @override
  State<AssinaturaProfissional> createState() => _AssinaturaProfissionalState();
}

class _AssinaturaProfissionalState extends State<AssinaturaProfissional> {
  final _ctrAssinaturaProfissional = SignatureController(
      penStrokeWidth: 4,
      penColor: Colors.black,
      exportBackgroundColor: Colors.transparent);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _voltarTela,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Assinatura do Profissional"),
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
                      controller: _ctrAssinaturaProfissional,
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
                        if (_ctrAssinaturaProfissional.isNotEmpty) {
                          final Uint8List? dataProfissional =
                              await _ctrAssinaturaProfissional.toPngBytes();
                          if (dataProfissional != null) {
                            VariaveisGlobais.assinaturaProfissional =
                                base64Encode(dataProfissional);
                          }
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.undo),
                      color: Colors.blue,
                      onPressed: () async {
                        setState(() {
                          _ctrAssinaturaProfissional.undo();
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.redo),
                      color: Colors.blue,
                      onPressed: () async {
                        setState(() {
                          _ctrAssinaturaProfissional.redo();
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.clear),
                      color: Colors.blue,
                      onPressed: () async {
                        setState(() {
                          _ctrAssinaturaProfissional.clear();
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
    Navigator.pushNamed(context, "assinatura_paciente");
    return true;
  }
}
