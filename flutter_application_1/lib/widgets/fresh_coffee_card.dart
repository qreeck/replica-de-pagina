import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FreshCoffeeCard extends StatelessWidget {
  const FreshCoffeeCard({
    super.key,
    this.horizontalMargin = 12,
    this.maxWidth = 560,
  });

  /// Para que el ancho de la tarjeta pueda igualar al de la imagen
  final double horizontalMargin;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    // Colores base (idénticos a la web)
    const beige = Color(0xFFF4E5D3);
    const textDark = Color(0xFF2C1810);
    const brand = Color(0xFFD4A574);
    const btn = Color(0xFFCE9B55);

    // Tamaño de letras de WORTH/DRINKING (ligeramente responsivo)
    final w = MediaQuery.of(context).size.width;
    final titleSize = w < 360 ? 34.0 : 38.0; // ajusta si la quieres más grande

    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        constraints: BoxConstraints(maxWidth: maxWidth),
        padding: const EdgeInsets.fromLTRB(22, 26, 22, 26),
        decoration: BoxDecoration(
          color: beige,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.20),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Subtítulo
            Text(
              'FRESH COFFEE',
              style: GoogleFonts.lato(
                fontSize: 14,
                letterSpacing: 2,
                fontWeight: FontWeight.w700,
                color: brand,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Títulos finos como en la web
            Text(
              'WORTH',
              style: GoogleFonts.raleway(
                fontSize: titleSize,
                height: 1.1,
                fontWeight: FontWeight
                    .w200, // fino (usa w100 si la quieres aún más delgada)
                letterSpacing: 1.6,
                color: textDark.withValues(alpha: 0.90),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              'DRINKING',
              style: GoogleFonts.raleway(
                fontSize: titleSize,
                height: 1.1,
                fontWeight: FontWeight.w200,
                letterSpacing: 1.6,
                color: textDark.withValues(alpha: 0.90),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),

            // Párrafo
            Text(
              'Every cup of our quality artisan coffee starts with locally sourced, hand picked ingredients. '
              'Once you try it, our coffee will be a blissful addition to your everyday morning routine – we guarantee it!',
              style: GoogleFonts.merriweather(
                fontSize: 14,
                height: 1.75,
                color: textDark.withValues(alpha: 0.92),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),

            // Botón
            SizedBox(
              width: 190,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: btn,
                  foregroundColor: Colors.black.withValues(alpha: 0.85),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Visit Us Today!',
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
