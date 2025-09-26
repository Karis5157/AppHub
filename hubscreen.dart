// Importaciones necesarias
import 'package:flutter/material.dart';
import '../navigation/app_drawer.dart';
import '../practices/practices_index_screen.dart';
import '../project/kit_offline_screen.dart';
import '../settings/settings_screen.dart';

// Pantalla principal con el menú (HubScreen)
class HubScreen extends StatelessWidget {
  const HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        title: const Text('AppHub Portfolio'),
        automaticallyImplyLeading: true, // Muestra el ícono del menú si hay drawer
      ),
      // Menú lateral
      drawer: const AppDrawer(),
      // Contenido principal
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Tarjeta de navegación a prácticas
            DashboardCard(
              title: 'Prácticas',
              subtitle: 'Ver todas las prácticas realizadas',
              icon: Icons.list_alt,
              onTap: () => Navigator.pushNamed(context, '/practices'),
            ),
            const SizedBox(height: 20),

            // Tarjeta de navegación a proyecto principal
            DashboardCard(
              title: 'Proyecto - Kit Offline',
              subtitle: '4 módulos útiles sin conexión',
              icon: Icons.work,
              onTap: () => Navigator.pushNamed(context, '/project'),
            ),
            const SizedBox(height: 20),

            // Tarjeta de navegación a ajustes
            DashboardCard(
              title: 'Ajustes',
              subtitle: 'Configuración y información',
              icon: Icons.settings,
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget reutilizable: tarjeta del dashboard
class DashboardCard extends StatelessWidget {
  final String title;       // Título principal
  final String subtitle;    // Subtítulo descriptivo
  final IconData icon;      // Icono representativo
  final VoidCallback onTap; // Acción al tocar la tarjeta

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
      elevation: 4, // Sombra de la tarjeta
      child: InkWell(
        onTap: onTap, // Detecta toques en toda la tarjeta
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Icono a la izquierda
              Icon(icon, size: 40, color: Theme.of(context).primaryColor),
              const SizedBox(width: 16),

              // Texto principal y secundario
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

              // Flechita al final para indicar navegación
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
