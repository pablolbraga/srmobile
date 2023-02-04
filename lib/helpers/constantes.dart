// ignore_for_file: constant_identifier_names

const URL_BASE =
    "http://profissionaisexternos.sauderesidence.tk/SaudeResidenceHomeCareServices/srhcws/";

const URL_ESQUECEU_SENHA = "${URL_BASE}esqueceusenha/";
const URL_VALIDAR_LOGIN_SENHA = "${URL_BASE}validarloginsenha/";
const URL_ALTERAR_SENHA = "${URL_BASE}alterarsenha/";
const URL_LISTAR_AGENDA = "${URL_BASE}listaragendaporprofissional/";
const URL_ADICIONAR_FICHA_TERAPIA = "${URL_BASE}addfichaterapia/";
const URL_ADICIONAR_FICHA_MEDICA = "${URL_BASE}addfichamedica/";
const URL_ADICIONAR_FICHA_ENFERMAGEM = "${URL_BASE}addfichaenfermagem/";

const URL_RETORNAR_PLANO_TERAPEUTICO = "${URL_BASE}retornarplanoterapeutico/";

const LBL_FICHAENF_DIAGNOSTICO_001 = "Risco para aspiração";
const LBL_FICHAENF_DIAGNOSTICO_002 = "Nutrição alterada";
const LBL_FICHAENF_DIAGNOSTICO_003 = "Memória Prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_004 = "Incontinência Urinária";
const LBL_FICHAENF_DIAGNOSTICO_005 = "Risco de Quedas";
const LBL_FICHAENF_DIAGNOSTICO_006 =
    "Risco para integridade da pele prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_007 = "Controle ineficaz do regime terapêutico";
const LBL_FICHAENF_DIAGNOSTICO_008 = "Deglutição prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_009 = "Padrão de sono perturbado";
const LBL_FICHAENF_DIAGNOSTICO_010 = "Interação social prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_011 = "Risco de constipação";
const LBL_FICHAENF_DIAGNOSTICO_012 = "Comunicação verbal prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_013 = "Mobilidade física prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_014 = "Eliminação urinária prejudicada";
const LBL_FICHAENF_DIAGNOSTICO_015 = "Risco para infecção";

const LBL_FICHAENF_PROCEDIMENTO_001 =
    "Colocação e/ou troca de cateter vesical de demora";
const LBL_FICHAENF_PROCEDIMENTO_002 =
    "Colocação e/ou troca de cateter nasoenteral";
const LBL_FICHAENF_PROCEDIMENTO_003 =
    "Colocação e/ou troca de cateter nasogástrico";
const LBL_FICHAENF_PROCEDIMENTO_004 = "Troca de traqueóstomo";
const LBL_FICHAENF_PROCEDIMENTO_005 = "Cateterismo vesical de alívio";
const LBL_FICHAENF_PROCEDIMENTO_006 = "Troca de cistostomia";
const LBL_FICHAENF_PROCEDIMENTO_007 = "Troca de cateter de gastrostomia";
const LBL_FICHAENF_PROCEDIMENTO_008 = "Outros procedimentos";
const LBL_FICHAENF_PLANOCUIDADO_001 =
    "Elevar a cabeceira a 45 graus, no mínimo, para administrar a dieta ou ofertar a alimentação por via oral.";
const LBL_FICHAENF_PLANOCUIDADO_002 =
    "Para a dieta enteral, se houver necessidade de aspiração de vias aéreas durante a aspiração.";
const LBL_FICHAENF_PLANOCUIDADO_003 =
    "Realizar higiene íntima, com troca de fraldas (se necessário), após urinar ou evacuar.";
const LBL_FICHAENF_PLANOCUIDADO_004 =
    "Realizar mudanças de decúbito(de posição) a cada 02 e 03 horas.";
const LBL_FICHAENF_PLANOCUIDADO_005 =
    "Fazer uso de almofadas, travesseiros, rolos de apoiar e dar conforto ao paciente.";
const LBL_FICHAENF_PLANOCUIDADO_006 =
    "Fazer uso do AGE(óleo com ácidos graxos essenciais) nos locais com maior predisposição para o desenvolvimento de úlceras, como região sacra, maleolar, trocantórica e calcânea.";
const LBL_FICHAENF_PLANOCUIDADO_007 =
    "Lavar cateter nasoenteral, nasogástrico ou de gastrostomia, SEMPRE, antes e após admnistração de dieta ou medicação";
const LBL_FICHAENF_PLANOCUIDADO_008 =
    "Antes de administrar medicação em comprimidos por cateteres (nasoenteral ou nasogástrico), macerar, colocar de molho e administrar a medicação.";

const List<String> LISTA_FICHATERAPIA_PARTICIPACAO = [
  'SELECIONE',
  'ATIVO',
  'ATIVO ASSISTIDO',
  'PASSIVO',
  'NÃO REALIZADO'
];

const List<String> LISTA_FICHATERAPIA_EXECUCAO = [
  'SELECIONE',
  'COMPLETA',
  'PARCIAL',
  'MÍNIMA',
  'NÃO REALIZADO'
];
