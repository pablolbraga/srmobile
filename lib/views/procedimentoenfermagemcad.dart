import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/models/solicitacaoprocedimentoenfermagemmodel.dart';
import 'package:validatorless/validatorless.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';

class ProcedimentoEnfermagemCad extends StatefulWidget {
  const ProcedimentoEnfermagemCad({super.key});

  @override
  State<ProcedimentoEnfermagemCad> createState() =>
      _ProcedimentoEnfermagemCadState();
}

class _ProcedimentoEnfermagemCadState extends State<ProcedimentoEnfermagemCad> {
  final _formKey = GlobalKey<FormState>();
  late ProgressDialog pr;
  final _ctrProcedimento = TextEditingController();
  final _ctrObservacao = TextEditingController();
  final _ctrJustificativa = TextEditingController();
  int? tipoalteracao = 0;
  String _selProcedimento = "";
  String? _selValorProcedimento = "";

  @override
  void dispose() {
    _ctrProcedimento.dispose();
    _ctrObservacao.dispose();
    _ctrJustificativa.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context, showLogs: true);
    pr.style(message: "Enviando dados...");
    if (VariaveisGlobais.dadosProcedimentoEnfermagem != null) {
      String? nmproc =
          VariaveisGlobais.dadosProcedimentoEnfermagem?.nmprocedimento;
      _ctrProcedimento.text = nmproc!;
      tipoalteracao = 2;
    } else {
      tipoalteracao = 1;
    }

    return WillPopScope(
      onWillPop: _voltarTela,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Proc. Enfermagem"),
        ),
        // ignore: prefer_const_constructors
        body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Visibility(
                  visible: VariaveisGlobais.dadosProcedimentoEnfermagem != null,
                  child: criarTextFormField(
                      _ctrProcedimento, "Material", "", false, true),
                ),
                Visibility(
                  visible: VariaveisGlobais.dadosProcedimentoEnfermagem == null,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      labelText: "Tipo do Envio",
                      labelStyle: const TextStyle(color: Colors.blue),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selProcedimento,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.blue,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.blue),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selProcedimento = newValue!;
                          });
                        },
                        items: LISTA_PROCEDIMENTOENFERMAGEM_PROCEDIMENTO,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                criarTextFormField(
                    _ctrObservacao, "Observação", "", false, true),
                const SizedBox(height: 20),
                criarTextFormField(_ctrJustificativa, "Justificativa",
                    "Campo obrigatório", false, true),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32))),
                    child: const Text(
                      "Gravar",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      var formValid = _formKey.currentState!.validate();
                      if (formValid) {
                        _validarDados();
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _voltarTela() async {
    Navigator.pushNamed(context, "procedimentoenfermagempesq");
    return true;
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

  void _enviarDados() async {
    pr.show();
    try {
      SolicitacaoProcedimentoEnfermagemModel sol =
          SolicitacaoProcedimentoEnfermagemModel();
      sol.nmsolicitante = VariaveisGlobais.dadosUsuario?.nome;
      sol.idadmission = VariaveisGlobais.dadosPaciente?.idadmission;
      sol.tipoalteracao = tipoalteracao;
      sol.procedimento = _selValorProcedimento;
      sol.observacao = _ctrObservacao.text;
      sol.justificativa = _ctrJustificativa.text;
      sol.nmpaciente = VariaveisGlobais.dadosPaciente?.nome;
      Dio dio = Dio();
      Response response = await dio.post(URL_ALTERAR_PROCEDIMENTO_ENFERMAGEM,
          data: sol.toJson());
      Future.delayed(const Duration(seconds: 10)).then((value) {
        pr.hide().whenComplete(() {
          if (response.statusCode == 200) {
            Navigator.pushNamed(context, "procedimentoenfermagempesq");
          } else {
            Uteis.mostrarAviso(context, "Erro",
                "Erro ao enviar os dados. Erro: ${response.statusMessage}, $response");
          }
        });
      });
    } catch (ex) {
      Uteis.mostrarAviso(context, "Erro", "Erro ao enviar os dados. Erro: $ex");
    }
  }

  void _validarDados() {
    if (VariaveisGlobais.dadosProcedimentoEnfermagem != null) {
      _selValorProcedimento =
          VariaveisGlobais.dadosProcedimentoEnfermagem?.nmprocedimento;
    } else {
      _selValorProcedimento = _selProcedimento;
    }

    if (_selValorProcedimento != '') {
      if (_ctrJustificativa.text != "") {
        _enviarDados();
      } else {
        Uteis.mostrarAviso(context, "Aviso", "Justificativa não informada.");
      }
    } else {
      Uteis.mostrarAviso(context, 'Aviso', 'Procedimento não selecionado.');
    }
  }
}
