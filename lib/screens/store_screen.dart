import 'package:flutter/material.dart';
import '../widgets/store_section.dart';

class StoreScreen extends StatelessWidget {
  final VoidCallback onMenuPressed;

  const StoreScreen({super.key, required this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    return StoreSection(onMenuPressed: onMenuPressed);
  }
}
