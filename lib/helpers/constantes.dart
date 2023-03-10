// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

//const URL_BASE =
//    "http://profissionaisexternos.sauderesidence.tk/SaudeResidenceHomeCareServices/srhcws/";
const URL_BASE =
    "http://192.168.0.77:8080/SaudeResidenceHomeCareServices/srhcws/";
const IP_INTRANET = "http://200.150.138.34:8001/sauderesidence";

const BANCODB = "srmobile.db";

const TB_FICHATERAPIA = "TB_FICHATERAPIA";
const TB_FICHATERAPIA_ID = "ID";
const TB_FICHATERAPIA_IDADMISSION = "IDADMISSION";
const TB_FICHATERAPIA_IDCAPCONSULT = "IDCAPCONSULT";
const TB_FICHATERAPIA_IDPROFAGENDA = "IDPROFAGENDA";
const TB_FICHATERAPIA_DATAINICIO = "DATAINICIO";
const TB_FICHATERAPIA_DATAFIM = "DATAFIM";
const TB_FICHATERAPIA_IDPROFESSIONAL = "IDPROFESSIONAL";
const TB_FICHATERAPIA_IDESPECIALIDADE = "IDESPECIALIDADE";
const TB_FICHATERAPIA_NMPACIENTE = "NMPACIENTE";
const TB_FICHATERAPIA_LATITUDE = "LATITUDE";
const TB_FICHATERAPIA_LONGITUDE = "LONGITUDE";
const TB_FICHATERAPIA_PARTICIPACAOCLIENTE = "PARTICIPACAOCLIENTE";
const TB_FICHATERAPIA_EXECUCAOTECNICAPROPOSTA = "EXECUCAOTECNICAPROPOSTA";
const TB_FICHATERAPIA_OBSERVACAO = "OBSERVACAO";
const TB_FICHATERAPIA_ASSINATURAPACIENTE = "ASSINATURAPACIENTE";
const TB_FICHATERAPIA_ASSINATURAPROFISSIONAL = "ASSINATURAPROFISSIONAL";

const TB_FICHAMEDICA = "TB_FICHAMEDICA";
const TB_FICHAMEDICA_ID = "ID";
const TB_FICHAMEDICA_IDADMISSION = "TIDADMISSION";
const TB_FICHAMEDICA_IDCAPCONSULT = "IDCAPCONSULT";
const TB_FICHAMEDICA_IDPROFAGENDA = "IDPROFAGENDA";
const TB_FICHAMEDICA_DATAINICIO = "DATAINICIO";
const TB_FICHAMEDICA_DATAFIM = "DATAFIM";
const TB_FICHAMEDICA_IDPROFESSIONAL = "IDPROFESSIONAL";
const TB_FICHAMEDICA_HD = "HD";
const TB_FICHAMEDICA_ACOMPANHANTE = "ACOMPANHANTE";
const TB_FICHAMEDICA_SITUACAOCLINICA = "SITUACAOCLINICA";
const TB_FICHAMEDICA_JUSTIFICATIVAATENDIMENTODOMICILIAR =
    "JUSTIFICATIVAATENDIMENTODOMICILIAR";
const TB_FICHAMEDICA_FISIOTERAPIAMOTORA = "FISIOTERAPIAMOTORA";
const TB_FICHAMEDICA_FISIOTERAPIARESPIRATORIA = "FISIOTERAPIARESPIRATORIA";
const TB_FICHAMEDICA_NUTRICIONISTA = "NUTRICIONISTA";
const TB_FICHAMEDICA_FONOTERAPIA = "FONOTERAPIA";
const TB_FICHAMEDICA_ENFERMAGEM = "ENFERMAGEM";
const TB_FICHAMEDICA_TERAPIAOCUPACIONAL = "TERAPIAOCUPACIONAL";
const TB_FICHAMEDICA_PSICOLOGO = "PSICOLOGO";
const TB_FICHAMEDICA_EXAMEFISICO = "EXAMEFISICO";
const TB_FICHAMEDICA_ANTIBIOTICO = "ANTIBIOTICO";
const TB_FICHAMEDICA_NUTRICAOORAL = "NUTRICAOORAL";
const TB_FICHAMEDICA_NUTRICAOGT = "NUTRICAOGT";
const TB_FICHAMEDICA_NUTRICAOCNE = "NUTRICAOCNE";
const TB_FICHAMEDICA_NUTRICAOIV = "NUTRICAOIV";
const TB_FICHAMEDICA_ATIVIDADEVIDADIARIA = "ATIVIDADEVIDADIARIA";
const TB_FICHAMEDICA_PAMAX = "PAMAX";
const TB_FICHAMEDICA_PAMIN = "PAMIN";
const TB_FICHAMEDICA_FC = "FC";
const TB_FICHAMEDICA_FR = "FR";
const TB_FICHAMEDICA_NIVELCONSCIENCIARM = "NIVELCONSCIENCIARM";
const TB_FICHAMEDICA_NIVELCONSCIENCIARV = "NIVELCONSCIENCIARV";
const TB_FICHAMEDICA_NIVELCONSCIENCIAAO = "NIVELCONSCIENCIAAO";
const TB_FICHAMEDICA_NIVELCONSCIENCIAPONTOS = "NIVELCONSCIENCIAPONTOS";
const TB_FICHAMEDICA_VENTILACAOMECANICA = "VENTILACAOMECANICA";
const TB_FICHAMEDICA_VENTILADOR = "VENTILADOR";
const TB_FICHAMEDICA_OSTOMIATRAQUEOSTOMIA = "OSTOMIATRAQUEOSTOMIA";
const TB_FICHAMEDICA_OSTOMIAGASTROSTOMIA = "OSTOMIAGASTROSTOMIA";
const TB_FICHAMEDICA_OSTOMIACATETERNASOENTERAL = "OSTOMIACATETERNASOENTERAL";
const TB_FICHAMEDICA_OSTOMIACISTOSTOMIA = "OSTOMIACISTOSTOMIA";
const TB_FICHAMEDICA_OSTOMIACOLOSTOMIA = "OSTOMIACOLOSTOMIA";
const TB_FICHAMEDICA_OSTOMIAOUTROS = "OSTOMIAOUTROS";
const TB_FICHAMEDICA_ASPIRACAOTRAQUEAL = "ASPIRACAOTRAQUEAL";
const TB_FICHAMEDICA_ACESSOVENOSO = "ACESSOVENOSO";
const TB_FICHAMEDICA_SUPORTEOXIGENIOCILINDRO = "SUPORTEOXIGENIOCILINDRO";
const TB_FICHAMEDICA_SUPORTEOXIGENIOCONCENTRADOR =
    "SUPORTEOXIGENIOCONCENTRADOR";
const TB_FICHAMEDICA_OXIGENOTERAPIA = "OXIGENOTERAPIA";
const TB_FICHAMEDICA_SOLICITAREXAME = "SOLICITAREXAME";
const TB_FICHAMEDICA_MUDANCAPRESCRICAO = "MUDANCAPRESCRICAO";
const TB_FICHAMEDICA_PROBLEMAS = "PROBLEMAS";
const TB_FICHAMEDICA_ORIENTACAO = "ORIENTACAO";
const TB_FICHAMEDICA_ASSINATURAPACIENTE = "ASSINATURAPACIENTE";
const TB_FICHAMEDICA_ASSINATURAPROFISSIONAL = "ASSINATURAPROFISSIONAL";
const TB_FICHAMEDICA_LATITUDE = "LATITUDE";
const TB_FICHAMEDICA_LONGITUDE = "LONGITUDE";
const TB_FICHAMEDICA_NMPACIENTE = "NMPACIENTE";

const TB_FICHAENFERMAGEM = "TB_FICHAENFERMAGEM";
const TB_FICHAENFERMAGEM_ID = "ID";
const TB_FICHAENFERMAGEM_IDADMISSION = "IDADMISSION";
const TB_FICHAENFERMAGEM_IDCAPCONSULT = "IDCAPCONSULT";
const TB_FICHAENFERMAGEM_IDPROFAGENDA = "IDPROFAGENDA";
const TB_FICHAENFERMAGEM_DATAINICIO = "DATAINICIO";
const TB_FICHAENFERMAGEM_DATAFIM = "DATAFIM";
const TB_FICHAENFERMAGEM_IDPROFESSIONAL = "IDPROFESSIONAL";
const TB_FICHAENFERMAGEM_ACOMPANHANTE = "ACOMPANHANTE";
const TB_FICHAENFERMAGEM_HOSPITAL = "HOSPITAL";
const TB_FICHAENFERMAGEM_CUIDADOBANHO = "CUIDADOBANHO";
const TB_FICHAENFERMAGEM_CUIDADOVESTIR = "CUIDADOVESTIR";
const TB_FICHAENFERMAGEM_CUIDADOTRANSFERENCIA = "CUIDADOTRANSFERENCIA";
const TB_FICHAENFERMAGEM_CUIDADOCONTINENCIA = "CUIDADOCONTINENCIA";
const TB_FICHAENFERMAGEM_CUIDADOALIMENTACAO = "CUIDADOALIMENTACAO";
const TB_FICHAENFERMAGEM_UTILIZACAOTQT = "UTILIZACAOTQT";
const TB_FICHAENFERMAGEM_UTILIZACAOCNE = "UTILIZACAOCNE";
const TB_FICHAENFERMAGEM_UTILIZACAOGT = "UTILIZACAOGT";
const TB_FICHAENFERMAGEM_UTILIZACAOCVD = "UTILIZACAOCVD";
const TB_FICHAENFERMAGEM_UTILIZACAOOUTROS = "UTILIZACAOOUTROS";
const TB_FICHAENFERMAGEM_UTILIZACAOOUTROSTEXTO = "UTILIZACAOOUTROSTEXTO";
const TB_FICHAENFERMAGEM_OXIGENOTERAPIACILINDRO = "OXIGENOTERAPIACILINDRO";
const TB_FICHAENFERMAGEM_OXIGENOTERAPIACONCENTRADOR =
    "OXIGENOTERAPIACONCENTRADOR";
const TB_FICHAENFERMAGEM_OXIGENOTERAPIACONTINUO = "OXIGENOTERAPIACONTINUO";
const TB_FICHAENFERMAGEM_OXIGENOTERAPIANAO = "OXIGENOTERAPIANAO";
const TB_FICHAENFERMAGEM_VENTILACAOMECANICA = "VENTILACAOMECANICA";
const TB_FICHAENFERMAGEM_VENTILACAOMECANICAEQUIPAMENTO =
    "VENTILACAOMECANICAEQUIPAMENTO";
const TB_FICHAENFERMAGEM_PAMAX = "PAMAX";
const TB_FICHAENFERMAGEM_PAMIN = "PAMIN";
const TB_FICHAENFERMAGEM_FERIDAPRESSAO = "FERIDAPRESSAO";
const TB_FICHAENFERMAGEM_FERIDAVASCULOGENCIA = "FERIDAVASCULOGENCIA";
const TB_FICHAENFERMAGEM_FERIDACIRURGIA = "FERIDACIRURGIA";
const TB_FICHAENFERMAGEM_FERIDAOUTROS = "FERIDAOUTROS";
const TB_FICHAENFERMAGEM_DIAG001 = "DIAG001";
const TB_FICHAENFERMAGEM_DIAG002 = "DIAG002";
const TB_FICHAENFERMAGEM_DIAG003 = "DIAG003";
const TB_FICHAENFERMAGEM_DIAG004 = "DIAG004";
const TB_FICHAENFERMAGEM_DIAG005 = "DIAG005";
const TB_FICHAENFERMAGEM_DIAG006 = "DIAG006";
const TB_FICHAENFERMAGEM_DIAG007 = "DIAG007";
const TB_FICHAENFERMAGEM_DIAG008 = "DIAG008";
const TB_FICHAENFERMAGEM_DIAG009 = "DIAG009";
const TB_FICHAENFERMAGEM_DIAG010 = "DIAG010";
const TB_FICHAENFERMAGEM_DIAG011 = "DIAG011";
const TB_FICHAENFERMAGEM_DIAG012 = "DIAG012";
const TB_FICHAENFERMAGEM_DIAG013 = "DIAG013";
const TB_FICHAENFERMAGEM_DIAG014 = "DIAG014";
const TB_FICHAENFERMAGEM_DIAG015 = "DIAG015";
const TB_FICHAENFERMAGEM_PROC001 = "PROC001";
const TB_FICHAENFERMAGEM_PROC002 = "PROC002";
const TB_FICHAENFERMAGEM_PROC003 = "PROC003";
const TB_FICHAENFERMAGEM_PROC004 = "PROC004";
const TB_FICHAENFERMAGEM_PROC005 = "PROC005";
const TB_FICHAENFERMAGEM_PROC006 = "PROC006";
const TB_FICHAENFERMAGEM_PROC007 = "PROC007";
const TB_FICHAENFERMAGEM_PROC008 = "PROC008";
const TB_FICHAENFERMAGEM_PROCOUTROS = "PROCOUTROS";
const TB_FICHAENFERMAGEM_PROCOUTROSTEXTO = "PROCOUTROSTEXTO";
const TB_FICHAENFERMAGEM_CUID001 = "CUID001";
const TB_FICHAENFERMAGEM_CUID002 = "CUID002";
const TB_FICHAENFERMAGEM_CUID003 = "CUID003";
const TB_FICHAENFERMAGEM_CUID004 = "CUID004";
const TB_FICHAENFERMAGEM_CUID005 = "CUID005";
const TB_FICHAENFERMAGEM_CUID006 = "CUID006";
const TB_FICHAENFERMAGEM_CUID007 = "CUID007";
const TB_FICHAENFERMAGEM_CUID008 = "CUID008";
const TB_FICHAENFERMAGEM_CUIDOUTROS = "CUIDOUTROS";
const TB_FICHAENFERMAGEM_CUIDOUTROSTEXTO = "CUIDOUTROSTEXTO";
const TB_FICHAENFERMAGEM_BRADENPERCEPCAOSENSORIAL = "BRADENPERCEPCAOSENSORIAL";
const TB_FICHAENFERMAGEM_BRADENUMIDADE = "BRADENUMIDADE";
const TB_FICHAENFERMAGEM_BRADENATIVIDADE = "BRADENATIVIDADE";
const TB_FICHAENFERMAGEM_BRADENMOBILIDADE = "BRADENMOBILIDADE";
const TB_FICHAENFERMAGEM_BRADENNUTRICAO = "BRADENNUTRICAO";
const TB_FICHAENFERMAGEM_BRADENFICCAO = "BRADENFICCAO";
const TB_FICHAENFERMAGEM_OBSERVACAO = "OBSERVACAO";
const TB_FICHAENFERMAGEM_ASSINATURAPACIENTE = "ASSINATURAPACIENTE";
const TB_FICHAENFERMAGEM_ASSINATURAPROFISSIONAL = "ASSINATURAPROFISSIONAL";
const TB_FICHAENFERMAGEM_LATITUDE = "LATITUDE";
const TB_FICHAENFERMAGEM_LONGITUDE = "LONGITUDE";
const TB_FICHAENFERMAGEM_NMPACIENTE = "NMPACIENTE";

const TB_FICHANUTRICAO = "TB_FICHANUTRICAO";
const TB_FICHANUTRICAO_ID = "ID";
const TB_FICHANUTRICAO_IDADMISSION = "IDADMISSION";
const TB_FICHANUTRICAO_DATAINICIO = "DATAINICIO";
const TB_FICHANUTRICAO_DATAFIM = "DATAFIM";
const TB_FICHANUTRICAO_IDPROFESSIONAL = "IDPROFESSIONAL";
const TB_FICHANUTRICAO_IDPROFAGENDA = "IDPROFAGENDA";
const TB_FICHANUTRICAO_IDCAPCONSULT = "IDCAPCONSULT";
const TB_FICHANUTRICAO_ACOMPANHANTE = "ACOMPANHANTE";
const TB_FICHANUTRICAO_GRUPOHAS = "GRUPOHAS";
const TB_FICHANUTRICAO_GRUPODIABETES = "GRUPODIABETES";
const TB_FICHANUTRICAO_GRUPODISLIPIDEMIA = "GRUPODISLIPIDEMIA";
const TB_FICHANUTRICAO_GRUPOIMOBILIDADE = "GRUPOIMOBILIDADE";
const TB_FICHANUTRICAO_GRUPOOBESIDADE = "GRUPOOBESIDADE";
const TB_FICHANUTRICAO_GRUPODESNUTRICAO = "GRUPODESNUTRICAO";
const TB_FICHANUTRICAO_GRUPOOUTROS = "GRUPOOUTROS";
const TB_FICHANUTRICAO_NUTRICAO = "NUTRICAO";
const TB_FICHANUTRICAO_NUTRICAOTIPOENTERAL = "NUTRICAOTIPOENTERAL";
const TB_FICHANUTRICAO_NUTRICAOOUTROS = "NUTRICAOOUTROS";
const TB_FICHANUTRICAO_DIETAENTERAL = "DIETAENTERAL";
const TB_FICHANUTRICAO_DIETAENTERALENTUPIMENTO = "DIETAENTERALENTUPIMENTO";
const TB_FICHANUTRICAO_DIETAINDUSTIPO = "DIETAINDUSTIPO";
const TB_FICHANUTRICAO_DIETAINDUSFORNECEDOR = "DIETAINDUSFORNECEDOR";
const TB_FICHANUTRICAO_DIETAINDUSMANIPQTDE = "DIETAINDUSMANIPQTDE";
const TB_FICHANUTRICAO_DIETAINDUSMANIPDESC = "DIETAINDUSMANIPDESC";
const TB_FICHANUTRICAO_DIETAINDUSPRONTAQTDE = "DIETAINDUSPRONTAQTDE";
const TB_FICHANUTRICAO_DIETAINDUSPRONTADESC = "DIETAINDUSPRONTADESC";
const TB_FICHANUTRICAO_DIETAINDUSPRONTAFAB = "DIETAINDUSPRONTAFAB";
const TB_FICHANUTRICAO_AVALSUBJINGESTA = "AVALSUBJINGESTA";
const TB_FICHANUTRICAO_AVALSUBJPESOTIPO = "AVALSUBJPESOTIPO";
const TB_FICHANUTRICAO_AVALSUBJPESOQTDE = "AVALSUBJPESOQTDE";
const TB_FICHANUTRICAO_AVALSUBJPESOTEMPO = "AVALSUBJPESOTEMPO";
const TB_FICHANUTRICAO_AVALSUBJSINTOMADIARREIA = "AVALSUBJSINTOMADIARREIA";
const TB_FICHANUTRICAO_AVALSUBJSINTOMAHIPOREXIA = "AVALSUBJSINTOMAHIPOREXIA";
const TB_FICHANUTRICAO_AVALSUBJSINTOMACONSTIPACAO =
    "AVALSUBJSINTOMACONSTIPACAO";
const TB_FICHANUTRICAO_AVALSUBJSINTOMAOUTROS = "AVALSUBJSINTOMAOUTROS";
const TB_FICHANUTRICAO_AVALSUBJRITMOINTESTINAL = "AVALSUBJRITMOINTESTINAL";
const TB_FICHANUTRICAO_AVALANTROAJ = "AVALANTROAJ";
const TB_FICHANUTRICAO_AVALANTROPESO = "AVALANTROPESO";
const TB_FICHANUTRICAO_AVALANTROCIRCABD = "AVALANTROCIRCABD";
const TB_FICHANUTRICAO_AVALANTROIMC = "AVALANTROIMC";
const TB_FICHANUTRICAO_AVALANTROCP = "AVALANTROCP";
const TB_FICHANUTRICAO_AVALANTROIDADE = "AVALANTROIDADE";
const TB_FICHANUTRICAO_AVALANTRODCT = "AVALANTRODCT";
const TB_FICHANUTRICAO_AVALANTROCB = "AVALANTROCB";
const TB_FICHANUTRICAO_AVALANTROCMB = "AVALANTROCMB";
const TB_FICHANUTRICAO_AVALANTROALTURA = "AVALANTROALTURA";
const TB_FICHANUTRICAO_DIAGNUTRIABAIXO65 = "DIAGNUTRIABAIXO65";
const TB_FICHANUTRICAO_DIAGNUTRIACIMA65 = "DIAGNUTRIACIMA65";
const TB_FICHANUTRICAO_DIAGNUTRIDESC = "DIAGNUTRIDESC";
const TB_FICHANUTRICAO_MANTERCONDUTA = "MANTERCONDUTA";
const TB_FICHANUTRICAO_CONDUTA = "CONDUTA";
const TB_FICHANUTRICAO_ASSINATURAPACIENTE = "ASSINATURAPACIENTE";
const TB_FICHANUTRICAO_ASSINATURAPROFISSIONAL = "ASSINATURAPROFISSIONAL";
const TB_FICHANUTRICAO_LATITUDE = "LATITUDE";
const TB_FICHANUTRICAO_LONGITUDE = "LONGITUDE";
const TB_FICHANUTRICAO_NMPACIENTE = "NMPACIENTE";

const TB_FICHATECNICOBASE = "TB_TECNICOBASE";
const TB_FICHATECNICOBASE_ID = "ID";
const TB_FICHATECNICOBASE_IDADMISSION = "IDADMISSION";
const TB_FICHATECNICOBASE_DATAINICIO = "DATAINICIO";
const TB_FICHATECNICOBASE_DATAFIM = "DATAFIM";
const TB_FICHATECNICOBASE_IDPROFESSIONAL = "IDPROFESSIONAL";
const TB_FICHATECNICOBASE_IDPROFAGENDA = "IDPROFAGENDA";
const TB_FICHATECNICOBASE_IDCAPCONSULT = "IDCAPCONSULT";
const TB_FICHATECNICOBASE_ASSINATURAPACIENTE = "ASSINATURAPACIENTE";
const TB_FICHATECNICOBASE_ASSINATURAPROFISSIONAL = "ASSINATURAPROFISSIONAL";
const TB_FICHATECNICOBASE_LATITUDE = "LATITUDE";
const TB_FICHATECNICOBASE_LONGITUDE = "LONGITUDE";
const TB_FICHATECNICOBASE_NMPACIENTE = "NMPACIENTE";
const TB_FICHATECNICOBASE_TIPOCHAMADA = "TIPOCHAMADA";
const TB_FICHATECNICOBASE_PROC001 = "ADMINISTRACAOMED";
const TB_FICHATECNICOBASE_PROC002 = "ADMINISTRACAOMEDIV";
const TB_FICHATECNICOBASE_PROC003 = "ADMINISTRACAOMEDIM";
const TB_FICHATECNICOBASE_PROC004 = "ADMINISTRACAOMEDSC";
const TB_FICHATECNICOBASE_PROC005 = "CLISTER";
const TB_FICHATECNICOBASE_PROC006 = "CURATIVO";
const TB_FICHATECNICOBASE_PROC007 = "CATETERISMOVESICALALIVIO";
const TB_FICHATECNICOBASE_PROC008 = "CATETERISMOVESICALURINA";
const TB_FICHATECNICOBASE_PROC009 = "CUIDADOSGERAIS";
const TB_FICHATECNICOBASE_PROC010 = "ECG";
const TB_FICHATECNICOBASE_PROC011 = "PUNCAO";
const TB_FICHATECNICOBASE_PROC012 = "RETIRADAPONTOS";
const TB_FICHATECNICOBASE_PROC_OUTROS = "OUTROSPROCEDIMENTOS";
const TB_FICHATECNICOBASE_ABD = "ABD";
const TB_FICHATECNICOBASE_ALGODAO = "ALGODAO";
const TB_FICHATECNICOBASE_AGULHA = "AGULHA";
const TB_FICHATECNICOBASE_ALCOOL = "ALCOOL";
const TB_FICHATECNICOBASE_ATADURA = "ATADURA";
const TB_FICHATECNICOBASE_CATETER = "CATETER";
const TB_FICHATECNICOBASE_EQUIPO = "EQUIPO";
const TB_FICHATECNICOBASE_EXTENSOR1VIA = "EXTENSOR1VIA";
const TB_FICHATECNICOBASE_EXTENSOR2VIA = "EXTENSOR2VIA";
const TB_FICHATECNICOBASE_GAZEACOLCHOADA = "GAZEACOLCHOADA";
const TB_FICHATECNICOBASE_GAZEEMBEBIDA = "GAZEEMBEBIDA";
const TB_FICHATECNICOBASE_GAZEESTERIL = "GAZEESTERIL";
const TB_FICHATECNICOBASE_HEPARINA = "HEPARINA";
const TB_FICHATECNICOBASE_IVFIX = "IVFIX";
const TB_FICHATECNICOBASE_JELCO = "JELCO";
const TB_FICHATECNICOBASE_BISTURI = "BISTURI";
const TB_FICHATECNICOBASE_LUVAESTERIL = "LUVAESTERIL";
const TB_FICHATECNICOBASE_LUVAPROCEDIMENTO = "LUVAPROCEDIMENTO";
const TB_FICHATECNICOBASE_MASCARA = "MASCARA";
const TB_FICHATECNICOBASE_MICROPORE2510 = "MICROPORE2510";
const TB_FICHATECNICOBASE_MICROPORE5010 = "MICROPORE5010";
const TB_FICHATECNICOBASE_SCALP = "SCALP";
const TB_FICHATECNICOBASE_SERINGA = "SERINGA";
const TB_FICHATECNICOBASE_SOROFISIOLOGICO = "SOROFISIOLOGICO";
const TB_FICHATECNICOBASE_OUTROSMATERIAIS = "OUTROSMATERIAIS";
const TB_FICHATECNICOBASE_MEDICAMENTOS = "MEDICAMENTOS";
const TB_FICHATECNICOBASE_EVOLUCAO = "EVOLUCAO";

const URL_ESQUECEU_SENHA = "${URL_BASE}esqueceusenha/";
const URL_VALIDAR_LOGIN_SENHA = "${URL_BASE}validarloginsenha/";
const URL_ALTERAR_SENHA = "${URL_BASE}alterarsenha/";
const URL_LISTAR_AGENDA = "${URL_BASE}listaragendaporprofissional/";
const URL_LISTAR_PACIENTES = "${URL_BASE}listarpacientesgeral";
const URL_LISTAR_PRESCRICAO_MEDICA = "${URL_BASE}listarprescricaomedica/";
const URL_LISTAR_PRESCRICAO_ENFERMAGEM =
    "${URL_BASE}listarprescricaoenfermagem/";
const URL_LISTAR_PROCEDIMENTO_ENFERMAGEM =
    "${URL_BASE}listarprocedimentoenfermagem/";
const URL_LISTAR_EQUIPAMENTO = "${URL_BASE}listarequipamentos/";
const URL_LISTAR_EXAME = "${URL_BASE}listarexamesporadmissao/";

const URL_ADICIONAR_FICHA_TERAPIA = "${URL_BASE}addfichaterapia";
const URL_ADICIONAR_FICHA_MEDICA = "${URL_BASE}addfichamedica";
const URL_ADICIONAR_FICHA_ENFERMAGEM = "${URL_BASE}addfichaenfermagem";
const URL_ADICIONAR_FICHA_NUTRICAO = "${URL_BASE}addfichanutricao";
const URL_ADICIONAR_FICHA_TECNICOBASE = "${URL_BASE}addfichatecnicobase";
const URL_ALTERAR_PRESCRICAO_MEDICA = "${URL_BASE}addprescricaomedica/";
const URL_ALTERAR_PRESCRICAO_ENFERMAGEM = "${URL_BASE}addsolicitarmaterial/";
const URL_ALTERAR_PROCEDIMENTO_ENFERMAGEM =
    "${URL_BASE}addsolicitarprocedimento/";
const URL_ALTERAR_EQUIPAMENTO = "${URL_BASE}addsolicitarequipamento/";
const URL_ALTERAR_EXAME = "${URL_BASE}addsolicitarexame/";
const URL_ALTERAR_RETORNOEXAME = "${URL_BASE}addretornoexame/";
const URL_ALTERAR_INTERCORRENCIA = "${URL_BASE}addintercorrencia/";

const URL_RETORNAR_PLANO_TERAPEUTICO = "${URL_BASE}retornarplanoterapeutico/";

const URL_PDF_VISUALIZAR_PDF = "$IP_INTRANET/outras/visualizarpdf.php?b64=";
const URL_BUSCAR_ULTIMA_VISITA_REALIZADA =
    "${URL_BASE}buscarultimavisitarealizadaporadmissao/";

const URL_PDF_IMPRIMIR_FICHA_MEDICA =
    "$IP_INTRANET/intranet/mobileMedico/imprimirAcompanhamentoMedico2Via.php?adm=";
const URL_PDF_IMPRIMIR_FICHA_ENFERMAGEM =
    "$IP_INTRANET/intranet/mobileEnfa/imprimirFichaEnfermagem.php?adm=";
const URL_PDF_IMPRIMIR_FICHA_NUTRICAO =
    "$IP_INTRANET/intranet/mobileEspecialidade/imprimirAcompanhamentoNutricionista2Via.php?adm=";
const URL_PDF_IMPRIMIR_FICHA_TECNICOBASE =
    "$IP_INTRANET/intranet/agendamento_visitas/imprimirAcompanhamentoTecBase.php?adm=";
const URL_PDF_IMPRIMIR_FICHA_ESPECIALIDADE =
    "$IP_INTRANET/intranet/mobileEspecialidade/imprimirAcompanhamentoEspecialidade2Via.php";

const LBL_FICHAENF_DIAGNOSTICO_001 = "Risco para aspira????o";
const LBL_FICHAENF_DIAGNOSTICO_002 = "Nutri????o alterada";
const LBL_FICHAENF_DIAGNOSTICO_003 = "Mem??ria Prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_004 = "Incontin??ncia Urin??ria";
const LBL_FICHAENF_DIAGNOSTICO_005 = "Risco de Quedas";
const LBL_FICHAENF_DIAGNOSTICO_006 =
    "Risco para integridade da pele prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_007 = "Controle ineficaz do regime terap??utico";
const LBL_FICHAENF_DIAGNOSTICO_008 = "Degluti????o prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_009 = "Padr??o de sono perturbado";
const LBL_FICHAENF_DIAGNOSTICO_010 = "Intera????o social prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_011 = "Risco de constipa????o";
const LBL_FICHAENF_DIAGNOSTICO_012 = "Comunica????o verbal prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_013 = "Mobilidade f??sica prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_014 = "Elimina????o urin??ria prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_015 = "Risco para infec????o";

const LBL_FICHAENF_PROCEDIMENTO_001 =
    "Coloca????o e/ou troca de cateter vesical de demora";
const LBL_FICHAENF_PROCEDIMENTO_002 =
    "Coloca????o e/ou troca de cateter nasoenteral";
const LBL_FICHAENF_PROCEDIMENTO_003 =
    "Coloca????o e/ou troca de cateter nasog??strico";
const LBL_FICHAENF_PROCEDIMENTO_004 = "Troca de traque??stomo";
const LBL_FICHAENF_PROCEDIMENTO_005 = "Cateterismo vesical de al??vio";
const LBL_FICHAENF_PROCEDIMENTO_006 = "Troca de cistostomia";
const LBL_FICHAENF_PROCEDIMENTO_007 = "Troca de cateter de gastrostomia";
const LBL_FICHAENF_PROCEDIMENTO_008 = "Outros procedimentos";
const LBL_FICHAENF_PLANOCUIDADO_001 =
    "Elevar a cabeceira a 45 graus, no m??nimo, para administrar a dieta ou ofertar a alimenta????o por via oral.";
const LBL_FICHAENF_PLANOCUIDADO_002 =
    "Para a dieta enteral, se houver necessidade de aspira????o de vias a??reas durante a aspira????o.";
const LBL_FICHAENF_PLANOCUIDADO_003 =
    "Realizar higiene ??ntima, com troca de fraldas (se necess??rio), ap??s urinar ou evacuar.";
const LBL_FICHAENF_PLANOCUIDADO_004 =
    "Realizar mudan??as de dec??bito(de posi????o) a cada 02 e 03 horas.";
const LBL_FICHAENF_PLANOCUIDADO_005 =
    "Fazer uso de almofadas, travesseiros, rolos de apoiar e dar conforto ao paciente.";
const LBL_FICHAENF_PLANOCUIDADO_006 =
    "Fazer uso do AGE(??leo com ??cidos graxos essenciais) nos locais com maior predisposi????o para o desenvolvimento de ??lceras, como regi??o sacra, maleolar, trocant??rica e calc??nea.";
const LBL_FICHAENF_PLANOCUIDADO_007 =
    "Lavar cateter nasoenteral, nasog??strico ou de gastrostomia, SEMPRE, antes e ap??s admnistra????o de dieta ou medica????o";
const LBL_FICHAENF_PLANOCUIDADO_008 =
    "Antes de administrar medica????o em comprimidos por cateteres (nasoenteral ou nasog??strico), macerar, colocar de molho e administrar a medica????o.";

List<DropdownMenuItem<String>> get LISTA_FICHATERAPIA_PARTICIPACAO {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "ATIVO", child: Text("ATIVO")),
    const DropdownMenuItem(
        value: "ATIVO ASSISTIDO", child: Text("ATIVO ASSISTIDO")),
    const DropdownMenuItem(value: "PASSIVO", child: Text("PASSIVO")),
    const DropdownMenuItem(
        value: "N??O REALIZADO", child: Text("N??O REALIZADO")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_FICHATERAPIA_EXECUCAO {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "COMPLETA", child: Text("COMPLETA")),
    const DropdownMenuItem(value: "PARCIAL", child: Text("PARCIAL")),
    const DropdownMenuItem(value: "M??NIMA", child: Text("M??NIMA")),
    const DropdownMenuItem(
        value: "N??O REALIZADO", child: Text("N??O REALIZADO")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_FICHANUTRICAO_TIPONUTRICAO {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("ORAL")),
    const DropdownMenuItem(value: "2", child: Text("ENTERAL")),
    const DropdownMenuItem(value: "3", child: Text("AMBOS")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_FICHANUTRICAO_TIPONUTRICAO_ENTERAL {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("SNE")),
    const DropdownMenuItem(value: "2", child: Text("GASTROSTOMIA")),
    const DropdownMenuItem(value: "3", child: Text("OUTROS")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_FICHANUTRICAO_DIETAENTERAL {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("ARTESANAL")),
    const DropdownMenuItem(value: "2", child: Text("INDUSTRIALIZADO")),
    const DropdownMenuItem(value: "3", child: Text("AMBOS")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>>
    get LISTA_FICHANUTRICAO_DIETAENTERAL_INDUSTRIALIZADO {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("MANIPULADA EM DOMICILIO")),
    const DropdownMenuItem(value: "2", child: Text("PRONTA")),
    const DropdownMenuItem(value: "3", child: Text("AMBAS")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_FICHANUTRICAO_DIETAENTERAL_FORNECEDOR {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("BENEFICI??RIO")),
    const DropdownMenuItem(value: "2", child: Text("PLANO")),
    const DropdownMenuItem(value: "3", child: Text("AMBOS")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_FICHANUTRICAO_AVALSUBJETIVA_INGESTA {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("AUMENTADA")),
    const DropdownMenuItem(value: "2", child: Text("DIMINU??DA")),
    const DropdownMenuItem(value: "3", child: Text("NORMAL")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_FICHANUTRICAO_AVALSUBJETIVA_PESO {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("PERDA DE PESO")),
    const DropdownMenuItem(value: "2", child: Text("GANHO DE PESO")),
    const DropdownMenuItem(value: "3", child: Text("SEM ALTERA????ES")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>>
    get LISTA_FICHANUTRICAO_DIAGNUTRICIONAL_ABAIXO65ANOS {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("N??O ATRIBU??DO")),
    const DropdownMenuItem(value: "2", child: Text("BAIXO PESO")),
    const DropdownMenuItem(value: "3", child: Text("EUTROFIA")),
    const DropdownMenuItem(value: "4", child: Text("PR??-OBESIDADE")),
    const DropdownMenuItem(value: "5", child: Text("OBESIDADE 1")),
    const DropdownMenuItem(value: "6", child: Text("OBESIDADE 2")),
    const DropdownMenuItem(value: "7", child: Text("OBESIDADE 3")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>>
    get LISTA_FICHANUTRICAO_DIAGNUTRICIONAL_ACIMA65ANOS {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("N??O ATRIBU??DO")),
    const DropdownMenuItem(value: "2", child: Text("BAIXO PESO")),
    const DropdownMenuItem(value: "3", child: Text("EUTROFIA")),
    const DropdownMenuItem(value: "4", child: Text("OBESIDADE")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_FICHATECNICOBASE_TIPOCHAMADA {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("PROCEDIMENTO")),
    const DropdownMenuItem(value: "2", child: Text("ENTREGA")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_PRESCRICAOMEDICA_VIAS {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "...", child: Text("...")),
    const DropdownMenuItem(value: "VO", child: Text("VO")),
    const DropdownMenuItem(value: "IM", child: Text("IM")),
    const DropdownMenuItem(value: "SNE", child: Text("SNE")),
    const DropdownMenuItem(value: "EV", child: Text("EV")),
    const DropdownMenuItem(value: "SC", child: Text("SC")),
    const DropdownMenuItem(value: "Nasal", child: Text("NASAL")),
    const DropdownMenuItem(value: "VR", child: Text("VR")),
    const DropdownMenuItem(value: "Inalatorio", child: Text("INALAT??RIO")),
    const DropdownMenuItem(value: "Ocular", child: Text("OCULAR")),
    const DropdownMenuItem(value: "T??pico", child: Text("T??PICO")),
    const DropdownMenuItem(value: "GTT", child: Text("GTT")),
    const DropdownMenuItem(
        value: "SVD - Sist Aberto", child: Text("SVD - SIST. ABERTO")),
    const DropdownMenuItem(value: "PERIDURAL", child: Text("PERIDURAL")),
    const DropdownMenuItem(value: "EV em BIC", child: Text("EV EM BIC")),
    const DropdownMenuItem(value: "EV Em Bolus", child: Text("EV EM BOLUS")),
    const DropdownMenuItem(
        value: "SVD - Sist Fechado", child: Text("SVD - SIST. FECHADO")),
    const DropdownMenuItem(value: "T??pico Oral", child: Text("T??PICO ORAL")),
    const DropdownMenuItem(
        value: "EV p/ Hidrata????o", child: Text("EV P/ HIDRATA????O")),
    const DropdownMenuItem(value: "SNG", child: Text("SNG")),
    const DropdownMenuItem(value: "SL", child: Text("SL")),
    const DropdownMenuItem(value: "Otologico", child: Text("OTOL??GICO")),
    const DropdownMenuItem(
        value: "EV em Bolus II", child: Text("EV EM BOLUS II")),
    const DropdownMenuItem(value: "SOG", child: Text("SOG")),
    const DropdownMenuItem(
        value: "HIPODERMOCLISE", child: Text("HIPODERMOCLISE"))
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_PRESCRICAOMEDICA_TIPOENVIO {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("IMEDIATO")),
    const DropdownMenuItem(value: "2", child: Text("24 HORAS")),
    const DropdownMenuItem(value: "3", child: Text("SEMANAL"))
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_PROCEDIMENTOENFERMAGEM_PROCEDIMENTO {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(
        value: "TROCA DE TRAQUEOSTOMO", child: Text("TROCA DE TRAQUEOSTOMO")),
    const DropdownMenuItem(
        value: "TROCA DE CATETER DE GASTROSTOMIA",
        child: Text("TROCA DE CATETER DE GASTROSTOMIA")),
    const DropdownMenuItem(
        value: "PUN????O DE ACESSO CENTRAL",
        child: Text("PUN????O DE ACESSO CENTRAL")),
    const DropdownMenuItem(
        value: "DEBRIDAMENTO DA LES??O POR PRESS??O",
        child: Text("DEBRIDAMENTO DA LES??O POR PRESS??O")),
    const DropdownMenuItem(
        value: "AVALIA????O M??DICA EM UTI M??VEL",
        child: Text("AVALIA????O M??DICA EM UTI M??VEL")),
    const DropdownMenuItem(
        value: "EXAME FORA DO DOM??CILIO",
        child: Text("EXAME FORA DO DOM??CILIO")),
    const DropdownMenuItem(
        value: "INTERNAMENTO DOMICILIAR",
        child: Text("INTERNAMENTO DOMICILIAR")),
    const DropdownMenuItem(
        value: "RX DO T??RAX NO LEITO", child: Text("RX DO T??RAX NO LEITO")),
    const DropdownMenuItem(value: "OUTROS", child: Text("OUTROS"))
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_INTERCORRENCIA_TIPO {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("CL??NICA")),
    const DropdownMenuItem(value: "2", child: Text("RETORNO DE EXAME")),
    const DropdownMenuItem(value: "3", child: Text("ATENDIMENTO EMERG??NCIA")),
    const DropdownMenuItem(value: "4", child: Text("ALTERA????O DE PRESCRI????O"))
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_INTERCORRENCIA_GRAUURGENCIA {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("N??O URGENTE")),
    const DropdownMenuItem(value: "2", child: Text("URGENTE"))
  ];
  return menuItems;
}
