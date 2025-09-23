import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTopBar extends StatelessWidget {
  final VoidCallback onMenuPressed;

  const AppTopBar({super.key, required this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF2C1810),
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 8),
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            Text(
              'START BOOTSTRAP',
              style: GoogleFonts.raleway(
                fontSize: 15,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w800,
                color: const Color(0xFFF0B561),
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF0B561), width: 1.4),
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromRGBO(0, 0, 0, 0.15),
              ),
              child: IconButton(
                icon: const Icon(Icons.menu),
                color: const Color(0xFFF0B561),
                splashRadius: 20,
                tooltip: 'Menu',
                onPressed: onMenuPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
