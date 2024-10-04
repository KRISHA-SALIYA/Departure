import 'package:bhagvatgeeta/controller/chapter_controller.dart';
import 'package:bhagvatgeeta/controller/language_controller.dart';
import 'package:bhagvatgeeta/controller/theme_controller.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../model/chapter_model.dart';

class ChapterScreen extends StatelessWidget {
  const ChapterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic themeProvider = Provider.of<ThemeController>(context);

    return Consumer<LanguageController>(builder: (context, pro, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(pro.isHindi ? "भगवद गीता" : "Bhagavad Gita"),
          actions: [
            IconButton(
              onPressed: () {
                themeProvider.onTapped();
              },
              icon: Icon(
                themeProvider.isDark
                    ? Icons.light_mode
                    : Icons.dark_mode_rounded,
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg_drawer.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                  child: Text(
                    pro.isHindi ? 'भगवद गीता' : 'Bhagavad Gita',
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: Text(
                  pro.isHindi ? 'घर' : 'Home',
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.favorite,
                ),
                title: Text(
                  pro.isHindi ? 'पसंदीदा' : 'Favorite',
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('favorite_screen');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.format_quote,
                ),
                title: Text(
                  pro.isHindi ? 'विचार' : 'Quotes',
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('quote_screen');
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.language,
                ),
                title: Text(
                  pro.isHindi ? 'English' : 'Hindi',
                ),
                onTap: () {
                  pro.onChange();
                },
              ),
              ListTile(
                leading: Icon(
                  themeProvider.isDark
                      ? Icons.light_mode
                      : Icons.dark_mode_rounded,
                ),
                title: Text(
                  themeProvider.isDark ? "Light" : "Dark",
                ),
                onTap: () {
                  themeProvider.onTapped();
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<ChapterController>(
            builder: (context, provider, child) {
              return provider.allChapter.isNotEmpty
                  ? ListView.builder(
                      itemCount: provider.allChapter.length,
                      itemBuilder: (context, index) {
                        ChapterModel data = provider.allChapter[index];

                        return Card(
                          child: ListTile(
                            onTap: () {
                              provider.currentIndex = 0;
                              Navigator.of(context).pushNamed(
                                  'ch_detail_screen',
                                  arguments: index);
                            },
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: AssetImage(data.img),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            title: Text(pro.isHindi
                                ? data.name
                                : "${data.chapterNumber}. ${data.nameTranslation}"),
                            subtitle: Row(
                              children: [
                                const Icon(Icons.list),
                                Text(pro.isHindi
                                    ? "${data.versesCount} श्लोक "
                                    : "${data.versesCount} Verses"),
                              ],
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      );
    });
  }
}
