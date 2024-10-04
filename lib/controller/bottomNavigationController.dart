import 'package:flutter/foundation.dart';

import '../views/screens/chapter_screen.dart';
import '../views/screens/favourite_screen.dart';
import '../views/screens/quote_screen.dart';

class BottomNavigationController extends ChangeNotifier {
  int selectedIndex = 0;

  onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List allScreen = const [
    ChapterScreen(),
    FavouriteScreen(),
    QuoteScreen(),
  ];
}
