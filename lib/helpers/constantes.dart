// ignore_for_file: constant_identifier_names

const URL_BASE =
    "http://profissionaisexternos.sauderesidence.tk/SaudeResidenceHomeCareServices/srhcws/";

const URL_ESQUECEU_SENHA = "${URL_BASE}esqueceusenha/";
const URL_VALIDAR_LOGIN_SENHA = "${URL_BASE}validarloginsenha/";
const URL_ALTERAR_SENHA = "${URL_BASE}alterarsenha/";
const URL_LISTAR_AGENDA = "${URL_BASE}listaragendaporprofissional/";
const URL_ADICIONAR_FICHA_TERAPIA = "${URL_BASE}addfichaterapia/";
const URL_ADICIONAR_FICHA_MEDICA = "${URL_BASE}addfichamedica/";

const URL_RETORNAR_PLANO_TERAPEUTICO = "${URL_BASE}retornarplanoterapeutico/";

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
