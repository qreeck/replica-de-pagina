import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Masthead extends StatelessWidget {
  final double bottomGap;

  const Masthead({super.key, this.bottomGap = 0});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;

    final topOffset = height * 0.08;

    // Colores
    const beige = Color(0xFFF4E5D3);
    const textDark = Color(0xFF2C1810);
    const btn = Color(0xFFCE9B55);

    // Alto de la imagen superior
    final heroImgHeight = height.clamp(560.0, 800.0) * 0.30;

    return SizedBox(
      height: height + bottomGap,
      width: double.infinity,
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, topOffset, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Foto
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/intro.jpg',
                      height: heroImgHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Tarjeta beige
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 520),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(22, 26, 22, 26),
                        decoration: BoxDecoration(
                          color: beige,
                          borderRadius: BorderRadius.circular(6),
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
                            Text(
                              'FRESH COFFEE',
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),

                            // Título “WORTH / DRINKING”
                            Text(
                              'WORTH',
                              style: GoogleFonts.merriweather(
                                fontSize: 34,
                                height: 1.15,
                                fontWeight: FontWeight.w100,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'DRINKING',
                              style: GoogleFonts.merriweather(
                                fontSize: 34,
                                height: 1.15,
                                fontWeight: FontWeight.w100,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 18),

                            // Párrafo
                            Text(
                              'Every cup of our quality artisan coffee starts with locally sourced, hand picked ingredients. Once you try it, our coffee will be a blissful addition to your everyday morning routine – we guarantee it!',
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
                                  foregroundColor: Colors.black.withValues(
                                    alpha: 0.85,
                                  ),
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
                    ),
                  ),

                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
