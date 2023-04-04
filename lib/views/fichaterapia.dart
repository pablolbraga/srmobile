// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/models/fichaterapiamodel.dart';
import 'package:validatorless/validatorless.dart';

class FichaTerapia extends StatefulWidget {
  const FichaTerapia({super.key});

  @override
  State<FichaTerapia> createState() => _FichaTerapiaState();
}

class _FichaTerapiaState extends State<FichaTerapia> {
  final _formKey = GlobalKey<FormState>();
  var nomePaciente = VariaveisGlobais.dadosAgenda?.nmpaciente;
  String _selParticipacao = '';
  String _selExecucao = '';
  final _ctrEvolucao = TextEditingController();

  @override
  void dispose() {
    _ctrEvolucao.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(nomePaciente!),
          ),
          body: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  InputDecorator(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      labelText: "Participação do Cliente",
                      labelStyle: const TextStyle(color: Colors.blue),
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
                        items: LISTA_FICHATERAPIA_PARTICIPACAO,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputDecorator(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      labelText: "Execução das Técnicas",
                      labelStyle: const TextStyle(color: Colors.blue),
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
                        items: LISTA_FICHATERAPIA_EXECUCAO,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  criarTextFormField(_ctrEvolucao, "Evolução",
                      "Campo obrigatório", false, true),
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
                        var formValid = _formKey.currentState!.validate();
                        if (formValid) {
                          _validarCampos();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: _voltarTela);
  }

  Future<bool> _voltarTela() async {
    Navigator.pushNamed(context, "agenda");
    return true;
  }

  void _validarCampos() {
    if (_selParticipacao != "") {
      if (_selExecucao != "") {
        enviarFicha();
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
    ficha.idespecialidade = VariaveisGlobais.dadosUsuario?.idespecialidade;
    ficha.idcapconsult = VariaveisGlobais.dadosAgenda?.idcapconsult;
    ficha.idprofagenda = VariaveisGlobais.dadosAgenda?.idprofagenda;
    ficha.datainicio = VariaveisGlobais.dataInicioAtendimento;
    ficha.participacaocliente = _selParticipacao;
    ficha.execucaotecnicaproposta = _selExecucao;
    ficha.observacao = _ctrEvolucao.text;
    VariaveisGlobais.dadosFichaTerapia = ficha;
    Navigator.pushNamed(context, "assinatura_paciente");
  }

  InputDecorator criarTextFormField(
      TextEditingController controle,
      String titulo,
      String avisoNaoPreenchimento,
      bool inteiro,
      bool multilinha) {
    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        labelText: titulo,
        labelStyle: const TextStyle(color: Colors.blue),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      child: TextFormField(
          controller: controle,
          style: const TextStyle(fontSize: 15),
          keyboardType: inteiro == true
              ? TextInputType.number
              : multilinha == true
                  ? TextInputType.multiline
                  : TextInputType.text,
          maxLines: multilinha == true ? 5 : 1,
          maxLength: multilinha == true ? 500 : null,
          validator: avisoNaoPreenchimento != ""
              ? Validatorless.required(avisoNaoPreenchimento)
              : null),
    );
  }
}
