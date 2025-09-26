import 'package:flutter/material.dart';
import '../navigation/app_drawer.dart';

// Pantalla principal del "Kit Offline"
class KitOfflineScreen extends StatelessWidget {
  const KitOfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kit Offline'),
        automaticallyImplyLeading: true, // agrega botón de menú automáticamente
      ),
      drawer: const AppDrawer(), // menú lateral reutilizable
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // estira los widgets al ancho disponible
          children: [
            // Tarjeta de acceso a Notas
            DashboardCard(
              title: 'Notas Rápidas',
              subtitle: 'Agrega y gestiona notas temporales',
              icon: Icons.note,
              onTap: () => Navigator.pushNamed(context, '/notes'),
            ),
            const SizedBox(height: 16),

            // Tarjeta de acceso a Calculadora IMC
            DashboardCard(
              title: 'Calculadora IMC',
              subtitle: 'Calcula tu Índice de Masa Corporal',
              icon: Icons.calculate,
              onTap: () => Navigator.pushNamed(context, '/imc'),
            ),
            const SizedBox(height: 16),

            // Tarjeta de acceso a Galería Local
            DashboardCard(
              title: 'Galería Local',
              subtitle: 'Visualiza imágenes locales',
              icon: Icons.photo_library,
              onTap: () => Navigator.pushNamed(context, '/gallery'),
            ),
            const SizedBox(height: 16),

            // Tarjeta de acceso al juego Par o Impar
            DashboardCard(
              title: 'Juego: Par o Impar',
              subtitle: 'Juega contra la CPU',
              icon: Icons.casino,
              onTap: () => Navigator.pushNamed(context, '/evenodd'),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget reutilizable para crear tarjetas de navegación en el dashboard
class DashboardCard extends StatelessWidget {
  final String title;       // título principal de la tarjeta
  final String subtitle;    // descripción corta
  final IconData icon;      // ícono representativo
  final VoidCallback onTap; // acción al hacer clic

  const DashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // sombra para resaltar la tarjeta
      child: InkWell(
        onTap: onTap, // detecta taps en toda la tarjeta
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Ícono de la tarjeta
              Icon(icon, size: 40, color: Theme.of(context).primaryColor),
              const SizedBox(width: 16),

              // Título y subtítulo alineados a la izquierda
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Flecha indicando navegación
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
