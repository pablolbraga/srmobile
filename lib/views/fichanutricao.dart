// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/helpers/uteis.dart';
import 'package:srmobile/helpers/variaveisglobais.dart';
import 'package:srmobile/models/fichanutricaomodel.dart';

class FichaNutricao extends StatefulWidget {
  const FichaNutricao({super.key});

  @override
  State<FichaNutricao> createState() => _FichaNutricaoState();
}

class _FichaNutricaoState extends State<FichaNutricao> {
  var nome = VariaveisGlobais.dadosAgenda?.nmpaciente;

  final _ctrAcompanhante = TextEditingController();
  final _ctrGrupoOutros = TextEditingController();
  final _ctrNutricaoOutros = TextEditingController();
  final _ctrDietaEnteralIndustrializadoManipuladaDomicilioNecessidadeEnergetica =
      TextEditingController();
  final _ctrDietaEnteralIndustrializadoManipuladaDomicilioDescricao =
      TextEditingController();
  final _ctrDietaEnteralIndustrializadoProntaKcal = TextEditingController();
  final _ctrDietaEnteralIndustrializadoProntaDescricao =
      TextEditingController();
  final _ctrDietaEnteralIndustrializadoProntaFabricante =
      TextEditingController();
  final _ctrAvaliacaoSubjetivaKg = TextEditingController();
  final _ctrAvaliacaoSubjetivaDias = TextEditingController();
  final _ctrSintomasOutros = TextEditingController();
  final _ctrRitmoIntestinal = TextEditingController();
  final _ctrAvaliacaoAntropometricaAJ = TextEditingController();
  final _ctrAvaliacaoAntropometricaPesoAtual = TextEditingController();
  final _ctrAvaliacaoAntropometricaCircunferenciaAbdominal =
      TextEditingController();
  final _ctrAvaliacaoAntropometricaIMC = TextEditingController();
  final _ctrAvaliacaoAntropometricaCP = TextEditingController();
  final _ctrAvaliacaoAntropometricaIdade = TextEditingController();
  final _ctrAvaliacaoAntropometricaDCT = TextEditingController();
  final _ctrAvaliacaoAntropometricaCB = TextEditingController();
  final _ctrAvaliacaoAntropometricaCMB = TextEditingController();
  final _ctrAvaliacaoAntropometricaAltura = TextEditingController();
  final _ctrDiagnosticoNutricionalDescricao = TextEditingController();
  final _ctrConduta = TextEditingController();

  bool _ctrGrupoHAS = false;
  bool _ctrGrupoDiabetes = false;
  bool _ctrGrupoDislipidemia = false;
  bool _ctrGrupoImobilidade = false;
  bool _ctrGrupoObesidade = false;
  bool _ctrGrupoDesnutricao = false;
  bool _ctrDietaEnteralEntupimentoSonda = false;
  bool _habilitaEnteral = false;
  bool _habilitaDietaEnteralIndustrializado = false;
  bool _habilitaDietaEnteralIndustrializadoPronta = false;
  bool _habilitaDietaEnteralIndustrializadoManipuladaDomicilio = false;
  bool _ctrSintomasDiarreia = false;
  bool _ctrSintomasHiporexia = false;
  bool _ctrSintomasConstipacao = false;
  bool _ctrManterConduta = false;

  String _selNutricao = "";
  String _selNutricaoEnteral = "";
  String _selDietaEnteral = "";
  String _selDietaEnteralIndustrializadaTipo = "";
  String _selDietaEnteralIndustrializadaFornecedor = "";
  final String _selAvaliacaoSubjetivaIngesta = "";
  final String _selAvaliacaoSubjetivaPeso = "";
  final String _selDiagnosticoNutricionalAbaixo65 = "";
  final String _selDiagnosticoNutricionalAcima65 = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(nome.toString()),
          ),
          body: ListView(padding: const EdgeInsets.all(16.0), children: [
            criarTextFormField(_ctrAcompanhante, "Acompanhante",
                "Acompanhante não informado", false, false),
            const SizedBox(height: 10),
            criarTitulo("Grupos"),
            Row(
              children: [
                Checkbox(
                  value: _ctrGrupoHAS,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrGrupoHAS = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("HAS",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrGrupoDiabetes,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrGrupoDiabetes = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Diabetes",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrGrupoDislipidemia,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrGrupoDislipidemia = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Dislipidemia",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _ctrGrupoImobilidade,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrGrupoImobilidade = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Imobilidade",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrGrupoObesidade,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrGrupoObesidade = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Obesidade",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrGrupoDesnutricao,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrGrupoDesnutricao = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Desnutrição",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            criarTextFormField(_ctrGrupoOutros, "Outros Grupos",
                "Outros não informado", false, false),
            const SizedBox(height: 20),
            criarTitulo("Nutrição"),
            const SizedBox(height: 10),
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
                  value: _selNutricao,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blue,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.blue),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selNutricao = newValue!;
                      if (_selNutricao == "2") {
                        setState(() {
                          _habilitaEnteral = true;
                          _selNutricaoEnteral = "";
                        });
                      } else if (_selNutricao == "3") {
                        setState(() {
                          _habilitaEnteral = true;
                          _selNutricaoEnteral = "";
                        });
                      } else {
                        _habilitaEnteral = false;
                      }
                    });
                  },
                  items: LISTA_FICHANUTRICAO_TIPONUTRICAO,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: _habilitaEnteral,
              child: InputDecorator(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  labelText: "Se Enteral",
                  labelStyle: const TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selNutricaoEnteral,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.blue),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selNutricaoEnteral = newValue!;
                      });
                    },
                    items: LISTA_FICHANUTRICAO_TIPONUTRICAO_ENTERAL,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            criarTextFormField(_ctrNutricaoOutros, "Outras Nutrições",
                "Outros não informado", false, false),
            const SizedBox(height: 10),
            const Text("Dieta Enteral",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
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
                  value: _selDietaEnteral,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blue,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.blue),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selDietaEnteral = newValue!;
                      if (_selDietaEnteral == "2") {
                        setState(() {
                          _habilitaDietaEnteralIndustrializado = true;
                        });
                      } else if (_selDietaEnteral == "3") {
                        setState(() {
                          _habilitaDietaEnteralIndustrializado = true;
                        });
                      } else {
                        setState(() {
                          _habilitaDietaEnteralIndustrializado = false;
                          _selDietaEnteralIndustrializadaTipo = "";
                          _selDietaEnteralIndustrializadaFornecedor = "";

                          _habilitaDietaEnteralIndustrializadoPronta = false;
                          _habilitaDietaEnteralIndustrializadoManipuladaDomicilio =
                              false;
                          _ctrDietaEnteralIndustrializadoManipuladaDomicilioNecessidadeEnergetica
                              .text = "";
                          _ctrDietaEnteralIndustrializadoManipuladaDomicilioDescricao
                              .text = "";
                          _ctrDietaEnteralIndustrializadoProntaKcal.text = "";
                          _ctrDietaEnteralIndustrializadoProntaDescricao.text =
                              "";
                          _ctrDietaEnteralIndustrializadoProntaFabricante.text =
                              "";
                        });
                      }
                    });
                  },
                  items: LISTA_FICHANUTRICAO_DIETAENTERAL,
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: _ctrDietaEnteralEntupimentoSonda,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrDietaEnteralEntupimentoSonda = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Entupimento de Sonda",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: _habilitaDietaEnteralIndustrializado,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Dieta Industrializada",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
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
                          value: _selDietaEnteralIndustrializadaTipo,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blue,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.blue),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selDietaEnteralIndustrializadaTipo = newValue!;
                              if (_selDietaEnteralIndustrializadaTipo == '2') {
                                _habilitaDietaEnteralIndustrializadoPronta =
                                    true;
                                _habilitaDietaEnteralIndustrializadoManipuladaDomicilio =
                                    false;
                                _ctrDietaEnteralIndustrializadoManipuladaDomicilioNecessidadeEnergetica
                                    .text = "";
                                _ctrDietaEnteralIndustrializadoManipuladaDomicilioDescricao
                                    .text = "";
                              } else if (_selDietaEnteralIndustrializadaTipo ==
                                  '1') {
                                _habilitaDietaEnteralIndustrializadoPronta =
                                    false;
                                _habilitaDietaEnteralIndustrializadoManipuladaDomicilio =
                                    true;
                                _ctrDietaEnteralIndustrializadoProntaKcal.text =
                                    "";
                                _ctrDietaEnteralIndustrializadoProntaDescricao
                                    .text = "";
                                _ctrDietaEnteralIndustrializadoProntaFabricante
                                    .text = "";
                              } else if (_selDietaEnteralIndustrializadaTipo ==
                                  '3') {
                                _habilitaDietaEnteralIndustrializadoPronta =
                                    true;
                                _habilitaDietaEnteralIndustrializadoManipuladaDomicilio =
                                    true;
                              } else {
                                _habilitaDietaEnteralIndustrializadoPronta =
                                    false;
                                _habilitaDietaEnteralIndustrializadoManipuladaDomicilio =
                                    false;
                                _ctrDietaEnteralIndustrializadoManipuladaDomicilioNecessidadeEnergetica
                                    .text = "";
                                _ctrDietaEnteralIndustrializadoManipuladaDomicilioDescricao
                                    .text = "";
                                _ctrDietaEnteralIndustrializadoProntaKcal.text =
                                    "";
                                _ctrDietaEnteralIndustrializadoProntaDescricao
                                    .text = "";
                                _ctrDietaEnteralIndustrializadoProntaFabricante
                                    .text = "";
                              }
                            });
                          },
                          items:
                              LISTA_FICHANUTRICAO_DIETAENTERAL_INDUSTRIALIZADO,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InputDecorator(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                        labelText: "Fornecedor",
                        labelStyle: const TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selDietaEnteralIndustrializadaFornecedor,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blue,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.blue),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selDietaEnteralIndustrializadaFornecedor =
                                  newValue!;
                            });
                          },
                          items: LISTA_FICHANUTRICAO_DIETAENTERAL_FORNECEDOR,
                        ),
                      ),
                    ),
                    Visibility(
                      visible:
                          _habilitaDietaEnteralIndustrializadoManipuladaDomicilio,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 10),
                            const Text("Manipulada em Domicílio",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            criarTextFormField(
                                _ctrDietaEnteralIndustrializadoManipuladaDomicilioNecessidadeEnergetica,
                                "Necessidade Energética (Kcal)",
                                "Necessidade Energética (Kcal) não informado",
                                false,
                                false),
                            const SizedBox(height: 10),
                            criarTextFormField(
                                _ctrDietaEnteralIndustrializadoManipuladaDomicilioDescricao,
                                "Descrição",
                                "Descrição não informado",
                                false,
                                true),
                            const SizedBox(
                              height: 5.0,
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Visibility(
                      visible: _habilitaDietaEnteralIndustrializadoPronta,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 5.0,
                            ),
                            const Text("Pronta",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            criarTextFormField(
                                _ctrDietaEnteralIndustrializadoProntaKcal,
                                "Kcal/Dia",
                                "Kcal/Dia não informado",
                                false,
                                false),
                            const SizedBox(height: 10),
                            criarTextFormField(
                                _ctrDietaEnteralIndustrializadoProntaDescricao,
                                "Descrição",
                                "Descrição não informado",
                                false,
                                true),
                            const SizedBox(height: 10),
                            criarTextFormField(
                                _ctrDietaEnteralIndustrializadoProntaFabricante,
                                "Fabricante",
                                "Fabricante não informado",
                                false,
                                true),
                            const SizedBox(
                              height: 5.0,
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                  ]),
            ),
            const SizedBox(
              height: 5.0,
            ),
            criarTitulo("Avaliação Subjetiva"),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: criaDropDownButton(
                      context,
                      "Ingesta",
                      _selAvaliacaoSubjetivaIngesta,
                      LISTA_FICHANUTRICAO_AVALSUBJETIVA_INGESTA),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: criaDropDownButton(
                      context,
                      "Peso",
                      _selAvaliacaoSubjetivaPeso,
                      LISTA_FICHANUTRICAO_AVALSUBJETIVA_PESO),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: criarTextFormField(_ctrAvaliacaoSubjetivaKg, "Kg",
                      "Kg não informado", true, false),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: criarTextFormField(_ctrAvaliacaoSubjetivaDias, "Dias",
                      "Dias não informado", true, false),
                ),
              ],
            ),
            const SizedBox(height: 20),
            criarTitulo("Sintomas"),
            Row(
              children: [
                Checkbox(
                  value: _ctrSintomasDiarreia,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrSintomasDiarreia = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Diarréia",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrSintomasHiporexia,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrSintomasHiporexia = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Hiporexia",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
                Checkbox(
                  value: _ctrSintomasConstipacao,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrSintomasConstipacao = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Constipação",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            criarTextFormField(_ctrSintomasOutros, "Outros Sintomas",
                "Outros Sintomas não informado", false, false),
            const SizedBox(height: 10),
            criarTextFormField(_ctrRitmoIntestinal, "Ritmo Intestinal (dias)",
                "Ritmo Intestinal não informado", true, false),
            const SizedBox(height: 20),
            criarTitulo("Avaliação Antropométrica"),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: criarTextFormField(_ctrAvaliacaoAntropometricaAJ, "AJ",
                      "AJ não informado", false, false),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: criarTextFormField(
                      _ctrAvaliacaoAntropometricaPesoAtual,
                      "Peso Atual (kg)",
                      "Peso Atual não informado",
                      false,
                      false),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: criarTextFormField(
                      _ctrAvaliacaoAntropometricaCircunferenciaAbdominal,
                      "Circ. Abdominal (cm)",
                      "",
                      false,
                      false),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: criarTextFormField(
                      _ctrAvaliacaoAntropometricaIMC, "IMC", "", false, false),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: criarTextFormField(_ctrAvaliacaoAntropometricaCP,
                      "CP (cm)", "", false, false),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: criarTextFormField(_ctrAvaliacaoAntropometricaIdade,
                      "Idade", "", true, false),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: criarTextFormField(_ctrAvaliacaoAntropometricaDCT,
                      "DCT (mm)", "", true, false),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: criarTextFormField(_ctrAvaliacaoAntropometricaCB,
                      "CB (cm)", "", true, false),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: criarTextFormField(_ctrAvaliacaoAntropometricaCMB,
                      "CMB (cm)", "", true, false),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: criarTextFormField(_ctrAvaliacaoAntropometricaAltura,
                      "Altura (m)", "", true, false),
                ),
              ],
            ),
            const SizedBox(height: 20),
            criarTitulo("Diagnóstico Nutricional"),
            const SizedBox(height: 10),
            criaDropDownButton(
                context,
                "Abaixo de 65 anos",
                _selDiagnosticoNutricionalAbaixo65,
                LISTA_FICHANUTRICAO_DIAGNUTRICIONAL_ABAIXO65ANOS),
            const SizedBox(height: 10),
            criaDropDownButton(
                context,
                "Acima de 65 anos",
                _selDiagnosticoNutricionalAcima65,
                LISTA_FICHANUTRICAO_DIAGNUTRICIONAL_ACIMA65ANOS),
            const SizedBox(height: 10),
            criarTextFormField(_ctrDiagnosticoNutricionalDescricao,
                "Descrição do Diagnóstico Nutricional", "", false, true),
            const SizedBox(height: 20),
            criarTitulo("Conduta"),
            Row(
              children: [
                Checkbox(
                  value: _ctrManterConduta,
                  onChanged: (bool? value) {
                    setState(() {
                      _ctrManterConduta = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text("Manter Conduta",
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            criarTextFormField(_ctrConduta, "Conduta", "", false, true),
            const SizedBox(height: 20),
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
            const SizedBox(
              height: 20.0,
            ),
          ]),
        ),
        onWillPop: _voltarTela);
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

  void _validarCampos() {
    var idade = VariaveisGlobais.dadosAgenda?.idade;
    if (_selNutricao != "") {
      if ((_selNutricao == "Enteral") && (_selNutricaoEnteral != "")) {
        if (_selDietaEnteral != "") {
          if (_selAvaliacaoSubjetivaIngesta != "") {
            if (_selAvaliacaoSubjetivaPeso != "") {
              if (_ctrRitmoIntestinal.text != "") {
                if ((idade! <= 65) &&
                    (_selDiagnosticoNutricionalAbaixo65 !=
                        "Abaixo de 65 anos")) {
                  if ((idade > 65) &&
                      (_selDiagnosticoNutricionalAcima65 !=
                          "Acima de 65 anos")) {
                    if (_ctrConduta.text != "") {
                      _enviarDados();
                    } else {
                      Uteis.mostrarAviso(
                          context, "Aviso", "Conduta não informada.");
                    }
                  } else {
                    Uteis.mostrarAviso(context, "Aviso",
                        "Diagnóstico Nutricional acima de 65 anos não informado.");
                  }
                } else {
                  Uteis.mostrarAviso(context, "Aviso",
                      "Diagnóstico Nutricional abaixo de 65 anos não informado.");
                }
              } else {
                Uteis.mostrarAviso(
                    context, "Aviso", "Ritmo Intestinal não informado.");
              }
            } else {
              Uteis.mostrarAviso(context, "Aviso", "Peso não selecionado.");
            }
          } else {
            Uteis.mostrarAviso(context, "Aviso", "Ingesta não selecionada.");
          }
        } else {
          Uteis.mostrarAviso(
              context, "Aviso", "Dieta Enteral não selecionado.");
        }
      } else {
        Uteis.mostrarAviso(
            context, "Aviso", "Nutrição Enteral não selecionado.");
      }
    } else {
      Uteis.mostrarAviso(context, "Aviso", "Nutrição não selecionado.");
    }
  }

  void _enviarDados() {
    FichaNutricaoModel ficha = FichaNutricaoModel();
    ficha.idadmission = VariaveisGlobais.dadosAgenda?.idadmission;
    ficha.datainicio = VariaveisGlobais.dataInicioAtendimento;
    ficha.idprofessional = VariaveisGlobais.dadosUsuario?.idperson;
    ficha.idprofagenda = VariaveisGlobais.dadosAgenda?.idprofagenda;
    ficha.idcapconsult = VariaveisGlobais.dadosAgenda?.idcapconsult;
    ficha.acompanhante = _ctrAcompanhante.text;
    ficha.grupohas = _ctrGrupoHAS == true ? "S" : "N";
    ficha.grupodiabetes = _ctrGrupoDiabetes == true ? "S" : "N";
    ficha.grupodislipidemia = _ctrGrupoDislipidemia == true ? "S" : "N";
    ficha.grupoimobilidade = _ctrGrupoImobilidade == true ? "S" : "N";
    ficha.grupoobesidade = _ctrGrupoObesidade == true ? "S" : "N";
    ficha.grupodesnutricao = _ctrGrupoDesnutricao == true ? "S" : "N";
    ficha.grupooutros = _ctrGrupoOutros.text;
    ficha.nutricao = _selNutricao as int?;
    ficha.nutricaotipoenteral = _selNutricaoEnteral as int?;
    ficha.dietaenteral = _selDietaEnteral as int?;
    ficha.dietaindustipo = _selDietaEnteralIndustrializadaTipo as int?;
    ficha.dietaindustfornecedor =
        _selDietaEnteralIndustrializadaFornecedor as int?;
    ficha.dietaindustmanipqtde =
        _ctrDietaEnteralIndustrializadoManipuladaDomicilioNecessidadeEnergetica
            .text;
    ficha.dietaindustmanipdesc =
        _ctrDietaEnteralIndustrializadoManipuladaDomicilioDescricao.text;
    ficha.dietaindustprontaqtde =
        _ctrDietaEnteralIndustrializadoProntaKcal.text;
    ficha.dietaindustprontadesc =
        _ctrDietaEnteralIndustrializadoProntaDescricao.text;
    ficha.dietaindustprontafab =
        _ctrDietaEnteralIndustrializadoProntaFabricante.text;
    ficha.avalsubjingesta = _selAvaliacaoSubjetivaIngesta as int?;
    ficha.avalsubjpesotipo = _selAvaliacaoSubjetivaPeso as int?;
    ficha.avalsubjpesoqtde = _ctrAvaliacaoSubjetivaKg.text;
    ficha.avalsubjpesotempo = _ctrAvaliacaoSubjetivaDias.text;
    ficha.avalsubjsintomadiarreia = _ctrSintomasDiarreia == true ? "S" : "N";
    ficha.avalsubjsintomahiporexia = _ctrSintomasHiporexia == true ? "S" : "N";
    ficha.avalsubjsintomaconstipacao =
        _ctrSintomasConstipacao == true ? "S" : "N";
    ficha.avalsubjsintomaoutros = _ctrSintomasOutros.text;
    ficha.avalsubjritmointestinal = _ctrRitmoIntestinal.text;
    ficha.avalantroaj = _ctrAvaliacaoAntropometricaAJ.text;
    ficha.avalantropeso = _ctrAvaliacaoAntropometricaPesoAtual.text;
    ficha.avalantrocircabd =
        _ctrAvaliacaoAntropometricaCircunferenciaAbdominal.text;
    ficha.avalantroimc = _ctrAvaliacaoAntropometricaIMC.text;
    ficha.avalantrocp = _ctrAvaliacaoAntropometricaCP.text;
    ficha.avalantroidade = _ctrAvaliacaoAntropometricaIdade.text;
    ficha.avalantrodct = _ctrAvaliacaoAntropometricaDCT.text;
    ficha.avalantrocb = _ctrAvaliacaoAntropometricaCB.text;
    ficha.avalantrocmb = _ctrAvaliacaoAntropometricaCMB.text;
    ficha.avalantroaltura = _ctrAvaliacaoAntropometricaAltura.text;
    ficha.diagnutriabaixo65 = _selDiagnosticoNutricionalAbaixo65 as int?;
    ficha.diagnutriacima65 = _selDiagnosticoNutricionalAcima65 as int?;
    ficha.diagnutridesc = _ctrDiagnosticoNutricionalDescricao.text;
    ficha.manterconduta = _ctrManterConduta == true ? "S" : "N";
    ficha.conduta = _ctrConduta.text;
    VariaveisGlobais.dadosFichaNutricao = ficha;
    Navigator.pushNamed(context, "assinatura_paciente");
  }
}
