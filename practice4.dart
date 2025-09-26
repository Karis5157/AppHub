import 'package:flutter/material.dart';
import '../main.dart';
import '../navigation/app_drawer.dart'; // Menú lateral

class Practice4 extends StatefulWidget {
  const Practice4({super.key});

  @override
  State<Practice4> createState() => _Practice4State();
}

class _Practice4State extends State<Practice4> {
  // ====== VARIABLES DEL JUEGO ======
  String userChoice = '';   // Elección del usuario
  String appChoice = '';    // Elección de la app
  String result = '';       // Resultado del turno
  int userScore = 0;        // Puntuación usuario
  int appScore = 0;         // Puntuación app

  // Opciones posibles
  final List<String> options = ['Piedra', 'Papel', 'Tijera'];

  // ====== LÓGICA PRINCIPAL DEL JUEGO ======
  void playGame(String userSelection) {
    // Selección aleatoria de la app (dependiendo del milisegundo actual)
    final randomIndex = DateTime.now().millisecond % options.length;
    final appSelection = options[randomIndex];

    // Determinar ganador
    String gameResult;
    if (userSelection == appSelection) {
      gameResult = 'Empate';
    } else if ((userSelection == 'Piedra' && appSelection == 'Tijera') ||
        (userSelection == 'Papel' && appSelection == 'Piedra') ||
        (userSelection == 'Tijera' && appSelection == 'Papel')) {
      gameResult = '¡Ganaste!';
      userScore++;
    } else {
      gameResult = 'Perdiste';
      appScore++;
    }

    // Actualizar el estado
    setState(() {
      userChoice = userSelection;
      appChoice = appSelection;
      result = gameResult;
    });
  }

  // Reiniciar marcador y elecciones
  void resetScores() {
    setState(() {
      userScore = 0;
      appScore = 0;
      userChoice = '';
      appChoice = '';
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior con botón de reinicio
      appBar: AppBar(
        title: const Text('Piedra, Papel o Tijera'),
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: resetScores,
            tooltip: 'Reiniciar marcador',
          ),
        ],
      ),
      drawer: const AppDrawer(),

      // ====== CUERPO ======
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ====== MARCADOR ======
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      'TÚ',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$userScore',
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'APP',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$appScore',
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),

            // ====== RESULTADOS ======
            if (userChoice.isNotEmpty) ...[
              Text(
                'Elegiste: $userChoice',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'La app eligió: $appChoice',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                result,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: result == '¡Ganaste!'
                      ? Colors.green
                      : result == 'Perdiste'
                          ? Colors.red
                          : Colors.orange,
                ),
              ),
              const SizedBox(height: 40),
            ],

            // ====== BOTONES DE OPCIÓN ======
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChoiceButton(
                  icon: Icons.landscape,
                  text: 'Piedra',
                  onPressed: () => playGame('Piedra'),
                ),
                ChoiceButton(
                  icon: Icons.description,
                  text: 'Papel',
                  onPressed: () => playGame('Papel'),
                ),
                ChoiceButton(
                  icon: Icons.content_cut,
                  text: 'Tijera',
                  onPressed: () => playGame('Tijera'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ====== WIDGET REUTILIZABLE PARA BOTONES ======
class ChoiceButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const ChoiceButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 40),
          onPressed: onPressed,
          style: IconButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(16),
          ),
        ),
        const SizedBox(height: 8),
        Text(text),
      ],
    );
  }
}
