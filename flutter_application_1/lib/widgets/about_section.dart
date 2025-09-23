import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Container(
          height: 150,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: const DecorationImage(
              image: AssetImage('assets/images/cafeteria.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Panel beige con texto
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(60),
          decoration: BoxDecoration(
            color: const Color(0xFFF6E9D3),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'STRONG COFFEE, STRONG\nROOTS',
                style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.left,
              ),

              const SizedBox(height: 5),
              Text(
                'ABOUT\nOUR CAFE',
                style: GoogleFonts.lato(
                  fontSize: 50,
                  fontWeight: FontWeight.w200,
                  color: Colors.black87,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Founded in 1987 by the Hernandez brothers, our establishment has been serving up rich coffee sourced from artisan farmers in various regions of South and Central America. We are dedicated to travelling the world, finding the best coffee, and bringing back to you here in our cafe.',
                style: GoogleFonts.merriweather(
                  fontSize: 15,
                  color: Colors.black87,
                  height: 1.8,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              Text(
                'We guarantee that you will fall in lust with our decadent blends the moment you walk inside until you finish your last sip. Join us for your daily routine, an outing with friends, or simply just to enjoy some alone time.',
                style: GoogleFonts.merriweather(
                  fontSize: 15,
                  color: Colors.black87,
                  height: 1.8,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
