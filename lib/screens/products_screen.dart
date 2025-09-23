import 'package:flutter/material.dart';
import '../widgets/products_section.dart';
import '../widgets/footer.dart';
import '../widgets/app_top_bar.dart';

class ProductsScreen extends StatelessWidget {
  final VoidCallback onMenuPressed;

  const ProductsScreen({super.key, required this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fondo estático
        Positioned.fill(
          child: Image.asset(
            'assets/images/bg.jpg',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        // Degradado para legibilidad
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x002B1B11), // Transparente en la parte superior
                  Color(0x402B1B11),
                  Color(0x602B1B11),
                  Color(0x802B1B11),
                ],
                stops: [0.0, 0.4, 0.7, 1.0],
              ),
            ),
          ),
        ),

        // Contenido scrollable encima del fondo
        SingleChildScrollView(
          child: Column(
            children: [
              // Top bar que desaparece al hacer scroll
              AppTopBar(onMenuPressed: onMenuPressed),

              const ProductsSection(),
              const Footer(topGapBeans: 0),
            ],
          ),
        ),
      ],
    );
  }
}
