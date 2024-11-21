import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MostrarNumero extends StatelessWidget {
  final int numeroAleatorio;
  final bool esMultiploDeCinco;
  final bool estaEnRango;
  final bool esCorrecto;

  const MostrarNumero({
    Key? key,
    required this.numeroAleatorio,
    required this.esMultiploDeCinco,
    required this.estaEnRango,
    required this.esCorrecto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Número generado:',
                  textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  speed: Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 1,
            ),
            SizedBox(height: 10),
            Text(
              '$numeroAleatorio',
              style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Colors.blue),
            ).animate().fadeIn(duration: 600.ms).scale(),
            SizedBox(height: 20),
            _buildInfoRow('Múltiplo de 5:', esMultiploDeCinco),
            _buildInfoRow('Entre 1 y 25:', estaEnRango),
            SizedBox(height: 20),
            if (esCorrecto)
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'Correcto',
                  style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ).animate().slideIn(duration: 500.ms).then().shake(),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 300.ms).scale();
  }

  Widget _buildInfoRow(String label, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 18)),
          Icon(
            value ? Icons.check_circle : Icons.cancel,
            color: value ? Colors.green : Colors.red,
            size: 28,
          ).animate().scale(duration: 300.ms),
        ],
      ),
    );
  }
}

