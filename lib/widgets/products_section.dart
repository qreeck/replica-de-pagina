import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  static const double _gutter = 30; // margen izq/der
  static const double _blockGap = 12; // separación vertical
  static const double _cardRadius = 8;
  static const Color _cardColor = Color(0xFFF6E9D3);

  //  Tarjeta "título"
  Widget _titleCard({
    required String overline,
    required List<String> titleLines,
    double overlineSize = 10,
    double titleSize = 50,
    double overlineSpacing = 2,
    double titleSpacing = 1,
    double gapBetween = 2,
    double linesGap = 0,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    TextAlign align = TextAlign.left,
  }) {
    return Container(
      width: double.infinity,
      margin: margin ?? const EdgeInsets.symmetric(vertical: _blockGap),
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(_cardRadius),
      ),
      child: Padding(
        // Padding interno
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: align == TextAlign.center
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Text(
              overline,
              textAlign: align,
              style: GoogleFonts.lato(
                fontSize: overlineSize,
                fontWeight: FontWeight.w600,
                letterSpacing: overlineSpacing,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: gapBetween),
            ...titleLines.map(
              (l) => Padding(
                padding: EdgeInsets.only(bottom: linesGap),
                child: Text(
                  l,
                  textAlign: align,
                  style: GoogleFonts.lato(
                    fontSize: titleSize,
                    fontWeight: FontWeight.w200,
                    letterSpacing: titleSpacing,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  Imagen
  Widget _imageBox(
    String assetPath, {
    double height = 300,
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(vertical: 0),
  }) {
    return Container(
      height: height,
      width: double.infinity,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_cardRadius),
        image: DecorationImage(image: AssetImage(assetPath), fit: BoxFit.cover),
      ),
    );
  }

  // Tarjeta "texto"
  Widget _textCard(
    String body, {
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    double fontSize = 14,
    double lineHeight = 2,
    TextAlign align = TextAlign.left,
  }) {
    return Container(
      width: double.infinity,
      margin: margin ?? const EdgeInsets.symmetric(vertical: _blockGap),
      padding: padding,
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(_cardRadius),
      ),
      child: Padding(
        // Padding interno
        padding: const EdgeInsets.all(24),
        child: Text(
          body,
          textAlign: align,
          style: GoogleFonts.merriweather(
            fontSize: fontSize,
            height: lineHeight,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  List<Widget> _section({
    required String overline,
    required List<String> titleLines,
    required String image,
    required String body,
    // ajustes por sección:
    double overlineSize = 23,
    double titleSize = 10,
    EdgeInsetsGeometry? titleMargin, // vertical
    EdgeInsetsGeometry? textMargin, // vertical
    double textSize = 10,
    double textLineHeight = 2,
    double imageHeight = 300,
  }) {
    return [
      _titleCard(
        overline: overline,
        titleLines: titleLines,
        overlineSize: overlineSize,
        titleSize: titleSize,
        margin: titleMargin ?? const EdgeInsets.symmetric(vertical: _blockGap),
        padding: EdgeInsets.zero,
      ),
      _imageBox(
        image,
        height: imageHeight,
        margin: const EdgeInsets.symmetric(vertical: _blockGap),
      ),
      _textCard(
        body,
        margin: textMargin ?? const EdgeInsets.symmetric(vertical: _blockGap),
        fontSize: textSize,
        lineHeight: textLineHeight,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _gutter),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          // ——— Sección 1 ———
          ..._section(
            overline: 'BLENDED TO PERFECTION',
            titleLines: const ['COFFEES & TEAS'],
            image: 'assets/images/products-01.jpg',
            body:
                'We take pride in our work, and it shows. Every time you order a beverage from us, we guarantee that it will be an experience worth having. Whether it\'s our world famous Venezuelan Cappuccino, a refreshing iced herbal tea, or something as simple as a cup of specialty sourced black coffee, you will be coming back for more.',
            overlineSize: 12,
            titleSize: 36,
            titleMargin: const EdgeInsets.symmetric(vertical: _blockGap),
            textMargin: const EdgeInsets.symmetric(vertical: _blockGap),
            textSize: 14,
            textLineHeight: 1.9,
            imageHeight: 320,
          ),

          const SizedBox(height: 16),

          // ——— Sección 2 ———
          ..._section(
            overline: 'DELICIOUS TREATS, GOOD EATS',
            titleLines: const ['BAKERY', '& KITCHEN'],
            image: 'assets/images/products-02.jpg',
            body:
                'Our seasonal menu features delicious snacks, baked goods, and even full meals perfect for breakfast or lunchtime. We source our ingredients from local, organic farms whenever possible, alongside premium vendors for specialty goods.',
            overlineSize: 12,
            titleSize: 44,
            titleMargin: const EdgeInsets.symmetric(vertical: _blockGap),
            textMargin: const EdgeInsets.symmetric(vertical: _blockGap),
            textSize: 14,
            textLineHeight: 1.9,
            imageHeight: 320,
          ),

          const SizedBox(height: 16),

          // ——— Sección 3 ———
          ..._section(
            overline: 'FROM AROUND THE WORLD',
            titleLines: const ['BULK', 'SPECIALTY', 'BLENDS'],
            image: 'assets/images/products-03.jpg',
            body:
                'Travelling the world for the very best quality coffee is something we take pride in. When you visit us, you\'ll always find new blends from around the world, mainly from regions in Central and South America. We sell our blends in smaller to large bulk quantities. Please visit us in person for more details.',
            overlineSize: 12,
            titleSize: 44,
            titleMargin: const EdgeInsets.symmetric(vertical: _blockGap),
            textMargin: const EdgeInsets.symmetric(vertical: _blockGap),
            textSize: 14,
            textLineHeight: 1.9,
            imageHeight: 320,
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
