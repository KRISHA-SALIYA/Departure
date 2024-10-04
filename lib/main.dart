import 'package:bhagvatgeeta/views/screens/ch_detail_screen.dart';
import 'package:bhagvatgeeta/views/screens/favourite_screen.dart';
import 'package:bhagvatgeeta/views/screens/home_screen.dart';
import 'package:bhagvatgeeta/views/screens/quote_screen.dart';
import 'package:bhagvatgeeta/views/screens/splash_screen.dart';
import 'package:bhagvatgeeta/views/screens/verse_detail_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/bottomNavigationController.dart';
import 'controller/chapter_controller.dart';
import 'controller/favorite_controller.dart';
import 'controller/language_controller.dart';
import 'controller/quote_controller.dart';
import 'controller/theme_controller.dart';
import 'controller/verses_controller.dart';
import 'helper/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChapterController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavigationController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => VersesController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuoteController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Provider.of<ThemeController>(context).isDark
          ? ThemeMode.dark
          : ThemeMode.light,
      initialRoute: 'splash_screen',
      routes: {
        '/': (context) => const HomeScreen(),
        'splash_screen': (context) => const SplashScreen(),
        'ch_detail_screen': (context) => const ChDetailScreen(),
        'verse_detail_screen': (context) => const VerseDetailScreen(),
        'favorite_screen': (context) => const FavouriteScreen(),
        'quote_screen': (context) => const QuoteScreen(),
      },
    );
  }
}
