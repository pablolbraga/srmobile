// ignore_for_file: use_build_context_synchronously, unnecessary_new

import 'package:date_format/date_format.dart';
//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/solicitacaomedicamentomodel.dart';
import 'package:uno/uno.dart';

class PrescricaoMedicaCad extends StatefulWidget {
  const PrescricaoMedicaCad({super.key});

  @override
  State<PrescricaoMedicaCad> createState() => _PrescricaoMedicaCadState();
}

class _PrescricaoMedicaCadState extends State<PrescricaoMedicaCad> {
  late ProgressDialog pr;
  final _ctrMedicamento = TextEditingController();
  final _ctrFrequencia = TextEditingController();
  final _ctrPosologia = TextEditingController();
  final _ctrObservacao = TextEditingController();
  final _ctrJustificativa = TextEditingController();
  final _ctrDuracao = TextEditingController();
  final uno = Uno();
  String _selVia = '';
  String _selTipoEnvio = '';
  int? tipoalteracao = 0;

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context, showLogs: true);
    pr.style(message: "Validando dados...");
    if (VariaveisGlobais.dadosPrescricaoMedica != null) {
      String? nmmedicamento = VariaveisGlobais.dadosPrescricaoMedica?.nmproduto;
      _ctrMedicamento.text = nmmedicamento!;

      String? quantidade = VariaveisGlobais.dadosPrescricaoMedica?.quantidade;
      _ctrPosologia.text = quantidade!;

      String? frequencia = VariaveisGlobais.dadosPrescricaoMedica?.frequencia;
      _ctrFrequencia.text = frequencia!;

      String? via = VariaveisGlobais.dadosPrescricaoMedica?.via;
      _selVia = via!;

      tipoalteracao = 2;
    } else {
      tipoalteracao = 1;
    }
    return WillPopScope(
      onWillPop: _voltarTela,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Presc. Médica"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            criarTextFormField(_ctrMedicamento, "Medicamento",
                "Medicamento não informada", false, false),
            const SizedBox(height: 10),
            criarTextFormField(_ctrPosologia, "Posologia",
                "Posologia não informada", false, false),
            const SizedBox(height: 10),
            //criaDropDownButton(
            //    context, "Via", _selVia, LISTA_PRESCRICAOMEDICA_VIAS),
            InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                labelText: "Via",
                labelStyle: const TextStyle(color: Colors.blue),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selVia,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blue,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.blue),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selVia = newValue!;
                    });
                  },
                  items: LISTA_PRESCRICAOMEDICA_VIAS,
                ),
              ),
            ),
            const SizedBox(height: 10),
            criarTextFormField(
                _ctrDuracao, "Duração", "Duração não informada", false, false),
            const SizedBox(height: 10),
            //criaDropDownButton(context, "Tipo do Envio", _selTipoEnvio,
            //    LISTA_PRESCRICAOMEDICA_TIPOENVIO),

            InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                labelText: "Tipo do Envio",
                labelStyle: const TextStyle(color: Colors.blue),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selTipoEnvio,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blue,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.blue),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selTipoEnvio = newValue!;
                    });
                  },
                  items: LISTA_PRESCRICAOMEDICA_TIPOENVIO,
                ),
              ),
            ),

            const SizedBox(height: 10),
            criarTextFormField(_ctrObservacao, "Observação", "", false, true),
            const SizedBox(height: 10),
            criarTextFormField(_ctrJustificativa, "Justificativa",
                "Justificativa não informada", false, true),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32))),
                  child: const Text(
                    "Gravar",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () {
                    _validarCampos();
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _voltarTela() async {
    Navigator.pushNamed(context, "prescricaomedicapesq");
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
          validator: (value) {
            if (value!.isEmpty) return avisoNaoPreenchimento;
            return null;
          }),
    );
  }

  void _validarCampos() {
    if (_ctrMedicamento.text != "") {
      if (_ctrPosologia.text != "") {
        if (_selVia != "") {
          if (_ctrDuracao.text != "") {
            if (_ctrJustificativa.text != "") {
              if (_selTipoEnvio != "") {
                _enviarDados();
              } else {
                Uteis.mostrarAviso(
                    context, "Aviso", "Tipo de Envio não selecionado.");
              }
            } else {
              Uteis.mostrarAviso(
                  context, "Aviso", "Justificativa não informada.");
            }
          } else {
            Uteis.mostrarAviso(context, "Aviso", "Duração não informada.");
          }
        } else {
          Uteis.mostrarAviso(context, "Aviso", "Via não informada.");
        }
      } else {
        Uteis.mostrarAviso(context, "Aviso", "Posologia não informada.");
      }
    } else {
      Uteis.mostrarAviso(context, "Aviso", "Medicamento não informado.");
    }
  }

  void _enviarDados() {
    pr.show();
    try {
      SolicitacaoMedicamentoModel sol = SolicitacaoMedicamentoModel();
      sol.idusuariosolicitante = VariaveisGlobais.dadosUsuario?.idusuario;
      sol.datasolicitacao = formatDate(
          DateTime.now(), [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn, ':', ss]);
      sol.idpaciente = VariaveisGlobais.dadosPaciente?.idpatient;
      sol.observacaosolicitante = _ctrObservacao.text;
      sol.justificativa = _ctrJustificativa.text;
      sol.medicamento = _ctrMedicamento.text;
      sol.dose = "";
      sol.posologia = _ctrPosologia.text;
      sol.status = "";
      sol.duracao = _ctrDuracao.text;
      sol.via = _selVia;
      sol.idadmission = VariaveisGlobais.dadosPaciente?.idadmission;
      sol.tipoalteracao = tipoalteracao;
      sol.tipoenvio = int.tryParse(_selTipoEnvio);
      Future.delayed(const Duration(seconds: 10)).then((value) {
        pr.hide().whenComplete(() async {
          Response response =
              await uno.post(URL_ALTERAR_PRESCRICAO_MEDICA, data: sol.toJson());
          if (response.status == 200) {
            Navigator.pushNamed(context, "prescricaomedicapesq");
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
