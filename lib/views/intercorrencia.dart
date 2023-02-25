import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/models/intercorrenciamodel.dart';
import 'package:validatorless/validatorless.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';

class Intercorrencia extends StatefulWidget {
  const Intercorrencia({super.key});

  @override
  State<Intercorrencia> createState() => _IntercorrenciaState();
}

class _IntercorrenciaState extends State<Intercorrencia> {
  final _formKey = GlobalKey<FormState>();
  late ProgressDialog pr;
  final _ctrDataResolucao = TextEditingController();
  final _ctrHoraResolucao = TextEditingController();
  final _ctrDescricao = TextEditingController();
  final _ctrAcaoTomada = TextEditingController();

  String _selTipoOcorrencia = "";
  String _selGrauUrgencia = "";

  @override
  void dispose() {
    _ctrDataResolucao.dispose();
    _ctrHoraResolucao.dispose();
    _ctrDescricao.dispose();
    _ctrAcaoTomada.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context, showLogs: true);
    pr.style(message: "Enviando dados...");

    return WillPopScope(
      onWillPop: _voltarTela,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Intercorrência"),
        ),
        // ignore: prefer_const_constructors
        body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                InputDecorator(
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10.0),
                    labelText: "Data de Resolução",
                    labelStyle: const TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  child: TextFormField(
                    controller: _ctrDataResolucao,
                    style: const TextStyle(fontSize: 15),
                    keyboardType: TextInputType.text,
                    validator: Validatorless.required("Campo Obrigatório"),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            if (newDate == null) return;
                            setState(() {
                              _ctrDataResolucao.text =
                                  formatDate(newDate, [dd, '/', mm, '/', yyyy]);
                            });
                          },
                          icon: const Icon(
                            Icons.calendar_month,
                            color: Colors.blue,
                          ),
                        ),
                        hintText: "DD/MM/YYYY"),
                    onTap: () async {},
                  ),
                ),
                const SizedBox(height: 20),
                InputDecorator(
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10.0),
                    labelText: "Hora para Resolução",
                    labelStyle: const TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  child: TextFormField(
                    controller: _ctrHoraResolucao,
                    style: const TextStyle(fontSize: 15),
                    keyboardType: TextInputType.text,
                    validator: Validatorless.required("Campo Obrigatório"),
                    maxLength: 5,
                    decoration: const InputDecoration(hintText: "HH:MM"),
                  ),
                ),
                const SizedBox(height: 20),
                InputDecorator(
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10.0),
                    labelText: "Tipo de Intercorrência",
                    labelStyle: const TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selTipoOcorrencia,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.blue,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.blue),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selTipoOcorrencia = newValue!;
                        });
                      },
                      items: LISTA_INTERCORRENCIA_TIPO,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InputDecorator(
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10.0),
                    labelText: "Grau de Urgência",
                    labelStyle: const TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selGrauUrgencia,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.blue,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.blue),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selGrauUrgencia = newValue!;
                        });
                      },
                      items: LISTA_INTERCORRENCIA_GRAUURGENCIA,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                criarTextFormField(_ctrDescricao, "Descrição",
                    "Campo Obrigatório", false, false),
                const SizedBox(height: 20),
                criarTextFormField(_ctrAcaoTomada, "Ação Tomada",
                    "Campo Obrigatório", false, false),
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
    Navigator.pushNamed(context, "pacienteopcao");
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
      IntercorrenciaModel sol = IntercorrenciaModel();
      sol.idadmission = VariaveisGlobais.dadosPaciente?.idadmission;
      sol.dataevento = formatDate(
          DateTime.now(), [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn, ':', ss]);
      sol.datamaxima = _ctrDataResolucao.text;
      sol.horamaxima = _ctrHoraResolucao.text;
      sol.tipointercorrencia = int.tryParse(_selTipoOcorrencia);
      sol.grauurgencia = int.tryParse(_selGrauUrgencia);
      sol.descricao = _ctrDescricao.text;
      sol.acaotomada = _ctrAcaoTomada.text;
      sol.nmprofissional = VariaveisGlobais.dadosUsuario?.nome;
      sol.registroprofissional = VariaveisGlobais.dadosUsuario?.registro;
      sol.classificacao = 1;
      Dio dio = Dio();
      Response response =
          await dio.post(URL_ALTERAR_INTERCORRENCIA, data: sol.toJson());
      Future.delayed(const Duration(seconds: 10)).then((value) {
        pr.hide().whenComplete(() {
          if (response.statusCode == 200) {
            Navigator.pushNamed(context, "pacienteopcao");
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
    if (_selTipoOcorrencia != "") {
      if (_selGrauUrgencia != "") {
        _enviarDados();
      } else {
        Uteis.mostrarAviso(context, "Aviso", "Grau de Urgência não informada");
      }
    } else {
      Uteis.mostrarAviso(
          context, "Aviso", "Tipo de Intercorrência não informada");
    }
  }
}
