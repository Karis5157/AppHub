import 'package:flutter/material.dart';
import 'dart:math';
import '../../navigation/app_drawer.dart';

// Pantalla de juego: "Par o Impar"
class EvenOddGameScreen extends StatefulWidget {
  const EvenOddGameScreen({super.key});

  @override
  State<EvenOddGameScreen> createState() => _EvenOddGameScreenState();
}

class _EvenOddGameScreenState extends State<EvenOddGameScreen> {
  // Variables de estado
  int usuarioPuntos = 0;
  int cpuPuntos = 0;
  String resultado = 'Elige par o impar y un número';
  String? eleccionUsuario;
  int? numeroUsuario;
  Random random = Random(); // para generar números aleatorios (CPU)

  // Lógica principal del juego
  void jugar(bool usuarioEligePar, int numeroElegido) {
    int numeroCPU = random.nextInt(6); // CPU elige un número entre 0 y 5
    int suma = numeroElegido + numeroCPU;
    bool esPar = suma % 2 == 0;

    setState(() {
      eleccionUsuario = usuarioEligePar ? 'Par' : 'Impar';
      numeroUsuario = numeroElegido;

      // Validar quién gana
      if (esPar == usuarioEligePar) {
        usuarioPuntos++;
        resultado = '¡Ganaste! $numeroElegido + $numeroCPU = $suma (${esPar ? 'PAR' : 'IMPAR'})';
      } else {
        cpuPuntos++;
        resultado = 'Perdiste. $numeroElegido + $numeroCPU = $suma (${esPar ? 'PAR' : 'IMPAR'})';
      }
    });

    // Mostrar notificación flotante
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(resultado),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Reinicia los puntajes y estado
  void reiniciar() {
    setState(() {
      usuarioPuntos = 0;
      cpuPuntos = 0;
      resultado = 'Elige par o impar y un número';
      eleccionUsuario = null;
      numeroUsuario = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Par o Impar'),
        automaticallyImplyLeading: true, // botón menú hamburguesa
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: reiniciar,
            tooltip: 'Reiniciar juego',
          ),
        ],
      ),
      drawer: const AppDrawer(), // Menú lateral
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Marcador de puntos
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text('TÚ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('$usuarioPuntos', style: const TextStyle(fontSize: 40)),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('CPU', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('$cpuPuntos', style: const TextStyle(fontSize: 40)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Mostrar última elección del usuario
            if (eleccionUsuario != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Elegiste: $eleccionUsuario - Número: $numeroUsuario'),
                ),
              ),

            const SizedBox(height: 20),

            // Mostrar resultado de la jugada
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  resultado,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Botones de selección (PAR o IMPAR)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _mostrarSelectorNumeros(true),
                  icon: const Icon(Icons.check),
                  label: const Text('Elegir PAR'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _mostrarSelectorNumeros(false),
                  icon: const Icon(Icons.close),
                  label: const Text('Elegir IMPAR'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Botón para reiniciar el marcador
            OutlinedButton(
              onPressed: reiniciar,
              child: const Text('Reiniciar Marcador'),
            ),
          ],
        ),
      ),
    );
  }

  // Diálogo para elegir número del 0 al 5
  void _mostrarSelectorNumeros(bool esPar) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Elige un número (0-5) para ${esPar ? 'PAR' : 'IMPAR'}'),
        content: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(6, (numero) {
            return ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // cerrar diálogo
                jugar(esPar, numero); // iniciar jugada
              },
              child: Text('$numero'),
            );
          }),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }
}
