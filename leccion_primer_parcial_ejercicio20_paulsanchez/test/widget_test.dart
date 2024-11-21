import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:leccion_primer_parcial_ejercicio20_paulsanchez/main.dart';

void main() {
  testWidgets('Verificador de Número smoke test', (WidgetTester tester) async {
    // Construye nuestra app y dispara un frame.
    await tester.pumpWidget(const MiApp());

    // Verifica que el título de la AppBar es correcto.
    expect(find.text('Verificador de Número'), findsOneWidget);

    // Verifica que existe un botón para generar un nuevo número.
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Generar nuevo número'), findsOneWidget);

    // Verifica que se muestra un número aleatorio.
    expect(find.textContaining('Número generado:'), findsOneWidget);

    // Guarda el número generado inicialmente
    final String numeroInicial = (find.textContaining('Número generado:').evaluate().single.widget as Text).data!;

    // Toca el botón para generar un nuevo número y dispara un frame.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verifica que aún se muestra un número aleatorio después de tocar el botón.
    expect(find.textContaining('Número generado:'), findsOneWidget);

    // Verifica que el número ha cambiado (esto podría fallar en raras ocasiones si se genera el mismo número)
    final String numeroNuevo = (find.textContaining('Número generado:').evaluate().single.widget as Text).data!;
    expect(numeroInicial != numeroNuevo, true);
  });
}

