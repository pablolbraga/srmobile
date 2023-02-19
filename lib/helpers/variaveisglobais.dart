import 'package:srmobile/models/agendamodel.dart';
import 'package:srmobile/models/fichaenfermagemmodel.dart';
import 'package:srmobile/models/fichamedicamodel.dart';
import 'package:srmobile/models/fichanutricaomodel.dart';
import 'package:srmobile/models/fichatecnicobasemodel.dart';
import 'package:srmobile/models/fichaterapiamodel.dart';
import 'package:srmobile/models/pacientemodel.dart';
import 'package:srmobile/models/prescricaomedicamodel.dart';
import 'package:srmobile/models/prescricaoenfermagemmodel.dart';
import 'package:srmobile/models/usuariomodel.dart';

class VariaveisGlobais {
  static UsuarioModel? dadosUsuario;
  static AgendaModel? dadosAgenda;
  static String? dataInicioAtendimento;
  static FichaTerapiaModel? dadosFichaTerapia;
  static String? assinaturaPaciente;
  static String? assinaturaProfissional;
  static FichaMedicaModel? dadosFichaMedica;
  static FichaEnfermagemModel? dadosFichaEnfermagem;
  static FichaNutricaoModel? dadosFichaNutricao;
  static FichaTecnicoBaseModel? dadosFichaTecnicoBase;
  static PacienteModel? dadosPaciente;
  static PrescricaoMedicaModel? dadosPrescricaoMedica;
  static PrescricaoEnfermagemModel? dadosPrescricaoEnfermagem;

  static String? dataIniVisitaRealizada;
  static String? dataFimVisitaRealizada;
  static String? pathPdf;
  static int? tipoRedirecionamento;
}
