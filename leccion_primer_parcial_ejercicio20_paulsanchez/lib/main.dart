import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page/pagina_verificador_numero.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Verificador de Número',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: const PaginaVerificadorNumero(),
    );
  }
}

