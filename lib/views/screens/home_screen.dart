import 'package:bhagvatgeeta/controller/bottomNavigationController.dart';
import 'package:bhagvatgeeta/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/language_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic languageProvider = Provider.of<LanguageController>(context);
    return Consumer<BottomNavigationController>(
        builder: (context, provider, _) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: languageProvider.isHindi ? "घर" : "Home",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_border_rounded),
              label: languageProvider.isHindi ? "पसंदीदा" : "Favourite",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.format_quote_rounded),
              label: languageProvider.isHindi ? "विचार" : "Quotes",
            ),
          ],
          currentIndex: provider.selectedIndex,
          onTap: (index) {
            provider.onItemTapped(index);
          },
          selectedItemColor: Provider.of<ThemeController>(context).isDark
              ? Colors.deepOrangeAccent
              : Colors.black,
          unselectedItemColor: Colors.grey,
        ),
        body: provider.allScreen.elementAt(provider.selectedIndex),
      );
    });
  }
}
