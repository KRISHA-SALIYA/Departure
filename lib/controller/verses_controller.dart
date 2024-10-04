import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/verses_model.dart';

class VersesController extends ChangeNotifier {
  List<VerseModel> allVerse = [];
  List<VerseModel> allChVerse = [];

  VersesController() {
    loadVerse();
  }

  loadVerse() async {
    String res = await rootBundle.loadString('assets/json_file/verses.json');
    List allData = jsonDecode(res);
    allVerse = allData.map((e) => VerseModel.fromMap(data: e)).toList();

    notifyListeners();
  }

  addChapter(int index, int chIndex) {
    if (index == chIndex) {
      allChVerse.add(allVerse[index]);
    }
    notifyListeners();
  }
}
