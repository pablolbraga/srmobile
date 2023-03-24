import 'package:flutter/material.dart';
import 'package:srmobile/views/agenda.dart';
import 'package:srmobile/views/alterarsenha.dart';
import 'package:srmobile/views/assinaturapaciente.dart';
import 'package:srmobile/views/assinaturaprofissional.dart';
import 'package:srmobile/views/equipamentocad.dart';
import 'package:srmobile/views/equipamentopesq.dart';
import 'package:srmobile/views/esqueceusenha.dart';
import 'package:srmobile/views/examecad.dart';
import 'package:srmobile/views/examepesq.dart';
import 'package:srmobile/views/fichaenfermagem.dart';
import 'package:srmobile/views/fichamedica.dart';
import 'package:srmobile/views/fichanutricao.dart';
import 'package:srmobile/views/fichatecnicobase.dart';
import 'package:srmobile/views/fichaterapia.dart';
import 'package:srmobile/views/intercorrencia.dart';
import 'package:srmobile/views/login.dart';
import 'package:srmobile/views/opcao.dart';
import 'package:srmobile/views/pacientesopcao.dart';
import 'package:srmobile/views/pacientes.dart';
import 'package:srmobile/views/prescricaoenfermagemcad.dart';
import 'package:srmobile/views/prescricaoenfermagempesq.dart';
import 'package:srmobile/views/prescricaomedicacad.dart';
import 'package:srmobile/views/prescricaomedicapesq.dart';
import 'package:srmobile/views/procedimentoenfermagemcad.dart';
import 'package:srmobile/views/procedimentoenfermagempesq.dart';
import 'package:srmobile/views/retornoexame.dart';
import 'package:srmobile/views/visitasrealizadas.dart';
import 'package:srmobile/views/visitasrealizadasfiltro.dart';
import 'package:srmobile/views/visualizarpdf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saúde Residence - Mobile',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const Login(),
        "esqueceusenha": (context) => const EsqueceuSenha(),
        "alterarsenha": (context) => const AlterarSenha(),
        "opcao": (context) => const Opcao(),
        "agenda": (context) => const Agenda(),
        "fichaterapia": (context) => const FichaTerapia(),
        "fichamedica": (context) => const FichaMedica(),
        "fichaenfermagem": (context) => const FichaEnfermagem(),
        "fichanutricao": (context) => const FichaNutricao(),
        "fichatecnicobase": (context) => const FichaTecnicoBase(),
        "assinatura_paciente": (context) => const AssinaturaPaciente(),
        "assinatura_profissional": (context) => const AssinaturaProfissional(),
        "visitasrealizadasfiltro": (context) => const VisitasRealizadasFiltro(),
        "visitasrealizadas": (context) => const VisitasRealizadas(),
        "visualizarpdf": (context) => const VisualizarPdf(),
        "pacientes": (context) => const Pacientes(),
        "pacienteopcao": (context) => const PacienteOpcao(),
        "prescricaomedicapesq": (context) => const PrescricaoMedicaPesq(),
        "prescricaomedicacad": (context) => const PrescricaoMedicaCad(),
        "prescricaoenfermagempesq": (context) =>
            const PrescricaoEnfermagemPesq(),
        "prescricaoenfermagemcad": (context) => const PrescricaoEnfermagemCad(),
        "procedimentoenfermagempesq": (context) =>
            const ProcedimentoEnfermagemPesq(),
        "procedimentoenfermagemcad": (context) =>
            const ProcedimentoEnfermagemCad(),
        "equipamentopesq": (context) => const EquipamentoPesq(),
        "equipamentocad": (context) => const EquipamentoCad(),
        "examepesq": (context) => const ExamePesq(),
        "examecad": (context) => const ExameCad(),
        "retornoexame": (context) => const RetornoExame(),
        "intercorrencia": (context) => const Intercorrencia()
      },
    );
  }
}
