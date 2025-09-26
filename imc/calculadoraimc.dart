import 'package:flutter/material.dart';
import '../../navigation/app_drawer.dart';

// Pantalla para calcular el Índice de Masa Corporal (IMC)
class IMCCalculatorScreen extends StatefulWidget {
  const IMCCalculatorScreen({super.key});

  @override
  State<IMCCalculatorScreen> createState() => _IMCCalculatorScreenState();
}

class _IMCCalculatorScreenState extends State<IMCCalculatorScreen> {
  // Llave para manejar validaciones del formulario
  final _formKey = GlobalKey<FormState>();

  // Controladores de los campos de entrada
  final _heightController = TextEditingController(); // Estatura en metros
  final _weightController = TextEditingController(); // Peso en kilogramos

  // Retorna la categoría del IMC según el valor
  String _categoriaIMC(double imc) {
    if (imc < 18.5) return 'Bajo peso';
    if (imc < 25) return 'Normal';
    if (imc < 30) return 'Sobrepeso';
    return 'Obesidad';
  }

  // Función para calcular el IMC
  void _calcularIMC() {
    if (_formKey.currentState!.validate()) {
      final height = double.parse(_heightController.text);
      final weight = double.parse(_weightController.text);
      final imc = weight / (height * height);

      // Muestra resultado en un SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('IMC: ${imc.toStringAsFixed(2)} - ${_categoriaIMC(imc)}'),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  // Limpia los campos del formulario
  void _limpiarFormulario() {
    _formKey.currentState!.reset();
    _heightController.clear();
    _weightController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        automaticallyImplyLeading: true, // muestra el ícono del menú
      ),
      drawer: const AppDrawer(), // menú lateral
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // vincula validaciones al formulario
          child: Column(
            children: [
              // Campo para ingresar estatura
              TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(
                  labelText: 'Estatura (metros)',
                  hintText: 'Ej: 1.75',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese la estatura';
                  }
                  final height = double.tryParse(value);
                  if (height == null || height <= 0) {
                    return 'Ingrese un número válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo para ingresar peso
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(
                  labelText: 'Peso (kg)',
                  hintText: 'Ej: 70.5',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el peso';
                  }
                  final weight = double.tryParse(value);
                  if (weight == null || weight <= 0) {
                    return 'Ingrese un número válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Botones de acción: calcular o limpiar
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _calcularIMC,
                      child: const Text('Calcular IMC'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _limpiarFormulario,
                      child: const Text('Limpiar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Liberar memoria de los controladores
  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }
}
