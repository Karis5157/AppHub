import 'package:flutter/material.dart';

// Widget para el menú lateral de la aplicación
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer( // Contenedor del menú lateral
      child: ListView(
        padding: EdgeInsets.zero, // Quita los márgenes por defecto
        children: [
          // Encabezado del menú
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue, // Fondo azul
            ),
            child: Text(
              'AppHub Portfolio',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          // Opción "Inicio"
          ListTile(
            leading: const Icon(Icons.home), // Icono de casita
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              Navigator.pushReplacementNamed(context, '/'); // Va a Home
            },
          ),

          // Opción "Índice de prácticas"
          ListTile(
            leading: const Icon(Icons.list), // Icono de lista
            title: const Text('Índice de Prácticas'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/practices');
            },
          ),

          // Opción "Proyecto"
          ListTile(
            leading: const Icon(Icons.work), // Icono de maletín
            title: const Text('Proyecto - Kit Offline'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/project');
            },
          ),

          // Opción "Ajustes"
          ListTile(
            leading: const Icon(Icons.settings), // Icono de engrane
            title: const Text('Ajustes'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}
