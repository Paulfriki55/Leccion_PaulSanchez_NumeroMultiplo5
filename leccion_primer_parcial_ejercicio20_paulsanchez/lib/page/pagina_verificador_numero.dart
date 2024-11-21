import 'package:flutter/material.dart';
import 'dart:math';
import '../ui/mostrar_numero.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PaginaVerificadorNumero extends StatefulWidget {
  const PaginaVerificadorNumero({Key? key}) : super(key: key);

  @override
  _EstadoPaginaVerificadorNumero createState() => _EstadoPaginaVerificadorNumero();
}

class _EstadoPaginaVerificadorNumero extends State<PaginaVerificadorNumero> {
  late int numeroAleatorio;
  late bool esMultiploDeCinco;
  late bool estaEnRango;
  late bool esCorrecto;

  @override
  void initState() {
    super.initState();
    _generarNumero();
  }

  void _generarNumero() {
    setState(() {
      final random = Random();
      numeroAleatorio = random.nextInt(1000) + 1;
      esMultiploDeCinco = numeroAleatorio % 5 == 0;
      estaEnRango = numeroAleatorio <= 25;
      esCorrecto = esMultiploDeCinco && estaEnRango;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verificador de Número'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade100, Colors.blue.shade300],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo_universidad.png',
                    height: 120,
                    semanticLabel: 'Logo de la Universidad',
                  ).animate().fadeIn(duration: 500.ms).scale(),
                  SizedBox(height: 30),
                  MostrarNumero(
                    numeroAleatorio: numeroAleatorio,
                    esMultiploDeCinco: esMultiploDeCinco,
                    estaEnRango: estaEnRango,
                    esCorrecto: esCorrecto,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: _generarNumero,
                    icon: Icon(Icons.refresh),
                    label: Text('Generar nuevo número'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      textStyle: TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ).animate(onPlay: (controller) => controller.repeat())
                      .shimmer(duration: 1000.ms, color: Colors.white.withOpacity(0.5))
                      .animate() // This creates a new animation group
                      .fadeIn() // Fade in when the widget first appears
                      .scale(), // Scale up slightly
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

