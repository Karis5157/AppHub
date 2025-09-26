import 'package:flutter/material.dart';
import '../navigation/app_drawer.dart';

// Pantalla de la práctica 1
class Practice1 extends StatefulWidget {
  const Practice1({super.key});

  @override
  State<Practice1> createState() => _Practice1State();
}

class _Practice1State extends State<Practice1> {
  // Lista que guardará los "Hola Mundo"
  List<String> items = [];
  // Estado que indica si se muestran o no
  bool showHelloWorlds = false;

  // Función que alterna entre mostrar y ocultar los textos
  void toggleHelloWorlds() {
    setState(() {
      showHelloWorlds = !showHelloWorlds; // Invierte el val
