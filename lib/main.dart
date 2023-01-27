import 'package:flutter/material.dart';
import 'package:srmobile/views/alterarsenha.dart';
import 'package:srmobile/views/esqueceusenha.dart';
import 'package:srmobile/views/login.dart';

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
        "alterarsenha": (context) => const AlterarSenha()
      },
    );
  }
}
