import 'package:srmobile/models/agendamodel.dart';
import 'package:srmobile/models/equipamentomodel.dart';
import 'package:srmobile/models/examemodel.dart';
import 'package:srmobile/models/fichaenfermagemmodel.dart';
import 'package:srmobile/models/fichamedicamodel.dart';
import 'package:srmobile/models/fichanutricaomodel.dart';
import 'package:srmobile/models/fichatecnicobasemodel.dart';
import 'package:srmobile/models/fichaterapiamodel.dart';
import 'package:srmobile/models/pacientemodel.dart';
import 'package:srmobile/models/prescricaoenfermagemmodel.dart';
import 'package:srmobile/models/prescricaomedicamodel.dart';
import 'package:srmobile/models/procedimentoenfermagemmodel.dart';
import 'package:srmobile/models/usuariomodel.dart';

class VariaveisGlobais {
  static UsuarioModel? dadosUsuario;
  static AgendaModel? dadosAgenda;
  static String? dataInicioAtendimento;
  static FichaTerapiaModel? dadosFichaTerapia;
  static FichaMedicaModel? dadosFichaMedica;
  static FichaEnfermagemModel? dadosFichaEnfermagem;
  static FichaNutricaoModel? dadosFichaNutricao;
  static FichaTecnicoBaseModel? dadosFichaTecnicoBase;
  static String? assinaturaPaciente;
  static String? assinaturaProfissional;
  static PacienteModel? dadosPaciente;
  static String? pathPdf;
  static int? tipoRedirecionamento;
  static String? dataIniVisitaRealizada;
  static String? dataFimVisitaRealizada;
  static PrescricaoMedicaModel? dadosPrescricaoMedica;
  static PrescricaoEnfermagemModel? dadosPrescricaoEnfermagem;
  static ProcedimentoEnfermagemModel? dadosProcedimentoEnfermagem;
  static EquipamentoModel? dadosEquipamento;
  static ExameModel? dadosExame;
}
