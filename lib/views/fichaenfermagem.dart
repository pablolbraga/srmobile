import 'package:flutter/material.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/fichaenfermagemmodel.dart';

class FichaEnfermagem extends StatefulWidget {
  const FichaEnfermagem({super.key});

  @override
  State<FichaEnfermagem> createState() => _FichaEnfermagemState();
}

class _FichaEnfermagemState extends State<FichaEnfermagem> {
  var nome = VariaveisGlobais.dadosAgenda?.nmpaciente;

  final _ctrAcompanhante = TextEditingController();
  final _ctrHospital = TextEditingController();
  final _ctrUtilizacaoOutras = TextEditingController();
  final _ctrVentilacaoMecanica = TextEditingController();
  final _ctrPAMaximo = TextEditingController();
  final _ctrPAMinimo = TextEditingController();
  final _ctrPresencaLesaoOutras = TextEditingController();
  final _ctrProcedimentoOutros = TextEditingController();
  final _ctrPlanoCuidadoOutros = TextEditingController();
  final _ctrObservacao = TextEditingController();

  bool _ctrDependenciaBanho = false;
  bool _ctrDependenciaVestir = false;
  bool _ctrDependenciaTransferencia = false;
  bool _ctrDependenciaContinencia = false;
  bool _ctrDependenciaAlimentacao = false;
  bool _ctrUtilizacaoTQT = false;
  bool _ctrUtilizacaoCNE = false;
  bool _ctrUtilizacaoGT = false;
  bool _ctrUtilizacaoCVD = false;
  bool _ctrOxigenoterapiaCilindro = false;
  bool _ctrOxigenoterapiaConcentrador = false;
  bool _ctrOxigenoterapiaContinuo = false;
  bool _ctrPresencaLesaoPressao = false;
  bool _ctrPresencaLesaoVasiculogencia = false;
  bool _ctrPresencaLesaoCirurgia = false;
  bool _ctrDiagnostico001 = false;
  bool _ctrDiagnostico002 = false;
  bool _ctrDiagnostico003 = false;
  bool _ctrDiagnostico004 = false;
  bool _ctrDiagnostico005 = false;
  bool _ctrDiagnostico006 = false;
  bool _ctrDiagnostico007 = false;
  bool _ctrDiagnostico008 = false;
  bool _ctrDiagnostico009 = false;
  bool _ctrDiagnostico010 = false;
  bool _ctrDiagnostico011 = false;
  bool _ctrDiagnostico012 = false;
  bool _ctrDiagnostico013 = false;
  bool _ctrDiagnostico014 = false;
  bool _ctrDiagnostico015 = false;

  bool _ctrProcedimento001 = false;
  bool _ctrProcedimento002 = false;
  bool _ctrProcedimento003 = false;
  bool _ctrProcedimento004 = false;
  bool _ctrProcedimento005 = false;
  bool _ctrProcedimento006 = false;
  bool _ctrProcedimento007 = false;
  bool _ctrProcedimento008 = false;

  bool _ctrPlanoCuidado001 = false;
  bool _ctrPlanoCuidado002 = false;
  bool _ctrPlanoCuidado003 = false;
  bool _ctrPlanoCuidado004 = false;
  bool _ctrPlanoCuidado005 = false;
  bool _ctrPlanoCuidado006 = false;
  bool _ctrPlanoCuidado007 = false;
  bool _ctrPlanoCuidado008 = false;

  String _selBradenPercepcaoSensorial = "0";
  String _selBradenUmidade = "0";
  String _selBradenAtividade = "0";
  String _selBradenMobilidade = "0";
  String _selBradenNutricao = "0";
  String _selBradenFiccaoCisalhamento = "0";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _voltarTela,
      child: Scaffold(
        appBar: AppBar(
          title: Text(nome.toString()),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            criarTextFormField(
                _ctrAcompanhante, "Acompanhante", "", false, false),
            const SizedBox(
              height: 10.0,
            ),
            criarTextFormField(_ctrHospital, "Hospital", "", false, false),
            const SizedBox(
              height: 20.0,
            ),
            criarTitulo("Dependência de Cuidados"),
            Row(children: [
              Checkbox(
                value: _ctrDependenciaBanho,
                onChanged: (bool? value) {
                  setState(() {
                    _ctrDependenciaBanho = value!;
                  });
                },
              ),
              const Expanded(
                  child: Text("Banho",
                      style: TextStyle(color: Colors.blue, fontSize: 13))),
              Checkbox(
                value: _ctrDependenciaVestir,
                onChanged: (bool? value) {
                  setState(() {
                    _ctrDependenciaVestir = value!;
                  });
                },
              ),
              const Expanded(
                  child: Text("Vestir-se",
                      style: TextStyle(color: Colors.blue, fontSize: 13))),
              Checkbox(
                value: _ctrDependenciaTransferencia,
                onChanged: (bool? value) {
                  setState(() {
                    _ctrDependenciaTransferencia = value!;
                  });
                },
              ),
              const Expanded(
                  child: Text("Transferência",
                      style: TextStyle(color: Colors.blue, fontSize: 13))),
            ]),
            Row(
              children: [
                Checkbox(
                  value: _ctrDependenciaContinencia,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDependenciaContinencia = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Continência",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrDependenciaAlimentacao,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDependenciaAlimentacao = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Alimentação",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            criarTitulo("Utilização de"),
            Row(
              children: [
                Checkbox(
                  value: _ctrUtilizacaoTQT,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrUtilizacaoTQT = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("TQT",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrUtilizacaoCNE,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrUtilizacaoCNE = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("CNE",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrUtilizacaoGT,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrUtilizacaoGT = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("GT",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrUtilizacaoCVD,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrUtilizacaoCVD = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("CVD",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            criarTextFormField(
                _ctrUtilizacaoOutras, "Outras Utilizações", "", false, false),
            const SizedBox(
              height: 20.0,
            ),
            criarTitulo("Oxigenoterapia"),
            Row(
              children: [
                Checkbox(
                  value: _ctrOxigenoterapiaCilindro,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrOxigenoterapiaCilindro = value!;
                      if (_ctrOxigenoterapiaCilindro == false &&
                          _ctrOxigenoterapiaConcentrador == false) {
                        _ctrOxigenoterapiaContinuo = false;
                      }
                    });
                  },
                ),
                const Expanded(
                    child: Text("Cilindro",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrOxigenoterapiaConcentrador,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrOxigenoterapiaConcentrador = value!;

                      if (_ctrOxigenoterapiaCilindro == false &&
                          _ctrOxigenoterapiaConcentrador == false) {
                        _ctrOxigenoterapiaContinuo = false;
                      }
                    });
                  },
                ),
                const Expanded(
                    child: Text("Concentrador",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Visibility(
                visible: (_ctrOxigenoterapiaCilindro == true ||
                    _ctrOxigenoterapiaConcentrador == true),
                child: Row(
                  children: [
                    Checkbox(
                      value: _ctrOxigenoterapiaContinuo,
                      onChanged: (bool? value) {
                        setState(() {
                          _ctrOxigenoterapiaContinuo = value!;
                        });
                      },
                    ),
                    const Expanded(
                        child: Text("Contínuo",
                            style:
                                TextStyle(color: Colors.blue, fontSize: 13))),
                  ],
                )),
            const SizedBox(
              height: 5.0,
            ),
            criarTextFormField(_ctrVentilacaoMecanica, "Ventilação Mecânica",
                "", false, false),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: criarTextFormField(_ctrPAMaximo, 'PA Máximo',
                      'Campo Obrigatório', true, false),
                ),
                const SizedBox(width: 5.0),
                Expanded(
                  child: criarTextFormField(_ctrPAMinimo, 'PA Mínimo',
                      'Campo Obrigatório', true, false),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            criarTitulo("Presença de Lesões"),
            Row(
              children: [
                Checkbox(
                  value: _ctrPresencaLesaoPressao,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrPresencaLesaoPressao = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Pressão",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrPresencaLesaoVasiculogencia,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrPresencaLesaoVasiculogencia = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Vasculogência",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrPresencaLesaoCirurgia,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrPresencaLesaoCirurgia = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Cirúrgia",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            criarTextFormField(
                _ctrPresencaLesaoOutras, "Outras Lesões", "", false, false),
            const SizedBox(
              height: 20.0,
            ),
            criarTitulo("Diagnóstico de Enfermagem"),
            Row(
              children: [
                Checkbox(
                  value: _ctrDiagnostico001,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDiagnostico001 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_DIAGNOSTICO_001,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrDiagnostico002,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDiagnostico002 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_DIAGNOSTICO_002,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _ctrDiagnostico003,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDiagnostico003 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_DIAGNOSTICO_003,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrDiagnostico004,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDiagnostico004 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_DIAGNOSTICO_004,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _ctrDiagnostico005,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDiagnostico005 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_DIAGNOSTICO_005,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrDiagnostico006,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDiagnostico006 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_DIAGNOSTICO_006,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _ctrDiagnostico007,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDiagnostico007 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_DIAGNOSTICO_007,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrDiagnostico008,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDiagnostico008 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_DIAGNOSTICO_008,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _ctrDiagnostico009,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDiagnostico009 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_DIAGNOSTICO_009,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrDiagnostico010,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDiagnostico010 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_DIAGNOSTICO_010,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _ctrDiagnostico011,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDiagnostico011 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_DIAGNOSTICO_011,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrDiagnostico012,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDiagnostico012 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_DIAGNOSTICO_012,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _ctrDiagnostico013,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDiagnostico013 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_DIAGNOSTICO_013,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrDiagnostico014,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDiagnostico014 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_DIAGNOSTICO_014,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _ctrDiagnostico015,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDiagnostico015 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_DIAGNOSTICO_015,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            criarTitulo("Procedimentos"),
            Row(
              children: [
                Checkbox(
                  value: _ctrProcedimento001,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrProcedimento001 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_PROCEDIMENTO_001,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrProcedimento002,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrProcedimento002 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_PROCEDIMENTO_002,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _ctrProcedimento003,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrProcedimento003 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_PROCEDIMENTO_003,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrProcedimento004,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrProcedimento004 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_PROCEDIMENTO_004,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _ctrProcedimento005,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrProcedimento005 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_PROCEDIMENTO_005,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrProcedimento006,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrProcedimento006 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_PROCEDIMENTO_006,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _ctrProcedimento007,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrProcedimento007 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_PROCEDIMENTO_007,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrProcedimento008,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrProcedimento008 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_PROCEDIMENTO_008,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            criarTextFormField(_ctrProcedimentoOutros, "Outros procedimentos",
                "", false, false),
            const SizedBox(
              height: 20.0,
            ),
            criarTitulo("Plano de Cuidado"),
            Row(children: [
              Checkbox(
                value: _ctrPlanoCuidado001,
                onChanged: (bool? value) {
                  setState(() {
                    _ctrPlanoCuidado001 = value!;
                  });
                },
              ),
              const Expanded(
                  child: Text(LBL_FICHAENF_PLANOCUIDADO_001,
                      style: TextStyle(color: Colors.blue, fontSize: 13))),
            ]),
            Row(
              children: [
                Checkbox(
                  value: _ctrPlanoCuidado002,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrPlanoCuidado002 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_PLANOCUIDADO_002,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(children: [
              Checkbox(
                value: _ctrPlanoCuidado003,
                onChanged: (bool? value) {
                  setState(() {
                    _ctrPlanoCuidado003 = value!;
                  });
                },
              ),
              const Expanded(
                  child: Text(LBL_FICHAENF_PLANOCUIDADO_003,
                      style: TextStyle(color: Colors.blue, fontSize: 13))),
            ]),
            Row(
              children: [
                Checkbox(
                  value: _ctrPlanoCuidado004,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrPlanoCuidado004 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_PLANOCUIDADO_004,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(children: [
              Checkbox(
                value: _ctrPlanoCuidado005,
                onChanged: (bool? value) {
                  setState(() {
                    _ctrPlanoCuidado005 = value!;
                  });
                },
              ),
              const Expanded(
                  child: Text(LBL_FICHAENF_PLANOCUIDADO_005,
                      style: TextStyle(color: Colors.blue, fontSize: 13))),
            ]),
            Row(
              children: [
                Checkbox(
                  value: _ctrPlanoCuidado006,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrPlanoCuidado006 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_PLANOCUIDADO_006,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(children: [
              Checkbox(
                value: _ctrPlanoCuidado007,
                onChanged: (bool? value) {
                  setState(() {
                    _ctrPlanoCuidado007 = value!;
                  });
                },
              ),
              const Expanded(
                  child: Text(LBL_FICHAENF_PLANOCUIDADO_007,
                      style: TextStyle(color: Colors.blue, fontSize: 13))),
            ]),
            Row(
              children: [
                Checkbox(
                  value: _ctrPlanoCuidado008,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrPlanoCuidado008 = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(LBL_FICHAENF_PLANOCUIDADO_008,
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            criarTextFormField(_ctrPlanoCuidadoOutros,
                "Outros planos de cuidado", "", false, false),
            const SizedBox(
              height: 20.0,
            ),
            criarTitulo("Escala de Braden"),
            const SizedBox(
              height: 10.0,
            ),
            InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                labelText: "Percepção Sensorial",
                labelStyle: const TextStyle(color: Colors.blue),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selBradenPercepcaoSensorial,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blue,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.blue),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selBradenPercepcaoSensorial = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(value: "0", child: Text("SELECIONE")),
                    DropdownMenuItem(
                        value: "1", child: Text("COMPLETAMENTE LIMITADO")),
                    DropdownMenuItem(
                        value: "2", child: Text("LEVEMENTE LIMITADO")),
                    DropdownMenuItem(
                        value: "3", child: Text("NENHUMA LIMITAÇÃO")),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                labelText: "Umidade",
                labelStyle: const TextStyle(color: Colors.blue),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selBradenUmidade,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blue,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.blue),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selBradenUmidade = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(value: "0", child: Text("SELECIONE")),
                    DropdownMenuItem(
                        value: "1", child: Text("CONSTANTEMENTE ÚMIDA")),
                    DropdownMenuItem(value: "2", child: Text("MUITO ÚMIDA")),
                    DropdownMenuItem(
                        value: "3", child: Text("OCASIONALMENTE ÚMIDA")),
                    DropdownMenuItem(
                        value: "4", child: Text("RARAMENTE ÚMIDA")),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                labelText: "Atividade",
                labelStyle: const TextStyle(color: Colors.blue),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selBradenAtividade,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blue,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.blue),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selBradenAtividade = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(value: "0", child: Text("SELECIONE")),
                    DropdownMenuItem(value: "1", child: Text("ACAMADO")),
                    DropdownMenuItem(
                        value: "2", child: Text("RESTRITO À CADEITA")),
                    DropdownMenuItem(
                        value: "3", child: Text("CAMINHA OCASIONALMENTE")),
                    DropdownMenuItem(
                        value: "4", child: Text("CAMINHA FREQUÊNTEMENTE")),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                labelText: "Mobilidade",
                labelStyle: const TextStyle(color: Colors.blue),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selBradenMobilidade,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blue,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.blue),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selBradenMobilidade = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(value: "0", child: Text("SELECIONE")),
                    DropdownMenuItem(
                        value: "1", child: Text("COMPLETAMENTE IMÓVEL")),
                    DropdownMenuItem(value: "2", child: Text("MUITO LIMITADO")),
                    DropdownMenuItem(
                        value: "3", child: Text("LEVEMENTE LIMITADO")),
                    DropdownMenuItem(
                        value: "4", child: Text("NENHUMA LIMITAÇÃO")),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                labelText: "Nutrição",
                labelStyle: const TextStyle(color: Colors.blue),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selBradenNutricao,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blue,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.blue),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selBradenNutricao = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(value: "0", child: Text("SELECIONE")),
                    DropdownMenuItem(value: "1", child: Text("MUITO POBRE")),
                    DropdownMenuItem(
                        value: "2", child: Text("PROVAVELMENTE INADEQUEADO")),
                    DropdownMenuItem(value: "3", child: Text("ADEQUADO")),
                    DropdownMenuItem(value: "4", child: Text("EXCELENTE")),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                labelText: "Ficção/Cisalhamento",
                labelStyle: const TextStyle(color: Colors.blue),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selBradenFiccaoCisalhamento,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blue,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.blue),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selBradenFiccaoCisalhamento = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(value: "0", child: Text("SELECIONE")),
                    DropdownMenuItem(value: "1", child: Text("PROBLEMA")),
                    DropdownMenuItem(
                        value: "2", child: Text("POTÊNCIAL PARA PROBLEMAS")),
                    DropdownMenuItem(
                        value: "3", child: Text("NENHUM PROBLEMA APARENTE")),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            criarTextFormField(_ctrObservacao, "Observação", "", false, true),
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
    );
  }

  Future<bool> _voltarTela() async {
    Navigator.pushNamed(context, "agenda");
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

  void _validarCampos() {
    if (_ctrAcompanhante.text != "") {
      if (_ctrPAMaximo.text != "") {
        if (_ctrPAMinimo.text != "") {
          if (_selBradenPercepcaoSensorial != "0") {
            if (_selBradenUmidade != "0") {
              if (_selBradenAtividade != "0") {
                if (_selBradenMobilidade != "0") {
                  if (_selBradenNutricao != "0") {
                    if (_selBradenFiccaoCisalhamento != "0") {
                      if (_ctrObservacao.text != "") {
                        enviarFicha();
                      } else {
                        Uteis.mostrarAviso(
                            context, "Aviso", "Observação não informada.");
                      }
                    } else {
                      Uteis.mostrarAviso(context, "Aviso",
                          "Ficção/Cisalhamento não selecionado(a).");
                    }
                  } else {
                    Uteis.mostrarAviso(
                        context, "Aviso", "Nutrição não selecionado(a).");
                  }
                } else {
                  Uteis.mostrarAviso(
                      context, "Aviso", "Mobilidade não selecionado(a).");
                }
              } else {
                Uteis.mostrarAviso(
                    context, "Aviso", "Atividade não selecionado(a).");
              }
            } else {
              Uteis.mostrarAviso(
                  context, "Aviso", "Umidade não selecionado(a).");
            }
          } else {
            Uteis.mostrarAviso(
                context, "Aviso", "Percepção sensorial não selecionado(a).");
          }
        } else {
          Uteis.mostrarAviso(context, "Aviso", "PA Mínima não informado(a).");
        }
      } else {
        Uteis.mostrarAviso(context, "Aviso", "PA Máxima não informado(a).");
      }
    } else {
      Uteis.mostrarAviso(context, "Aviso", "Acompanhante não informado(a).");
    }
  }

  void enviarFicha() {
    FichaEnfermagemModel ficha = FichaEnfermagemModel();
    ficha.idadmission = VariaveisGlobais.dadosAgenda?.idadmission;
    ficha.datainicio = VariaveisGlobais.dataInicioAtendimento;
    ficha.idprofessional = VariaveisGlobais.dadosUsuario?.idperson;
    ficha.idprofagenda = VariaveisGlobais.dadosAgenda?.idprofagenda;
    ficha.idcapconsult = VariaveisGlobais.dadosAgenda?.idcapconsult;
    ficha.acompanhante = _ctrAcompanhante.text;
    ficha.hospital = _ctrHospital.text;
    ficha.cuidadobanho = _ctrDependenciaBanho == true ? 1 : 0;
    ficha.cuidadovestir = _ctrDependenciaVestir == true ? 1 : 0;
    ficha.cuidadotransferencia = _ctrDependenciaTransferencia == true ? 1 : 0;
    ficha.cuidadocontinencia = _ctrDependenciaContinencia == true ? 1 : 0;
    ficha.cuidadoalimentacao = _ctrDependenciaAlimentacao == true ? 1 : 0;
    ficha.utilizacaotqt = _ctrUtilizacaoTQT == true ? 1 : 0;
    ficha.utilizacaocne = _ctrUtilizacaoCNE == true ? 1 : 0;
    ficha.utilizacaogt = _ctrUtilizacaoGT == true ? 1 : 0;
    ficha.utilizacaocvd = _ctrUtilizacaoCVD == true ? 1 : 0;
    ficha.utilizacaooutros = _ctrUtilizacaoOutras.text != "" ? 1 : 0;
    ficha.utilizacaooutrostexto = _ctrUtilizacaoOutras.text;
    ficha.oxigenoterapiacilindro = _ctrOxigenoterapiaCilindro == true ? 1 : 0;
    ficha.oxigenoterapiaconcentrador =
        _ctrOxigenoterapiaConcentrador == true ? 1 : 0;
    ficha.oxigenoterapiacontinuo = _ctrOxigenoterapiaContinuo == true ? 1 : 0;
    ficha.oxigenoterapianao = (ficha.oxigenoterapiacilindro! +
                ficha.oxigenoterapiaconcentrador! +
                ficha.oxigenoterapiacontinuo!) >
            0
        ? 1
        : 0;
    ficha.ventilacaomecanica = _ctrVentilacaoMecanica.text != "" ? 2 : 1;
    ficha.ventilacaomecanicaequipamento = _ctrVentilacaoMecanica.text;
    ficha.pamax = int.tryParse(_ctrPAMaximo.text);
    ficha.pamin = int.tryParse(_ctrPAMinimo.text);
    ficha.feridapressao = _ctrPresencaLesaoPressao == true ? 1 : 0;
    ficha.feridavasculogencia = _ctrPresencaLesaoVasiculogencia == true ? 1 : 0;
    ficha.feridacirurgia = _ctrPresencaLesaoCirurgia == true ? 1 : 0;
    ficha.feridaoutros = _ctrPresencaLesaoOutras.text;
    ficha.diag001 = _ctrDiagnostico001 == true ? 1 : 0;
    ficha.diag002 = _ctrDiagnostico002 == true ? 1 : 0;
    ficha.diag003 = _ctrDiagnostico003 == true ? 1 : 0;
    ficha.diag004 = _ctrDiagnostico004 == true ? 1 : 0;
    ficha.diag005 = _ctrDiagnostico005 == true ? 1 : 0;
    ficha.diag006 = _ctrDiagnostico006 == true ? 1 : 0;
    ficha.diag007 = _ctrDiagnostico007 == true ? 1 : 0;
    ficha.diag008 = _ctrDiagnostico008 == true ? 1 : 0;
    ficha.diag009 = _ctrDiagnostico009 == true ? 1 : 0;
    ficha.diag010 = _ctrDiagnostico010 == true ? 1 : 0;
    ficha.diag011 = _ctrDiagnostico011 == true ? 1 : 0;
    ficha.diag012 = _ctrDiagnostico012 == true ? 1 : 0;
    ficha.diag013 = _ctrDiagnostico013 == true ? 1 : 0;
    ficha.diag014 = _ctrDiagnostico014 == true ? 1 : 0;
    ficha.diag015 = _ctrDiagnostico015 == true ? 1 : 0;
    ficha.proc001 = _ctrProcedimento001 == true ? 1 : 0;
    ficha.proc002 = _ctrProcedimento002 == true ? 1 : 0;
    ficha.proc003 = _ctrProcedimento003 == true ? 1 : 0;
    ficha.proc004 = _ctrProcedimento004 == true ? 1 : 0;
    ficha.proc005 = _ctrProcedimento005 == true ? 1 : 0;
    ficha.proc006 = _ctrProcedimento006 == true ? 1 : 0;
    ficha.proc007 = _ctrProcedimento007 == true ? 1 : 0;
    ficha.proc008 = _ctrProcedimento008 == true ? 1 : 0;
    ficha.procoutros = _ctrProcedimentoOutros.text != "" ? 1 : 0;
    ficha.procoutrostexto = _ctrProcedimentoOutros.text;
    ficha.cuid001 = _ctrPlanoCuidado001 == true ? 1 : 0;
    ficha.cuid002 = _ctrPlanoCuidado002 == true ? 1 : 0;
    ficha.cuid003 = _ctrPlanoCuidado003 == true ? 1 : 0;
    ficha.cuid004 = _ctrPlanoCuidado004 == true ? 1 : 0;
    ficha.cuid005 = _ctrPlanoCuidado005 == true ? 1 : 0;
    ficha.cuid006 = _ctrPlanoCuidado006 == true ? 1 : 0;
    ficha.cuid007 = _ctrPlanoCuidado007 == true ? 1 : 0;
    ficha.cuid008 = _ctrPlanoCuidado008 == true ? 1 : 0;
    ficha.cuidoutros = _ctrPlanoCuidadoOutros.text != "" ? 1 : 0;
    ficha.cuidoutrostexto = _ctrPlanoCuidadoOutros.text;
    ficha.bradenpercepcaosensorial = int.tryParse(_selBradenPercepcaoSensorial);
    ficha.bradenumidade = int.tryParse(_selBradenUmidade);
    ficha.bradenatividade = int.tryParse(_selBradenAtividade);
    ficha.bradenmobilidade = int.tryParse(_selBradenMobilidade);
    ficha.bradennutricao = int.tryParse(_selBradenNutricao);
    ficha.bradenficcao = int.tryParse(_selBradenFiccaoCisalhamento);
    ficha.observacao = _ctrObservacao.text;
    VariaveisGlobais.dadosFichaEnfermagem = ficha;
    Navigator.pushNamed(context, "assinatura_paciente");
  }
}
