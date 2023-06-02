import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyButtomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyButtomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.white,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.pink.shade500,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        gap: 8,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Inicio',
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: 'Mi carrito',
          )
        ],
      ),
    );
  }
}
