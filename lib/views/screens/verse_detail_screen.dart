import 'package:bhagvatgeeta/controller/chapter_controller.dart';
import 'package:bhagvatgeeta/controller/favorite_controller.dart';
import 'package:bhagvatgeeta/controller/verses_controller.dart';
import 'package:bhagvatgeeta/model/verses_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../controller/language_controller.dart';
import '../../helper/arguments.dart';

class VerseDetailScreen extends StatelessWidget {
  const VerseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final argument =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    double h = MediaQuery.of(context).size.height;

    TextStyle largeTextStyle = const TextStyle(
      fontSize: 20,
    );
    TextStyle headingTextStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    dynamic languageProvider = Provider.of<LanguageController>(context);

    dynamic chProvider = Provider.of<ChapterController>(context)
        .allChapter[argument.chIndex]
        .chapterNumber;

    bool isFavorite = false;
    return Consumer<VersesController>(builder: (context, vProvider, child) {
      VerseModel pro = vProvider.allVerse[argument.chIndex];

      return Scaffold(
        appBar: AppBar(
          title: Text(languageProvider.isHindi
              ? "श्लोक ${pro.verseNumber}"
              : pro.title),
          actions: [
            Consumer<FavoriteController>(builder: (context, fPro, _) {
              return IconButton(
                onPressed: () {
                  fPro.onTapped(data: pro);
                  isFavorite = !isFavorite;
                },
                icon: isFavorite
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border_outlined),
              );
            }),
            Consumer<ChapterController>(builder: (context, cPro, _) {
              return IconButton(
                onPressed: () async {
                  await Share.share(
                    "${cPro.allChapter[argument.chIndex].name}\n${pro.title}\n${pro.text}",
                  );
                },
                icon: const Icon(Icons.share),
              );
            }),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: vProvider.allVerse.isNotEmpty
              ? (chProvider ==
                      vProvider.allVerse[argument.verseIndex].chapterNumber)
                  ? SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          languageProvider.isHindi
                              ? Text(
                                  pro.text,
                                  style: largeTextStyle,
                                )
                              : Column(
                                  children: [
                                    Text(
                                      pro.text,
                                      style: largeTextStyle,
                                    ),
                                    SizedBox(height: h * 0.01),
                                    Text(
                                      "Transliteration:-",
                                      style: headingTextStyle,
                                    ),
                                    SizedBox(height: h * 0.01),
                                    Text(
                                      pro.transliteration,
                                      style: largeTextStyle,
                                    ),
                                    SizedBox(height: h * 0.01),
                                    Text(
                                      "Word-Meaning:-",
                                      style: headingTextStyle,
                                    ),
                                    SizedBox(height: h * 0.01),
                                    Text(
                                      pro.wordMeanings,
                                      style: largeTextStyle,
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      );
    });
  }
}
