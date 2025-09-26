import 'package:flutter/material.dart';
import '../../navigation/app_drawer.dart';

// Pantalla que muestra una galería de imágenes locales
class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  // Lista de rutas de imágenes locales dentro de assets
  final List<String> imagenes = const [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior con título
      appBar: AppBar(
        title: const Text('Galería Local'),
        automaticallyImplyLeading: true, // botón menú hamburguesa
      ),
      drawer: const AppDrawer(), // menú lateral
      body: GridView.count(
        crossAxisCount: 2, // 2 columnas en la cuadrícula
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 10, // espacio horizontal entre imágenes
        mainAxisSpacing: 10,  // espacio vertical entre imágenes
        children: imagenes.map((imagen) {
          return GestureDetector(
            // Al tocar una imagen se abre un diálogo
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Imagen Ampliada'),
                  content: Image.asset(
                    imagen,
                    // Manejo de error si la imagen no existe
                    errorBuilder: (context, error, stackTrace) {
                      return const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.error, size: 50, color: Colors.red),
                          SizedBox(height: 10),
                          Text('Imagen no encontrada'),
                          Text('Agrega imágenes en assets/images/'),
                        ],
                      );
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cerrar'),
                    ),
                  ],
                ),
              );
            },
            // Imagen dentro de una tarjeta (vista previa)
            child: Card(
              child: Image.asset(
                imagen,
                fit: BoxFit.cover, // ajusta para cubrir el espacio
                // Si no existe, muestra ícono de imagen vacía
                errorBuilder: (context, error, stackTrace) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo, size: 40),
                      Text('Agregar imagen'),
                    ],
                  );
                },
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
