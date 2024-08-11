import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final Function(int)? onTabChange;

  const MyBottomNavBar({super.key, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: GNav(
        selectedIndex: 1,
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        onTabChange: onTabChange,
        tabs: const [
          GButton(icon: Icons.favorite, text: 'Love'),
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.thumb_down, text: 'Hate'),
        ],
      ),
    );
  }
}
