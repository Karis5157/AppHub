import 'package:flutter/material.dart';
import '../navigation/app_drawer.dart';

// Pantalla de ajustes (Settings)
class SettingsScreen extends StatefulWidget {
  // Callback para notificar cuando se cambia el tema (oscuro/claro)
  final Function(bool) onThemeChange;

  const SettingsScreen({super.key, required this.onThemeChange});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Estado interno que guarda si el tema oscuro está activado
  bool _temaOscuro = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
        automaticallyImplyLeading: true, // muestra el botón de volver/menú
      ),
      drawer: const AppDrawer(), // menú lateral de navegación
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Opción de cambiar entre tema claro/oscuro
          Card(
            child: SwitchListTile(
              title: const Text('Tema Oscuro'),
              value: _temaOscuro, // estado actual del switch
              onChanged: (value) {
                setState(() {
                  _temaOscuro = value; // actualiza estado local
                });
                widget.onThemeChange(value); // notifica al padre el cambio
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tema ${value ? 'oscuro' : 'claro'} activado'),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // Opción "Acerca de"
          Card(
            child: ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Acerca de'),
              subtitle: const Text('Versión 1.0.0'),
              onTap: () {
                // Abre un cuadro de diálogo con info de la app
                showAboutDialog(
                  context: context,
                  applicationName: 'AppHub Portfolio',
                  applicationVersion: '1.0.0',
                  applicationIcon: const FlutterLogo(size: 50),
                  children: [
                    const Text('Desarrollado por [Tu Nombre]'),
                    const Text('Proyecto de prácticas Flutter'),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
