import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageTextRow extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final String description;
  final bool imageOnLeft;

  const ImageTextRow({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.description,
    this.imageOnLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          if (imageOnLeft) ...[
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: AssetImage(imageAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: const Color(0xFFF6E9D3),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (subtitle.isNotEmpty) ...[
                  Text(
                    subtitle,
                    style: GoogleFonts.lato(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                const SizedBox(height: 20),
                Text(
                  description,
                  style: GoogleFonts.merriweather(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          if (!imageOnLeft) ...[
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: AssetImage(imageAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
