import 'package:flutter/material.dart';
import 'package:srmobile/views/agenda.dart';
import 'package:srmobile/views/alterarsenha.dart';
import 'package:srmobile/views/assinaturapaciente.dart';
import 'package:srmobile/views/assinaturaprofissional.dart';
import 'package:srmobile/views/esqueceusenha.dart';
import 'package:srmobile/views/fichaterapia.dart';
import 'package:srmobile/views/login.dart';
import 'package:srmobile/views/opcao.dart';

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
        "assinatura_paciente": (context) => const AssinaturaPaciente(),
        "assinatura_profissional": (context) => const AssinaturaProfissional()
      },
    );
  }
}
