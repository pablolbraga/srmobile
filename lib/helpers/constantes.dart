// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const URL_BASE =
    "http://profissionaisexternos.sauderesidence.tk/SaudeResidenceHomeCareServices/srhcws/";
//const URL_BASE =
//    "http://192.168.0.118:8080/SaudeResidenceHomeCareServices/srhcws/";
const IP_INTRANET = "http://200.150.138.34:8001/sauderesidence";

//urls--------------------------------------------------------------------------
const URL_VALIDAR_LOGIN_SENHA = "${URL_BASE}validarloginsenha/";
const URL_ESQUECEU_SENHA = "${URL_BASE}esqueceusenha/";
const URL_ALTERAR_SENHA = "${URL_BASE}alterarsenha/";
const URL_LISTAR_AGENDA = "${URL_BASE}listaragendaporprofissional/";
const URL_ADICIONAR_FICHA_TERAPIA = "${URL_BASE}addfichaterapia";
const URL_ADICIONAR_FICHA_MEDICA = "${URL_BASE}addfichamedica";
const URL_ADICIONAR_FICHA_ENFERMAGEM = "${URL_BASE}addfichaenfermagem";
const URL_ADICIONAR_FICHA_NUTRICAO = "${URL_BASE}addfichanutricao";
const URL_ADICIONAR_FICHA_TECNICOBASE = "${URL_BASE}addfichatecnicobase";
const URL_RETORNAR_PLANO_TERAPEUTICO = "${URL_BASE}retornarplanoterapeutico/";
const URL_LISTAR_PACIENTES = "${URL_BASE}listarpacientesgeral";
const URL_BUSCAR_ULTIMA_VISITA_REALIZADA = "${URL_BASE}buscarultimavisitarealizadaporadmissao/";
const URL_PDF_IMPRIMIR_FICHA_MEDICA = "$IP_INTRANET/intranet/mobileMedico/imprimirAcompanhamentoMedico2Via.php?adm=";
const URL_PDF_VISUALIZAR_PDF = "$IP_INTRANET/outras/visualizarpdf.php?b64=";
const URL_PDF_IMPRIMIR_FICHA_ENFERMAGEM = "$IP_INTRANET/intranet/mobileEnfa/imprimirFichaEnfermagem.php?adm=";
const URL_PDF_IMPRIMIR_FICHA_NUTRICAO = "$IP_INTRANET/intranet/mobileEspecialidade/imprimirAcompanhamentoNutricionista2Via.php?adm=";
const URL_PDF_IMPRIMIR_FICHA_TECNICOBASE = "$IP_INTRANET/intranet/agendamento_visitas/imprimirAcompanhamentoTecBase.php?adm=";
const URL_PDF_IMPRIMIR_FICHA_ESPECIALIDADE = "$IP_INTRANET/intranet/mobileEspecialidade/imprimirAcompanhamentoEspecialidade2Via.php";
const URL_LISTAR_PRESCRICAO_MEDICA = "${URL_BASE}listarprescricaomedica/";
const URL_ALTERAR_PRESCRICAO_MEDICA = "${URL_BASE}addprescricaomedica/";
const URL_LISTAR_PRESCRICAO_ENFERMAGEM = "${URL_BASE}listarprescricaoenfermagem/";
const URL_ALTERAR_PRESCRICAO_ENFERMAGEM = "${URL_BASE}addsolicitarmaterial/";
const URL_LISTAR_PROCEDIMENTO_ENFERMAGEM = "${URL_BASE}listarprocedimentoenfermagem/";
const URL_ALTERAR_PROCEDIMENTO_ENFERMAGEM = "${URL_BASE}addsolicitarprocedimento/";
const URL_LISTAR_EQUIPAMENTO = "${URL_BASE}listarequipamentos/";
const URL_ALTERAR_EQUIPAMENTO = "${URL_BASE}addsolicitarequipamento/";
const URL_LISTAR_EXAME = "${URL_BASE}listarexamesporadmissao/";
const URL_ALTERAR_EXAME = "${URL_BASE}addsolicitarexame/";
const URL_ALTERAR_RETORNOEXAME = "${URL_BASE}addretornoexame/";
const URL_ALTERAR_INTERCORRENCIA = "${URL_BASE}addintercorrencia/";

//Listas------------------------------------------------------------------------
List<DropdownMenuItem<String>> get LISTA_FICHATERAPIA_PARTICIPACAO {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "ATIVO", child: Text("ATIVO")),
    const DropdownMenuItem(
        value: "ATIVO ASSISTIDO", child: Text("ATIVO ASSISTIDO")),
    const DropdownMenuItem(value: "PASSIVO", child: Text("PASSIVO")),
    const DropdownMenuItem(
        value: "NÃO REALIZADO", child: Text("NÃO REALIZADO")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_FICHATERAPIA_EXECUCAO {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "COMPLETA", child: Text("COMPLETA")),
    const DropdownMenuItem(value: "PARCIAL", child: Text("PARCIAL")),
    const DropdownMenuItem(value: "MÍNIMA", child: Text("MÍNIMA")),
    const DropdownMenuItem(
        value: "NÃO REALIZADO", child: Text("NÃO REALIZADO")),
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
    const DropdownMenuItem(value: "1", child: Text("BENEFICIÁRIO")),
    const DropdownMenuItem(value: "2", child: Text("PLANO")),
    const DropdownMenuItem(value: "3", child: Text("AMBOS")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_FICHANUTRICAO_AVALSUBJETIVA_INGESTA {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("AUMENTADA")),
    const DropdownMenuItem(value: "2", child: Text("DIMINUÍDA")),
    const DropdownMenuItem(value: "3", child: Text("NORMAL")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_FICHANUTRICAO_AVALSUBJETIVA_PESO {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("PERDA DE PESO")),
    const DropdownMenuItem(value: "2", child: Text("GANHO DE PESO")),
    const DropdownMenuItem(value: "3", child: Text("SEM ALTERAÇÕES")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>>
get LISTA_FICHANUTRICAO_DIAGNUTRICIONAL_ABAIXO65ANOS {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("NÃO ATRIBUÍDO")),
    const DropdownMenuItem(value: "2", child: Text("BAIXO PESO")),
    const DropdownMenuItem(value: "3", child: Text("EUTROFIA")),
    const DropdownMenuItem(value: "4", child: Text("PRÉ-OBESIDADE")),
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
    const DropdownMenuItem(value: "1", child: Text("NÃO ATRIBUÍDO")),
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
    const DropdownMenuItem(value: "Inalatorio", child: Text("INALATÓRIO")),
    const DropdownMenuItem(value: "Ocular", child: Text("OCULAR")),
    const DropdownMenuItem(value: "Tópico", child: Text("TÓPICO")),
    const DropdownMenuItem(value: "GTT", child: Text("GTT")),
    const DropdownMenuItem(
        value: "SVD - Sist Aberto", child: Text("SVD - SIST. ABERTO")),
    const DropdownMenuItem(value: "PERIDURAL", child: Text("PERIDURAL")),
    const DropdownMenuItem(value: "EV em BIC", child: Text("EV EM BIC")),
    const DropdownMenuItem(value: "EV Em Bolus", child: Text("EV EM BOLUS")),
    const DropdownMenuItem(
        value: "SVD - Sist Fechado", child: Text("SVD - SIST. FECHADO")),
    const DropdownMenuItem(value: "Tópico Oral", child: Text("TÓPICO ORAL")),
    const DropdownMenuItem(
        value: "EV p/ Hidratação", child: Text("EV P/ HIDRATAÇÃO")),
    const DropdownMenuItem(value: "SNG", child: Text("SNG")),
    const DropdownMenuItem(value: "SL", child: Text("SL")),
    const DropdownMenuItem(value: "Otologico", child: Text("OTOLÓGICO")),
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
        value: "PUNÇÃO DE ACESSO CENTRAL",
        child: Text("PUNÇÃO DE ACESSO CENTRAL")),
    const DropdownMenuItem(
        value: "DEBRIDAMENTO DA LESÃO POR PRESSÃO",
        child: Text("DEBRIDAMENTO DA LESÃO POR PRESSÃO")),
    const DropdownMenuItem(
        value: "AVALIAÇÃO MÉDICA EM UTI MÓVEL",
        child: Text("AVALIAÇÃO MÉDICA EM UTI MÓVEL")),
    const DropdownMenuItem(
        value: "EXAME FORA DO DOMÍCILIO",
        child: Text("EXAME FORA DO DOMÍCILIO")),
    const DropdownMenuItem(
        value: "INTERNAMENTO DOMICILIAR",
        child: Text("INTERNAMENTO DOMICILIAR")),
    const DropdownMenuItem(
        value: "RX DO TÓRAX NO LEITO", child: Text("RX DO TÓRAX NO LEITO")),
    const DropdownMenuItem(value: "OUTROS", child: Text("OUTROS"))
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_INTERCORRENCIA_TIPO {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("CLÍNICA")),
    const DropdownMenuItem(value: "2", child: Text("RETORNO DE EXAME")),
    const DropdownMenuItem(value: "3", child: Text("ATENDIMENTO EMERGÊNCIA")),
    const DropdownMenuItem(value: "4", child: Text("ALTERAÇÃO DE PRESCRIÇÃO"))
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get LISTA_INTERCORRENCIA_GRAUURGENCIA {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "", child: Text("SELECIONE")),
    const DropdownMenuItem(value: "1", child: Text("NÃO URGENTE")),
    const DropdownMenuItem(value: "2", child: Text("URGENTE"))
  ];
  return menuItems;
}

// Strings ---------------------------------------------------------------------
const LBL_FICHAENF_DIAGNOSTICO_001 = "Risco para aspiração";
const LBL_FICHAENF_DIAGNOSTICO_002 = "Nutrição alterada";
const LBL_FICHAENF_DIAGNOSTICO_003 = "Memória Prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_004 = "Incontinência Urinária";
const LBL_FICHAENF_DIAGNOSTICO_005 = "Risco de Quedas";
const LBL_FICHAENF_DIAGNOSTICO_006 = "Risco para integridade da pele prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_007 = "Controle ineficaz do regime terapêutico";
const LBL_FICHAENF_DIAGNOSTICO_008 = "Deglutição prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_009 = "Padrão de sono perturbado";
const LBL_FICHAENF_DIAGNOSTICO_010 = "Interação social prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_011 = "Risco de constipação";
const LBL_FICHAENF_DIAGNOSTICO_012 = "Comunicação verbal prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_013 = "Mobilidade física prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_014 = "Eliminação urinária prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_015 = "Risco para infecção";

const LBL_FICHAENF_PROCEDIMENTO_001 = "Colocação e/ou troca de cateter vesical de demora";
const LBL_FICHAENF_PROCEDIMENTO_002 = "Colocação e/ou troca de cateter nasoenteral";
const LBL_FICHAENF_PROCEDIMENTO_003 = "Colocação e/ou troca de cateter nasogástrico";
const LBL_FICHAENF_PROCEDIMENTO_004 = "Troca de traqueóstomo";
const LBL_FICHAENF_PROCEDIMENTO_005 = "Cateterismo vesical de alívio";
const LBL_FICHAENF_PROCEDIMENTO_006 = "Troca de cistostomia";
const LBL_FICHAENF_PROCEDIMENTO_007 = "Troca de cateter de gastrostomia";
const LBL_FICHAENF_PROCEDIMENTO_008 = "Outros procedimentos";

const LBL_FICHAENF_PLANOCUIDADO_001 = "Elevar a cabeceira a 45 graus, no mínimo, para administrar a dieta ou ofertar a alimentação por via oral.";
const LBL_FICHAENF_PLANOCUIDADO_002 = "Para a dieta enteral, se houver necessidade de aspiração de vias aéreas durante a aspiração.";
const LBL_FICHAENF_PLANOCUIDADO_003 = "Realizar higiene íntima, com troca de fraldas (se necessário), após urinar ou evacuar.";
const LBL_FICHAENF_PLANOCUIDADO_004 = "Realizar mudanças de decúbito(de posição) a cada 02 e 03 horas.";
const LBL_FICHAENF_PLANOCUIDADO_005 = "Fazer uso de almofadas, travesseiros, rolos de apoiar e dar conforto ao paciente.";
const LBL_FICHAENF_PLANOCUIDADO_006 = "Fazer uso do AGE(óleo com ácidos graxos essenciais) nos locais com maior predisposição para o desenvolvimento de úlceras, como região sacra, maleolar, trocantórica e calcânea.";
const LBL_FICHAENF_PLANOCUIDADO_007 = "Lavar cateter nasoenteral, nasogástrico ou de gastrostomia, SEMPRE, antes e após admnistração de dieta ou medicação";
const LBL_FICHAENF_PLANOCUIDADO_008 = "Antes de administrar medicação em comprimidos por cateteres (nasoenteral ou nasogástrico), macerar, colocar de molho e administrar a medicação.";

