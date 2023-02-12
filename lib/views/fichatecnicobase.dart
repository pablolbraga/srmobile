// ignore_for_file: unnecessary_new, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/fichatecnicobasemodel.dart';

class FichaTecnicoBase extends StatefulWidget {
  const FichaTecnicoBase({super.key});

  @override
  State<FichaTecnicoBase> createState() => _FichaTecnicoBaseState();
}

class _FichaTecnicoBaseState extends State<FichaTecnicoBase> {
  var nome = VariaveisGlobais.dadosAgenda?.nmpaciente;

  final _ctrTipoProcedimentoOutros = TextEditingController();
  final _ctrMaterialAbd = TextEditingController();
  final _ctrMaterialAlgodao = TextEditingController();
  final _ctrMaterialAgulha = TextEditingController();
  final _ctrMaterialAlcool = TextEditingController();
  final _ctrMaterialAtadura = TextEditingController();
  final _ctrMaterialCateter = TextEditingController();
  final _ctrMaterialEquipo = TextEditingController();
  final _ctrMaterialExtensor1Via = TextEditingController();
  final _ctrMaterialExtensor2Via = TextEditingController();
  final _ctrMaterialGazeAcolchoada = TextEditingController();
  final _ctrMaterialGazeEmbebida = TextEditingController();
  final _ctrMaterialGazeEsteril = TextEditingController();
  final _ctrMaterialHeparina = TextEditingController();
  final _ctrMaterialIvFix = TextEditingController();
  final _ctrMaterialJelco = TextEditingController();
  final _ctrMaterialLaminaBisturi = TextEditingController();
  final _ctrMaterialLuvaEsteril = TextEditingController();
  final _ctrMaterialLuvaProcedimento = TextEditingController();
  final _ctrMaterialMascara = TextEditingController();
  final _ctrMaterialMicropore25 = TextEditingController();
  final _ctrMaterialMicropore50 = TextEditingController();
  final _ctrMaterialScalp = TextEditingController();
  final _ctrMaterialSeringa = TextEditingController();
  final _ctrMaterialSF09 = TextEditingController();
  final _ctrMaterialOutros = TextEditingController();
  final _ctrMedicamentos = TextEditingController();
  final _ctrEvolucao = TextEditingController();

  bool _ctrTipoProcedimentoIV = false;
  bool _ctrTipoProcedimentoIM = false;
  bool _ctrTipoProcedimentoSC = false;
  bool _ctrTipoProcedimentoClister = false;
  bool _ctrTipoProcedimentoCurativo = false;
  bool _ctrTipoProcedimentoCVA = false;
  bool _ctrTipoProcedimentoCVCU = false;
  bool _ctrTipoProcedimentoOrientacao = false;
  bool _ctrTipoProcedimentoECG = false;
  bool _ctrTipoProcedimentoPuncaoVenosa = false;
  bool _ctrTipoProcedimentoRetiradaPontos = false;

  final String _selTipoChamada = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text(nome.toString()),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            criaDropDownButton(context, "Tipo da chamada", _selTipoChamada,
                LISTA_FICHATECNICOBASE_TIPOCHAMADA),
            const SizedBox(height: 10),
            criarTitulo("Tipo de Procedimento"),
            Row(children: [
              Checkbox(
                value: _ctrTipoProcedimentoIV,
                onChanged: (bool? value) {
                  setState(() {
                    _ctrTipoProcedimentoIV = value!;
                  });
                },
              ),
              const Expanded(
                  child: Text("Adm. Med. IV",
                      style: TextStyle(color: Colors.blue, fontSize: 13))),
              Checkbox(
                value: _ctrTipoProcedimentoIM,
                onChanged: (bool? value) {
                  setState(() {
                    _ctrTipoProcedimentoIM = value!;
                  });
                },
              ),
              const Expanded(
                  child: Text("Adm. Med. IM",
                      style: TextStyle(color: Colors.blue, fontSize: 13))),
            ]),
            Row(
              children: [
                Checkbox(
                  value: _ctrTipoProcedimentoSC,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrTipoProcedimentoSC = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Adm. Med. SC",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrTipoProcedimentoClister,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrTipoProcedimentoClister = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Clister Evacuativo",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _ctrTipoProcedimentoCurativo,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrTipoProcedimentoCurativo = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Curativo",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrTipoProcedimentoCVA,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrTipoProcedimentoCVA = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Cateterismo Vesical de Alivio",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _ctrTipoProcedimentoCVCU,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrTipoProcedimentoCVCU = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(
                        "Cateterismo Visical de Coleta p/ Coleta de Urina",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrTipoProcedimentoOrientacao,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrTipoProcedimentoOrientacao = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Orientação para Cuidados Gerais",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _ctrTipoProcedimentoECG,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrTipoProcedimentoECG = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("ECG",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrTipoProcedimentoPuncaoVenosa,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrTipoProcedimentoPuncaoVenosa = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Punção Venosa",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _ctrTipoProcedimentoRetiradaPontos,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrTipoProcedimentoRetiradaPontos = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Retirada de Pontos",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            criarTextFormField(_ctrTipoProcedimentoOutros,
                "Outros Procedimentos", "", false, false),
            const SizedBox(height: 20),
            criarTitulo("Materiais"),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(
                          _ctrMaterialAbd, "ABD 10ml (unid)", "", true, false),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialAlgodao, "Algodão (unid)",
                          "", true, false),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialAgulha, "Agulha (unid)",
                          "", false, false),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(
                          _ctrMaterialAlcool, "Álcool (unid)", "", true, false),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialAtadura, "Atadura (rolo)",
                          "", false, false),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialCateter, "Cateter (unid)",
                          "", false, false),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialEquipo, "Equipo (unid)",
                          "", false, false),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialExtensor1Via,
                          "Extensor 1 via 10cm (unid)", "", true, false),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialExtensor2Via,
                          "Extensor 2 vias (unid)", "", true, false),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialGazeAcolchoada,
                          "Gaze acolchoada (unid)", "", true, false),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialGazeEmbebida,
                          "Gaze embebida (pct)", "", true, false),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialGazeEsteril,
                          "Gaze estéril (unid)", "", true, false),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialHeparina, "Heparina (ml)",
                          "", true, false),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(
                          _ctrMaterialIvFix, "IV Fix (unid)", "", true, false),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(
                          _ctrMaterialJelco, "Jelco (unid)", "", false, false),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialLaminaBisturi,
                          "Lâmina de Bisturi (unid)", "", false, false),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialLuvaEsteril,
                          "Luva estéril (par)", "", true, false),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialLuvaProcedimento,
                          "Luva de Procedimento (par)", "", true, false),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialMascara, "Máscara (unid)",
                          "", true, false),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialMicropore25,
                          "Micropore 25x10 (cm)", "", true, false),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialMicropore50,
                          "Micropore 50x10 (cm)", "", true, false),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(
                          _ctrMaterialScalp, "Scalp (unid)", "", false, false),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(_ctrMaterialSeringa, "Seringa (unid)",
                          "", false, false),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      criarTextFormField(
                          _ctrMaterialSF09, "SF 0,9% (unid)", "", false, false),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            criarTextFormField(
                _ctrMaterialOutros, "Outros Materiais", "", false, true),
            const SizedBox(height: 10),
            criarTextFormField(
                _ctrMedicamentos, "Medicamento", "", false, true),
            const SizedBox(height: 10),
            criarTextFormField(_ctrEvolucao, "Evolução", "", false, true),
            const SizedBox(
              height: 20,
            ),
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

  void _validarCampos() {
    if (_selTipoChamada != "") {
      if (_ctrEvolucao.text != "") {
        enviarFicha();
      } else {
        Uteis.mostrarAviso(context, "Aviso", "Evolução não informada.");
      }
    } else {
      Uteis.mostrarAviso(context, "Aviso", "Tipo de chamada não selecionado");
    }
  }

  Future<bool> _onBackPressed() async {
    Navigator.pushNamed(context, "agenda");
    return true;
  }

  InputDecorator criaDropDownButton(BuildContext context, String titulo,
      String valor, List<DropdownMenuItem<String>> lista) {
    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        labelText: titulo,
        labelStyle: const TextStyle(color: Colors.blue),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: valor,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.blue,
          ),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.blue),
          onChanged: (String? newValue) {
            setState(() {
              valor = newValue!;
            });
          },
          items: lista,
        ),
      ),
    );
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
        keyboardType:
            inteiro == true ? TextInputType.number : TextInputType.multiline,
        maxLines: multilinha == true ? 5 : 1,
        validator: (value) {
          if (value == null || value == '') {
            return avisoNaoPreenchimento;
          }
          return null;
        },
      ),
    );
  }

  Column criarTitulo(String titulo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
              color: Colors.blue, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const Divider(
          color: Colors.blue,
          height: 5,
          thickness: 3,
          indent: 0,
          endIndent: 0,
        )
      ],
    );
  }

  void enviarFicha() {
    FichaTecnicoBaseModel ficha = FichaTecnicoBaseModel();
    ficha.idadmission = VariaveisGlobais.dadosAgenda?.idadmission;
    ficha.idprofessional = VariaveisGlobais.dadosUsuario?.idperson;
    ficha.idcapconsult = VariaveisGlobais.dadosAgenda?.idcapconsult;
    ficha.idprofagenda = VariaveisGlobais.dadosAgenda?.idprofagenda;
    ficha.datainicio = VariaveisGlobais.dataInicioAtendimento;
    ficha.tipochamada = _selTipoChamada as int?;
    ficha.administracaomedim = _ctrTipoProcedimentoIM == true ? 1 : 0;
    ficha.administracaomediv = _ctrTipoProcedimentoIV == true ? 1 : 0;
    ficha.administracaomedsc = _ctrTipoProcedimentoSC == true ? 1 : 0;
    ficha.administracaomed = (ficha.administracaomedim! +
                ficha.administracaomediv! +
                ficha.administracaomedsc!) >
            0
        ? 1
        : 0;
    ficha.clister = _ctrTipoProcedimentoClister == true ? 1 : 0;
    ficha.curativo = _ctrTipoProcedimentoCurativo == true ? 1 : 0;
    ficha.cateterismovesicalalivio = _ctrTipoProcedimentoCVA == true ? 1 : 0;
    ficha.cateterismovericalurina = _ctrTipoProcedimentoCVCU == true ? 1 : 0;
    ficha.cuidadogerais = _ctrTipoProcedimentoOrientacao == true ? 1 : 0;
    ficha.ecg = _ctrTipoProcedimentoECG == true ? 1 : 0;
    ficha.puncao = _ctrTipoProcedimentoPuncaoVenosa == true ? 1 : 0;
    ficha.retiradapontos = _ctrTipoProcedimentoRetiradaPontos == true ? 1 : 0;
    ficha.outrosprocedimentos = _ctrTipoProcedimentoOutros.text;
    ficha.abd = _ctrMaterialAbd.text;
    ficha.algodao = _ctrMaterialAlgodao.text;
    ficha.agulha = _ctrMaterialAgulha.text;
    ficha.alcool = _ctrMaterialAlcool.text;
    ficha.atadura = _ctrMaterialAtadura.text;
    ficha.cateter = _ctrMaterialCateter.text;
    ficha.equipo = _ctrMaterialEquipo.text;
    ficha.extensor1via = _ctrMaterialExtensor1Via.text;
    ficha.extensor2via = _ctrMaterialExtensor2Via.text;
    ficha.gazeacolchoada = _ctrMaterialGazeAcolchoada.text;
    ficha.gazeembebida = _ctrMaterialGazeEmbebida.text;
    ficha.gazeesteril = _ctrMaterialGazeEsteril.text;
    ficha.heparina = _ctrMaterialHeparina.text;
    ficha.ivfix = _ctrMaterialIvFix.text;
    ficha.jelco = _ctrMaterialJelco.text;
    ficha.bisturi = _ctrMaterialLaminaBisturi.text;
    ficha.luvaesteril = _ctrMaterialLuvaEsteril.text;
    ficha.luvaprocedimento = _ctrMaterialLuvaProcedimento.text;
    ficha.mascara = _ctrMaterialMascara.text;
    ficha.micropore2510 = _ctrMaterialMicropore25.text;
    ficha.micropore5010 = _ctrMaterialMicropore50.text;
    ficha.scalp = _ctrMaterialScalp.text;
    ficha.seringa = _ctrMaterialSeringa.text;
    ficha.sorofisiologico = _ctrMaterialSF09.text;
    ficha.outrosmateriais = _ctrMaterialOutros.text;
    ficha.medicamentos = _ctrMedicamentos.text;
    ficha.evolucao = _ctrEvolucao.text;
    VariaveisGlobais.dadosFichaTecnicoBase = ficha;
    Navigator.pushNamed(context, "assinatura_paciente");
  }
}
