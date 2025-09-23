import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/products_screen.dart';
import 'screens/store_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class AppRoutes extends StatefulWidget {
  const AppRoutes({super.key});

  @override
  State<AppRoutes> createState() => _AppRoutesState();
}

class _AppRoutesState extends State<AppRoutes>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  bool _isMenuOpen = false;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
      if (_isMenuOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isMenuOpen = false;
      _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(onMenuPressed: _toggleMenu),
      AboutScreen(onMenuPressed: _toggleMenu),
      ProductsScreen(onMenuPressed: _toggleMenu),
      StoreScreen(onMenuPressed: _toggleMenu),
    ];

    return Scaffold(
      body: Stack(
        children: [
          screens[_selectedIndex],
          // Overlay oscuro cuando el menú está abierto
          if (_isMenuOpen)
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleMenu,
                child: Container(color: Colors.black.withValues(alpha: 0.5)),
              ),
            ),
          // Menú deslizante desde arriba
          SlideTransition(
            position: _slideAnimation,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF2C1810),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'START BOOTSTRAP',
                            style: GoogleFonts.lato(
                              color: const Color(0xFFE6A756),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5,
                            ),
                          ),
                          IconButton(
                            icon: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFE6A756),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Icon(
                                Icons.menu,
                                color: Color(0xFFE6A756),
                                size: 20,
                              ),
                            ),
                            onPressed: _toggleMenu,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: const Color(0xFFE6A756),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    const SizedBox(height: 10),
                    _buildMenuItem('HOME', 0),
                    _buildMenuItem('ABOUT', 1),
                    _buildMenuItem('PRODUCTS', 2),
                    _buildMenuItem('STORE', 3),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: isSelected
            ? Colors.black.withValues(alpha: 0.2)
            : Colors.transparent,
        child: Text(
          title,
          style: GoogleFonts.lato(
            color: isSelected ? const Color(0xFFE6A756) : Colors.white60,
            fontSize: 15,
            letterSpacing: 1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
