// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/fichaterapiamodel.dart';

class FichaTerapia extends StatefulWidget {
  const FichaTerapia({super.key});

  @override
  State<FichaTerapia> createState() => _FichaTerapiaState();
}

class _FichaTerapiaState extends State<FichaTerapia> {
  var nomePaciente = VariaveisGlobais.dadosAgenda?.nmpaciente;
  String _selParticipacao = 'SELECIONE';
  String _selExecucao = 'SELECIONE';
  final _ctrEvolucao = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(nomePaciente!),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              InputDecorator(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  labelText: "Participação do Cliente",
                  labelStyle: TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selParticipacao,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.blue),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selParticipacao = newValue!;
                      });
                    },
                    items: LISTA_FICHATERAPIA_PARTICIPACAO
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InputDecorator(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  labelText: "Execução das Técnicas",
                  labelStyle: TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selExecucao,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.blue),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selExecucao = newValue!;
                      });
                    },
                    items: LISTA_FICHATERAPIA_EXECUCAO
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _ctrEvolucao,
                style: const TextStyle(fontSize: 15, color: Colors.blue),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                maxLength: 500,
                decoration: InputDecoration(
                    labelText: 'Evolução',
                    labelStyle: const TextStyle(color: Colors.blue),
                    errorStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: const Text(
                    "gravar",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    _validarCampos();
                  },
                ),
              ),
            ],
          ),
        ),
        onWillPop: _voltarTela);
  }

  Future<bool> _voltarTela() async {
    Navigator.pushNamed(context, "agenda");
    return true;
  }

  void _validarCampos() {
    if (_selParticipacao != "SELECIONE") {
      if (_selExecucao != "SELECIONE") {
        if (_ctrEvolucao.text != '') {
          enviarFicha();
        } else {
          Uteis.mostrarAviso(context, "Aviso", "Evolução não informada.");
        }
      } else {
        Uteis.mostrarAviso(
            context, "Aviso", "Execução de Técnicas não informada.");
      }
    } else {
      Uteis.mostrarAviso(
          context, "Aviso", "Participação do Cliente não seleciondado.");
    }
  }

  void enviarFicha() {
    FichaTerapiaModel ficha = FichaTerapiaModel();
    ficha.idadmission = VariaveisGlobais.dadosAgenda?.idadmission;
    ficha.idprofessional = VariaveisGlobais.dadosUsuario?.idperson;
    ficha.idcapconsult = VariaveisGlobais.dadosAgenda?.idcapconsult;
    ficha.idprofagenda = VariaveisGlobais.dadosAgenda?.idprofagenda;
    ficha.datainicio = VariaveisGlobais.dataInicioAtendimento;
    ficha.participacaocliente = _selParticipacao;
    ficha.execucaotecnicaproposta = _selExecucao;
    ficha.observacao = _ctrEvolucao.text;
    VariaveisGlobais.dadosFichaTerapia = ficha;
  }
}
