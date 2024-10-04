import 'package:flutter/material.dart';

import '../model/verses_model.dart';

class FavoriteController extends ChangeNotifier {
  List allFavorite = [];

  bool isFavorite = false;

  onTapped({required VerseModel data}) {
    allFavorite.add(data);
    notifyListeners();
  }

  delete({required int index}) {
    allFavorite.removeAt(index);
    notifyListeners();
  }
}
