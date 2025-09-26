import 'package:flutter/material.dart';
import '../navigation/app_drawer.dart';
import 'practice1.dart';
import 'practice2.dart';
import 'practice3.dart';
import 'practice4.dart';

// Pantalla que muestra un índice con accesos a todas las prácticas
class PracticesIndexScreen extends StatelessWidget {
  const PracticesIndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior con título
      appBar: AppBar(
        title: const Text('Índice de Prácticas'),
        automaticallyImplyLeading: true, // muestra menú hamburguesa
      ),
      drawer: const AppDrawer(), // menú lateral reutilizable
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Tarjeta para práctica 1
          PracticeCard(
            title: 'Práctica 1',
            subtitle: 'Mostrar/Ocultar 10 Hola Mundos',
            icon: Icons.looks_one,
            onTap: () => Navigator.pushNamed(context, '/practice1'),
          ),
          const SizedBox(height: 12),

          // Tarjeta para práctica 2
          PracticeCard(
            title: 'Práctica 2',
            subtitle: 'Lista dinámica con botones',
            icon: Icons.looks_two,
            onTap: () => Navigator.pushNamed(context, '/practice2'),
          ),
          const SizedBox(height: 12),

          // Tarjeta para práctica 3
          PracticeCard(
            title: 'Práctica 3',
            subtitle: 'Formulario de registro con validación',
            icon: Icons.looks_3,
            onTap: () => Navigator.pushNamed(context, '/practice3'),
          ),
          const SizedBox(height: 12),

          // Tarjeta para práctica 4
          PracticeCard(
            title: 'Práctica 4',
            subtitle: 'Juego: Piedra, Papel o Tijera',
            icon: Icons.sports_esports,
            onTap: () => Navigator.pushNamed(context, '/practice4'),
          ),
        ],
      ),
    );
  }
}

// Widget reutilizable para cada tarjeta de práctica
class PracticeCard extends StatelessWidget {
  final String title;     // Título (Práctica 1, 2, etc.)
  final String subtitle;  // Descripción corta
  final IconData icon;    // Icono representativo
  final VoidCallback onTap; // Acción al presionar

  const PracticeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 36), // icono a la izquierda
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios), // flecha a la derecha
        onTap: onTap, // navega a la práctica correspondiente
      ),
    );
  }
}
