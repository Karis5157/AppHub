// Importaciones de Flutter y de las pantallas creadas en el proyecto
import 'package:flutter/material.dart';
import 'hub/hub_screen.dart';
import 'practices/practices_index_screen.dart';
import 'practices/practice1.dart';
import 'practices/practice2.dart';
import 'practices/practice3.dart';
import 'practices/practice4.dart';
import 'project/kit_offline_screen.dart';
import 'settings/settings_screen.dart';
import 'project/notes/notes_screen.dart';
import 'project/imc/imc_calculator_screen.dart';
import 'project/gallery/gallery_screen.dart';
import 'project/game/even_odd_game_screen.dart';

// Punto de entrada de la app
void main() {
  runApp(const MyApp()); // Lanza el widget raíz MyApp
}

// Widget principal de la aplicación (con estado)
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Estado del tema: claro por defecto
  ThemeMode _themeMode = ThemeMode.light;

  // Función que permite cambiar el tema entre claro y oscuro
  void _changeTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppHub Portfolio', // Título de la app
      theme: ThemeData.light(),  // Tema claro
      darkTheme: ThemeData.dark(), // Tema oscuro
      themeMode: _themeMode, // Se elige según el estado (_themeMode)
      initialRoute: '/', // Ruta inicial al abrir la app
      routes: {
        // Mapa de rutas de la app
        '/': (context) => HubScreen(),
        '/practices': (context) => PracticesIndexScreen(),
        '/practice1': (context) => Practice1(),
        '/practice2': (context) => Practice2(),
        '/practice3': (context) => Practice3(),
        '/practice4': (context) => Practice4(),
        '/project': (context) => KitOfflineScreen(),
        '/settings': (context) => SettingsScreen(onThemeChange: _changeTheme),
        '/notes': (context) => NotesScreen(),
        '/imc': (context) => IMCCalculatorScreen(),
        '/gallery': (context) => GalleryScreen(),
        '/evenodd': (context) => EvenOddGameScreen(),
      },
    );
  }
}
