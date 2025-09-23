import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    this.topGapBeans = 0, // ← controla el espacio con fondo de granos
  });

  /// Altura (en px) de la banda superior con granos antes del footer.
  /// Pon 0 para no mostrar nada.
  final double topGapBeans;

  @override
  Widget build(BuildContext context) {
    const dark = Color(0xFF2C1810);
    const brand = Color(0xFFD4A574);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (topGapBeans > 0)
          SizedBox(
            height: topGapBeans,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset('assets/images/bg.jpg', fit: BoxFit.cover),
                Container(color: Colors.black.withValues(alpha: 0.60)),
              ],
            ),
          ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 24),
          color: dark.withValues(alpha: 0.98),
          child: Center(
            child: Text(
              'Copyright © Your Website 2023',
              style: GoogleFonts.merriweather(
                fontSize: 12,
                color: brand,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
