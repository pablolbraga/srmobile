//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/models/solicitacaoequipamentomodel.dart';
import 'package:uno/uno.dart';
import 'package:validatorless/validatorless.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';

class EquipamentoCad extends StatefulWidget {
  const EquipamentoCad({super.key});

  @override
  State<EquipamentoCad> createState() => _EquipamentoCadState();
}

class _EquipamentoCadState extends State<EquipamentoCad> {
  final _formKey = GlobalKey<FormState>();
  late ProgressDialog pr;
  final _ctrEquipamento = TextEditingController();
  final _ctrObservacao = TextEditingController();
  final _ctrJustificativa = TextEditingController();
  int? tipoalteracao = 0;
  final uno = Uno();

  @override
  void dispose() {
    _ctrEquipamento.dispose();
    _ctrObservacao.dispose();
    _ctrJustificativa.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context, showLogs: true);
    pr.style(message: "Enviando dados...");
    if (VariaveisGlobais.dadosEquipamento != null) {
      String? nmequip = VariaveisGlobais.dadosEquipamento?.nome;
      _ctrEquipamento.text = nmequip!;
      tipoalteracao = 2;
    } else {
      tipoalteracao = 1;
    }

    return WillPopScope(
      onWillPop: _voltarTela,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Equipamentos"),
        ),
        // ignore: prefer_const_constructors
        body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                criarTextFormField(
                    _ctrEquipamento, "Equipamento", "", false, false),
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
                        _enviarDados();
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
    Navigator.pushNamed(context, "equipamentopesq");
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
      SolicitacaoEquipamentoModel sol = SolicitacaoEquipamentoModel();
      sol.nmsolicitante = VariaveisGlobais.dadosUsuario?.nome;
      sol.idadmission = VariaveisGlobais.dadosPaciente?.idadmission;
      sol.idusuario = VariaveisGlobais.dadosUsuario?.idusuario;
      sol.idpaciente = VariaveisGlobais.dadosPaciente?.idpatient;
      sol.idperson = VariaveisGlobais.dadosUsuario?.idperson;
      sol.nmpaciente = VariaveisGlobais.dadosPaciente?.nome;
      sol.tipoalteracao = tipoalteracao;
      sol.equipamento = _ctrEquipamento.text;
      sol.observacao = _ctrObservacao.text;
      sol.justificativa = _ctrJustificativa.text;
      //Dio dio = Dio();
      Response response =
          await uno.post(URL_ALTERAR_EQUIPAMENTO, data: sol.toJson());
      Future.delayed(const Duration(seconds: 10)).then((value) {
        pr.hide().whenComplete(() {
          if (response.status == 200) {
            Navigator.pushNamed(context, "equipamentopesq");
          } else {
            Uteis.mostrarAviso(context, "Erro",
                "Erro ao enviar os dados. Erro: ${response.status}, $response");
          }
        });
      });
    } catch (ex) {
      Uteis.mostrarAviso(context, "Erro", "Erro ao enviar os dados. Erro: $ex");
    }
  }
}
