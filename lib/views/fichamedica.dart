// ignore_for_file: unused_local_variable, sort_child_properties_last

//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/fichamedicamodel.dart';
import 'package:uno/uno.dart';

class FichaMedica extends StatefulWidget {
  const FichaMedica({super.key});

  @override
  State<FichaMedica> createState() => _FichaMedicaState();
}

class _FichaMedicaState extends State<FichaMedica> {
  var nome = VariaveisGlobais.dadosAgenda?.nmpaciente;
  final _ctrAcompanhante = TextEditingController();
  final _ctrHd = TextEditingController();
  final _ctrPlanoTerapeutico = TextEditingController();
  final _ctrSituacaoClinica = TextEditingController();
  final _ctrJustificativaAtendimentoDomiciliar = TextEditingController();
  final _ctrFisioterapiaMotora = TextEditingController();
  final _ctrFisioterapiaRespiratoria = TextEditingController();
  final _ctrNutricionista = TextEditingController();
  final _ctrFonoterapia = TextEditingController();
  final _ctrEnfermagem = TextEditingController();
  final _ctrTerapiaOcupacional = TextEditingController();
  final _ctrPsicologo = TextEditingController();
  final _ctrExameFisico = TextEditingController();
  final _ctrAntibiotico = TextEditingController();
  final _ctrPaMaximo = TextEditingController();
  final _ctrPaMinimo = TextEditingController();
  final _ctrFC = TextEditingController();
  final _ctrFR = TextEditingController();
  final _ctrVentilador = TextEditingController();
  final _ctrOutrasOstomias = TextEditingController();
  final _ctrListaProblema = TextEditingController();
  final _ctrOrientacaoConduta = TextEditingController();
  final uno = Uno();

  bool _ctrNutricaoOral = false;
  bool _ctrNutricaoGT = false;
  bool _ctrNutricaoCNE = false;
  bool _ctrNutricaoIV = false;
  bool _ctrOstomiaTraqueostomia = false;
  bool _ctrOstomiaGastrostomia = false;
  bool _ctrOstomiaCateterNasoEnteral = false;
  bool _ctrOstomiaCistostomia = false;
  bool _ctrOstomiaColostomia = false;
  bool _ctrSuporteOxigenioCilindro = false;
  bool _ctrSuporteOxigenioConcentrador = false;

  String _selNivelConscienciaRM = "0";
  String _selNivelConscienciaRV = "0";
  String _selNivelConscienciaAO = "0";
  String _selAtividadeVidaDiaria = "0";
  String _selVentilacaoMecanica = "0";
  String _selAspiracaoTraqueal = "0";
  String _selAcessoVenoso = "0";
  String _selOxigenoterapia = "0";
  String _selSolicitarExame = "0";
  String _selMudarPrescricao = "0";

  @override
  Widget build(BuildContext context) {
    retornarPlanoTerapeutico(VariaveisGlobais.dadosAgenda?.idadmission);
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(nome.toString()),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              criarTextFormField(_ctrAcompanhante, "Acompanhante",
                  "Acompanhante não informado.", false, false),
              const SizedBox(height: 10.0),
              criarTextFormField(
                  _ctrHd, "HD", "HD não informado", false, false),
              const SizedBox(height: 10.0),
              criarTextFormField(_ctrPlanoTerapeutico, "Plano Terapeutico",
                  "Plano Terapeutico não informado", false, true),
              const SizedBox(height: 10.0),
              criarTextFormField(_ctrSituacaoClinica, "Situação Clínica",
                  "Situação Clínica não informado", false, true),
              const SizedBox(height: 10.0),
              criarTextFormField(
                  _ctrJustificativaAtendimentoDomiciliar,
                  "Justificativa de Atendimento Domiciliar",
                  "Campo Obrigatório",
                  false,
                  true),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: criarTextFormField(
                        _ctrFisioterapiaMotora,
                        "Fisio. Motora (x/sem)",
                        "Campo Obrigatório",
                        true,
                        false),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: criarTextFormField(
                        _ctrFisioterapiaRespiratoria,
                        "Fisio. Respiratória (x/sem)",
                        "Campo Obrigatório",
                        true,
                        false),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: criarTextFormField(
                        _ctrNutricionista,
                        "Nutricionista (x/mes)",
                        "Campo Obrigatório",
                        true,
                        false),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: criarTextFormField(
                        _ctrFonoterapia,
                        "Fonoterapia (x/mes)",
                        "Campo Obrigatório",
                        true,
                        false),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: criarTextFormField(_ctrEnfermagem,
                        "Enfermagem (x/sem)", "Campo Obrigatório", true, false),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: criarTextFormField(
                        _ctrTerapiaOcupacional,
                        "Terapia Ocup. (x/sem)",
                        "Campo Obrigatório",
                        true,
                        false),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: criarTextFormField(_ctrPsicologo,
                        "Psicólogo (x/sem)", "Campo Obrigatório", true, false),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: criarTextFormField(_ctrExameFisico, "Exame Físico",
                        "Campo Obrigatório", false, false),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              criarTextFormField(_ctrAntibiotico, "Antibiótico",
                  "Campo Obrigatório", false, false),
              const SizedBox(height: 20.0),
              criarTitulo("Nutrição"),
              Row(
                children: [
                  Checkbox(
                      value: _ctrNutricaoOral,
                      onChanged: (bool? value) {
                        setState(() {
                          _ctrNutricaoOral = value!;
                        });
                      }),
                  const Expanded(
                      child: Text(
                    "Oral",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  )),
                  Checkbox(
                      value: _ctrNutricaoGT,
                      onChanged: (bool? value) {
                        setState(() {
                          _ctrNutricaoGT = value!;
                        });
                      }),
                  const Expanded(
                    child: Text(
                      "GT",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                  Checkbox(
                      value: _ctrNutricaoCNE,
                      onChanged: (bool? value) {
                        setState(() {
                          _ctrNutricaoCNE = value!;
                        });
                      }),
                  const Expanded(
                      child: Text(
                    "CNE",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  )),
                  Checkbox(
                      value: _ctrNutricaoIV,
                      onChanged: (bool? value) {
                        setState(() {
                          _ctrNutricaoIV = value!;
                        });
                      }),
                  const Expanded(
                    child: Text(
                      "IV",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              criarTitulo("Atividade da Vida Diária"),
              const SizedBox(height: 10.0),
              InputDecorator(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  labelText: "",
                  labelStyle: const TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selAtividadeVidaDiaria,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.blue),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selAtividadeVidaDiaria = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(child: Text("SELECIONE"), value: ""),
                      DropdownMenuItem(
                          child: Text("NÃO INFORMADO"), value: "0"),
                      DropdownMenuItem(
                          child: Text("INDEPENDÊNCIA"), value: "1"),
                      DropdownMenuItem(
                          child: Text("DEPENDÊNCIA PARCIAL"), value: "2"),
                      DropdownMenuItem(
                          child: Text("DEPENDÊNCIA TOTAL"), value: "3"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: criarTextFormField(_ctrPaMaximo, 'PA Máximo',
                        'Campo Obrigatório', true, false),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: criarTextFormField(_ctrPaMinimo, 'PA Mínimo',
                        'Campo Obrigatório', true, false),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: criarTextFormField(
                        _ctrFC, 'FC', 'Campo Obrigatório', true, false),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: criarTextFormField(
                        _ctrFR, 'FR', 'Campo Obrigatório', true, false),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              criarTitulo("Nível de Consciência"),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: InputDecorator(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                        labelText: "RM",
                        labelStyle: const TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selNivelConscienciaRM,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blue,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.blue),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selNivelConscienciaRM = newValue!;
                            });
                          },
                          items: const [
                            DropdownMenuItem(child: Text("0"), value: "0"),
                            DropdownMenuItem(child: Text("1"), value: "1"),
                            DropdownMenuItem(child: Text("2"), value: "2"),
                            DropdownMenuItem(child: Text("3"), value: "3"),
                            DropdownMenuItem(child: Text("4"), value: "4"),
                            DropdownMenuItem(child: Text("5"), value: "5"),
                            DropdownMenuItem(child: Text("6"), value: "6"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: InputDecorator(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                        labelText: "RV",
                        labelStyle: const TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selNivelConscienciaRV,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blue,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.blue),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selNivelConscienciaRV = newValue!;
                            });
                          },
                          items: const [
                            DropdownMenuItem(child: Text("0"), value: "0"),
                            DropdownMenuItem(child: Text("1"), value: "1"),
                            DropdownMenuItem(child: Text("2"), value: "2"),
                            DropdownMenuItem(child: Text("3"), value: "3"),
                            DropdownMenuItem(child: Text("4"), value: "4"),
                            DropdownMenuItem(child: Text("5"), value: "5"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: InputDecorator(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                        labelText: "AO",
                        labelStyle: const TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selNivelConscienciaAO,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blue,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.blue),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selNivelConscienciaAO = newValue!;
                            });
                          },
                          items: const [
                            DropdownMenuItem(child: Text("0"), value: "0"),
                            DropdownMenuItem(child: Text("1"), value: "1"),
                            DropdownMenuItem(child: Text("2"), value: "2"),
                            DropdownMenuItem(child: Text("3"), value: "3"),
                            DropdownMenuItem(child: Text("4"), value: "4"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              criarTitulo("Ventilação Mecânica"),
              const SizedBox(height: 10.0),
              InputDecorator(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  labelText: "Tipo",
                  labelStyle: const TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selVentilacaoMecanica,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.blue),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selVentilacaoMecanica = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                          child: Text("NÃO INFORMADO"), value: "0"),
                      DropdownMenuItem(child: Text("INTERMITENTE"), value: "1"),
                      DropdownMenuItem(child: Text("CONTÍNUA"), value: "2"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              criarTextFormField(_ctrVentilador, 'Ventilador',
                  'Campo Obrigatório', false, false),
              const SizedBox(height: 20.0),
              criarTitulo("Ostomias/Cateteres"),
              const SizedBox(height: 5.0),
              Row(children: [
                Checkbox(
                    value: _ctrOstomiaTraqueostomia,
                    onChanged: (bool? value) {
                      setState(() {
                        _ctrOstomiaTraqueostomia = value!;
                      });
                    }),
                const Expanded(
                    child: Text(
                  "Traqueóstomia",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                )),
                Checkbox(
                    value: _ctrOstomiaGastrostomia,
                    onChanged: (bool? value) {
                      setState(() {
                        _ctrOstomiaGastrostomia = value!;
                      });
                    }),
                const Expanded(
                  child: Text(
                    "Gastrostomia",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Checkbox(
                    value: _ctrOstomiaCateterNasoEnteral,
                    onChanged: (bool? value) {
                      setState(() {
                        _ctrOstomiaCateterNasoEnteral = value!;
                      });
                    }),
                const Expanded(
                    child: Text(
                  "Cateter Naso-Enteral",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                )),
              ]),
              Row(
                children: [
                  Checkbox(
                      value: _ctrOstomiaCistostomia,
                      onChanged: (bool? value) {
                        setState(() {
                          _ctrOstomiaCistostomia = value!;
                        });
                      }),
                  const Expanded(
                    child: Text(
                      "Cistostomia",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                  Checkbox(
                      value: _ctrOstomiaColostomia,
                      onChanged: (bool? value) {
                        setState(() {
                          _ctrOstomiaColostomia = value!;
                        });
                      }),
                  const Expanded(
                    child: Text(
                      "Colostomia",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ],
              ),
              criarTextFormField(_ctrOutrasOstomias, 'Outras Ostomias',
                  'Campo Obrigatório', false, false),
              const SizedBox(height: 20.0),
              criarTitulo("Aspiração Traqueal"),
              const SizedBox(height: 10.0),
              InputDecorator(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  labelText: "Tipo",
                  labelStyle: const TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selAspiracaoTraqueal,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.blue),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selAspiracaoTraqueal = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(child: Text("NÃO"), value: "0"),
                      DropdownMenuItem(child: Text("SIM"), value: "1"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              criarTitulo("Acesso Venoso"),
              const SizedBox(height: 10.0),
              InputDecorator(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  labelText: "Tipo",
                  labelStyle: const TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selAcessoVenoso,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.blue),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selAcessoVenoso = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                          child: Text("NÃO INFORMADO"), value: "0"),
                      DropdownMenuItem(child: Text("PERIFÉRICO"), value: "1"),
                      DropdownMenuItem(child: Text("PROFUNDO"), value: "2"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              criarTitulo("Suporte de Oxigênio"),
              const SizedBox(height: 5.0),
              Row(children: [
                Checkbox(
                    value: _ctrSuporteOxigenioCilindro,
                    onChanged: (bool? value) {
                      setState(() {
                        _ctrSuporteOxigenioCilindro = value!;
                      });
                    }),
                const Expanded(
                    child: Text(
                  "Cilindro",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                )),
                Checkbox(
                    value: _ctrSuporteOxigenioConcentrador,
                    onChanged: (bool? value) {
                      setState(() {
                        _ctrSuporteOxigenioConcentrador = value!;
                      });
                    }),
                const Expanded(
                  child: Text(
                    "Concentrador",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ]),
              const SizedBox(height: 20.0),
              Visibility(
                visible: (_ctrSuporteOxigenioCilindro == true ||
                    _ctrSuporteOxigenioConcentrador == true),
                child: Column(children: [
                  criarTitulo("Oxigenoterapia"),
                  const SizedBox(height: 10.0),
                  InputDecorator(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      labelText: "Tipo",
                      labelStyle: const TextStyle(color: Colors.blue),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selOxigenoterapia,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.blue,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.blue),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selOxigenoterapia = newValue!;
                          });
                        },
                        items: const [
                          DropdownMenuItem(
                              child: Text("NÃO INFORMADO"), value: "0"),
                          DropdownMenuItem(
                              child: Text("INTERMITENTE"), value: "1"),
                          DropdownMenuItem(child: Text("CONTÍNUA"), value: "2"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ]),
              ),
              criarTitulo("Solicitar Exame"),
              const SizedBox(height: 10.0),
              InputDecorator(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  labelText: "",
                  labelStyle: const TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selSolicitarExame,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.blue),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selSolicitarExame = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(child: Text("NÃO"), value: "0"),
                      DropdownMenuItem(child: Text("SIM"), value: "1"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              criarTitulo("Mudar Prescrição"),
              const SizedBox(height: 10.0),
              InputDecorator(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  labelText: "",
                  labelStyle: const TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selMudarPrescricao,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.blue),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selMudarPrescricao = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(child: Text("NÃO"), value: "0"),
                      DropdownMenuItem(child: Text("SIM"), value: "1"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              criarTextFormField(
                  _ctrListaProblema, 'Lista de Problemas', '', false, true),
              const SizedBox(
                height: 10.0,
              ),
              criarTextFormField(_ctrOrientacaoConduta, 'Orientação/Conduta',
                  'Campo Obrigatório', false, true),
              const SizedBox(
                height: 20.0,
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

  void retornarPlanoTerapeutico(int? idadmission) async {
    String url = URL_RETORNAR_PLANO_TERAPEUTICO + idadmission.toString();
    Response response = await uno.get(url);
    var retorno = "";
    if (response.status == 200) {
      retorno = response.data.toString();
    }
    setState(() {
      _ctrPlanoTerapeutico.text = retorno;
    });
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
      if (_ctrHd.text != "") {
        if (_ctrSituacaoClinica.text != "") {
          if (_ctrNutricaoOral == true ||
              _ctrNutricaoGT == true ||
              _ctrNutricaoCNE == true ||
              _ctrNutricaoIV == true) {
            if (_selAtividadeVidaDiaria != "0") {
              if (_ctrPaMaximo.text != "") {
                if (_ctrPaMinimo.text != "") {
                  if (_selNivelConscienciaRM != "0") {
                    if (_selNivelConscienciaRV != "0") {
                      if (_selNivelConscienciaAO != "0") {
                        _enviarFicha();
                      } else {
                        _retornaMensagemErro(
                            "Nível de consciência AO não selecionado.");
                      }
                    } else {
                      _retornaMensagemErro(
                          "Nível de consciência RV não selecionado.");
                    }
                  } else {
                    _retornaMensagemErro(
                        "Nível de consciência RM não selecionado.");
                  }
                } else {
                  _retornaMensagemErro("PA Mínimo não informado.");
                }
              } else {
                _retornaMensagemErro("PA Máximo não informado.");
              }
            } else {
              _retornaMensagemErro("Atividade da vida diária não informada.");
            }
          } else {
            _retornaMensagemErro("Nutrição não informada.");
          }
        } else {
          _retornaMensagemErro("Situação clínica não informada.");
        }
      } else {
        _retornaMensagemErro("HD não informado.");
      }
    } else {
      _retornaMensagemErro("Acompanhante não informado.");
    }
  }

  void _retornaMensagemErro(String s) {
    Uteis.mostrarAviso(context, "Aviso", s);
  }

  void _enviarFicha() {
    FichaMedicaModel ficha = FichaMedicaModel();
    ficha.idadmission = VariaveisGlobais.dadosAgenda?.idadmission;
    ficha.idprofessional = VariaveisGlobais.dadosUsuario?.idperson;
    ficha.idcapconsult = VariaveisGlobais.dadosAgenda?.idcapconsult;
    ficha.idprofagenda = VariaveisGlobais.dadosAgenda?.idprofagenda;
    ficha.datainicio = VariaveisGlobais.dataInicioAtendimento;
    ficha.hd = _ctrHd.text;
    ficha.acompanhante = _ctrAcompanhante.text;
    ficha.situacaoclinica = _ctrSituacaoClinica.text;
    ficha.justificativaatendimentodomiciliar =
        _ctrJustificativaAtendimentoDomiciliar.text;
    ficha.fisioterapiamotora = int.tryParse(_ctrFisioterapiaMotora.text);
    ficha.fisioterapiarespiratoria =
        int.tryParse(_ctrFisioterapiaRespiratoria.text);
    ficha.nutricionista = int.tryParse(_ctrNutricionista.text);
    ficha.fonoterapia = int.tryParse(_ctrFonoterapia.text);
    ficha.enfermagem = int.tryParse(_ctrEnfermagem.text);
    ficha.terapiaocupacional = int.tryParse(_ctrTerapiaOcupacional.text);
    ficha.psicologo = int.tryParse(_ctrPsicologo.text);
    ficha.examefisico = _ctrExameFisico.text;
    ficha.antibiotico = _ctrAntibiotico.text;
    ficha.nutricaooral = _ctrNutricaoOral == true ? 1 : 0;
    ficha.nutricaogt = _ctrNutricaoGT == true ? 1 : 0;
    ficha.nutricaocne = _ctrNutricaoCNE == true ? 1 : 0;
    ficha.nutricaoiv = _ctrNutricaoIV == true ? 1 : 0;
    ficha.atividadevidadiaria = int.tryParse(_selAtividadeVidaDiaria);
    ficha.pamax = int.tryParse(_ctrPaMaximo.text);
    ficha.pamin = int.tryParse(_ctrPaMinimo.text);
    ficha.fc = _ctrFC.text;
    ficha.fr = _ctrFR.text;
    ficha.nivelconscienciarm = int.tryParse(_selNivelConscienciaRM);
    ficha.nivelconscienciarv = int.tryParse(_selNivelConscienciaRV);
    ficha.nivelconscienciaao = int.tryParse(_selNivelConscienciaAO);
    ficha.nivelconscienciapontos = ficha.nivelconscienciarm! +
        ficha.nivelconscienciarv! +
        ficha.nivelconscienciaao!;
    ficha.ventilacaomecanica = int.tryParse(_selVentilacaoMecanica);
    ficha.ventilador = _ctrVentilador.text;
    ficha.ostomiatraqueostomia = _ctrOstomiaTraqueostomia == true ? 1 : 0;
    ficha.ostomiagastrostomia = _ctrOstomiaGastrostomia == true ? 1 : 0;
    ficha.ostomiacateternasoenteral =
        _ctrOstomiaCateterNasoEnteral == true ? 1 : 0;
    ficha.ostomiacistostomia = _ctrOstomiaCistostomia == true ? 1 : 0;
    ficha.ostomiacolostomia = _ctrOstomiaColostomia == true ? 1 : 0;
    ficha.ostomiaoutros = _ctrOutrasOstomias.text;
    ficha.aspiracaotraqueal = int.tryParse(_selAspiracaoTraqueal);
    ficha.acessovenoso = int.tryParse(_selAcessoVenoso);
    ficha.suporteoxigeniocilindro = _ctrSuporteOxigenioCilindro == true ? 1 : 0;
    ficha.suporteoxigenioconcentrador =
        _ctrSuporteOxigenioConcentrador == true ? 1 : 0;
    ficha.oxigenoterapia = int.tryParse(_selOxigenoterapia);
    ficha.solicitarexame = int.tryParse(_selSolicitarExame);
    ficha.mudancaprescricao = int.tryParse(_selMudarPrescricao);
    ficha.problemas = _ctrListaProblema.text;
    ficha.orientacao = _ctrOrientacaoConduta.text;
    VariaveisGlobais.dadosFichaMedica = ficha;
    Navigator.pushNamed(context, "assinatura_paciente");
  }
}
