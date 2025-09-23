import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroCard extends StatelessWidget {
  /// Fracción de la altura de pantalla que se usará como padding superior.
  /// Ej: 0.06 = 6% de la altura de pantalla.
  final double topOffsetFrac;

  const IntroCard({super.key, this.topOffsetFrac = 0.04});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final topOffset = h * topOffsetFrac; // <-- aquí el "height * 0.xx"

    return Container(
      width: double.infinity,
      color: const Color(0xFFD4A574), // banda dorada
      margin: const EdgeInsets.only(bottom: 56),
      // Usamos el offset como paddingTop para “bajar” la tarjeta
      padding: EdgeInsets.fromLTRB(16, topOffset, 16, 28),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Container(
            padding: const EdgeInsets.fromLTRB(22, 26, 22, 26),
            decoration: BoxDecoration(
              color: const Color(0xFFF4E5D3),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFEAD7C2), width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'OUR PROMISE',
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.4,
                    color: const Color(0xFF2C1810),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 0.1),
                Text(
                  'TO YOU',
                  style: GoogleFonts.raleway(
                    fontSize: 40,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 6,
                    color: const Color(0xFF2C1810),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'When you walk into our shop to start your day, we are dedicated to providing you with friendly service, a welcoming atmosphere, and above all else, excellent products made with the highest quality ingredients. If you are not satisfied, please let us know and we will do whatever we can to make things right!',
                  style: GoogleFonts.merriweather(
                    fontSize: 14,
                    height: 1.85,
                    color: const Color(0xFF2C1810),
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
