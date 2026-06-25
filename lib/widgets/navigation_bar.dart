import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Accueil'),
        NavigationDestination(icon: Icon(Icons.quiz), label: 'Historique'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
      ],
    );
  }
}
