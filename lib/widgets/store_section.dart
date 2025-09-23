import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/footer.dart';
import '../widgets/app_top_bar.dart';

class StoreSection extends StatelessWidget {
  const StoreSection({
    super.key,
    this.backgroundAsset = 'assets/images/bg.jpg',
    this.storefrontAsset = 'assets/images/cafeteria.jpg',
    required this.onMenuPressed,
  });

  final String backgroundAsset;
  final String storefrontAsset;
  final VoidCallback onMenuPressed;

  // Colores
  static const _brandYellow = Color(0xFFF0B561);
  static const _panelBeige = Color(0xFFF4E2C9);
  static const _panelBorder = Color(0xFFE0B57E);
  static const _muted = Color(0xFF8E8B85);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fondo
        Positioned.fill(
          child: Image.asset(
            backgroundAsset,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        // Degradado
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

        // Contenido
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTopBar(onMenuPressed: onMenuPressed),
              const SizedBox(height: 24),
              // Panel anaranjado
              _AccentBackdrop(child: const _StoreCard()),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
                child: Column(
                  children: [
                    _StorefrontImage(asset: storefrontAsset),
                    const SizedBox(height: 24),
                    // About structure
                    // About
                    _AboutCafeCard(),
                  ],
                ),
              ),
              // Footer
              const SizedBox(height: 32),
              const Footer(),
            ],
          ),
        ),
      ],
    );
  }
}

class _AccentBackdrop extends StatelessWidget {
  const _AccentBackdrop({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Color.fromRGBO(230, 169, 97, 0.95), // más visible
        boxShadow: const [
          BoxShadow(
            color: Color(0x802B1B11),
            blurRadius: 24,
            offset: Offset(0, 12),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 430),
        child: child,
      ),
    );
  }
}

class _StoreCard extends StatelessWidget {
  const _StoreCard();

  @override
  Widget build(BuildContext context) {
    final heading = GoogleFonts.raleway(
      color: Color.fromRGBO(0, 0, 0, 0.86),
      letterSpacing: 3.0,
      fontWeight: FontWeight.w700,
    );

    return Container(
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 26),
      decoration: BoxDecoration(
        color: StoreSection._panelBeige,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: StoreSection._panelBorder, width: 3),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 28,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          Text(
            'COME ON IN',
            textAlign: TextAlign.center,
            style: heading.copyWith(
              fontSize: 12,
              letterSpacing: 3.2,
              fontWeight: FontWeight.w900, // Más negrita
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "WE'RE OPEN",
            textAlign: TextAlign.center,
            style: GoogleFonts.raleway(
              fontSize: 42,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w200,
              color: Color.fromRGBO(0, 0, 0, 0.86),
            ),
          ),
          const SizedBox(height: 18),

          const _ScheduleRow('Sunday', 'Closed', muted: true),
          const _ScheduleRow('Monday', '7:00 AM to 8:00 PM', highlight: true),
          const _ScheduleRow('Tuesday', '7:00 AM to 8:00 PM'),
          const _ScheduleRow('Wednesday', '7:00 AM to 8:00 PM'),
          const _ScheduleRow('Thursday', '7:00 AM to 8:00 PM'),
          const _ScheduleRow('Friday', '7:00 AM to 8:00 PM'),
          const _ScheduleRow('Saturday', '9:00 AM to 5:00 PM'),
          const SizedBox(height: 22),

          Center(
            child: Column(
              children: [
                Text(
                  '1116 Orchard Street',
                  style: GoogleFonts.raleway(
                    fontSize: 18,
                    color: Color.fromRGBO(0, 0, 0, 0.88),
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Golden Valley, Minnesota',
                  style: GoogleFonts.raleway(
                    fontSize: 15,
                    color: Color.fromRGBO(0, 0, 0, 0.55),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          Center(
            child: Column(
              children: [
                Text(
                  'Call Anytime',
                  style: GoogleFonts.raleway(
                    fontSize: 15,
                    color: Color.fromRGBO(0, 0, 0, 0.88),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '(317) 585-8468',
                  style: GoogleFonts.raleway(
                    fontSize: 15,
                    color: Color.fromRGBO(0, 0, 0, 0.55),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ScheduleRow extends StatelessWidget {
  const _ScheduleRow(
    this.day,
    this.hours, {
    this.highlight = false,
    this.muted = false,
  });
  final String day;
  final String hours;
  final bool highlight;
  final bool muted;

  @override
  Widget build(BuildContext context) {
    final dayStyle = GoogleFonts.raleway(
      fontSize: 15,
      fontWeight: FontWeight.w800,
      color: Colors.black87,
      letterSpacing: 0.2,
    );

    final hoursStyle = GoogleFonts.raleway(
      fontSize: 15,
      fontWeight: highlight ? FontWeight.w800 : FontWeight.w700,
      color: muted
          ? StoreSection._muted
          : (highlight
                ? StoreSection._brandYellow
                : Color.fromRGBO(0, 0, 0, 0.75)),
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    day,
                    style: dayStyle,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    hours,
                    style: hoursStyle,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Línea separadora
        Container(
          height: 1,
          color: const Color(0x33A6723A),
          margin: const EdgeInsets.symmetric(horizontal: 8),
        ),
      ],
    );
  }
}

class _AboutCafeCard extends StatelessWidget {
  const _AboutCafeCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: StoreSection._panelBeige,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: StoreSection._panelBorder, width: 3),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 28,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Título pequeño
          Text(
            'STRONG COFFEE, STRONG ROOTS',
            textAlign: TextAlign.left,
            style: GoogleFonts.raleway(
              fontSize: 11,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w800, // En negrita
              color: Color.fromRGBO(0, 0, 0, 0.75),
            ),
          ),
          const SizedBox(height: 12),

          // Título principal
          Text(
            'ABOUT OUR CAFE',
            textAlign: TextAlign.left,
            style: GoogleFonts.raleway(
              fontSize: 28,
              letterSpacing: 3.0,
              fontWeight: FontWeight.w200,
              color: Color.fromRGBO(0, 0, 0, 0.86),
            ),
          ),
          const SizedBox(height: 20),

          // Descripción
          Text(
            'Founded in 1987 by the Hernandez brothers, our establishment has been serving up rich coffee sourced from artisan farms in various regions of Central and South America. We are dedicated to travelling the world, finding the best coffee, and bringing back to you here in our cafe.',
            textAlign: TextAlign.left,
            style: GoogleFonts.raleway(
              fontSize: 14,
              height: 1.6,
              color: Color.fromRGBO(0, 0, 0, 0.70),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),

          // Párrafo 2
          Text(
            'We guarantee that you will fall in love with our decadent blends the moment you walk inside each year from last sip, slow for your daily routine, are outing with friends, or simply just to enjoy some alone time.',
            textAlign: TextAlign.left,
            style: GoogleFonts.raleway(
              fontSize: 14,
              height: 1.6,
              color: Color.fromRGBO(0, 0, 0, 0.70),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _StorefrontImage extends StatelessWidget {
  const _StorefrontImage({required this.asset});
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 24,
            offset: Offset(0, 14),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        asset,
        height: 220,
        width: double.infinity,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    );
  }
}
