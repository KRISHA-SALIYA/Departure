import 'package:bhagvatgeeta/controller/favorite_controller.dart';
import 'package:bhagvatgeeta/controller/language_controller.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../controller/theme_controller.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic themeProvider = Provider.of<ThemeController>(context);
    dynamic languageProvider = Provider.of<LanguageController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite"),
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
                  languageProvider.isHindi ? 'भगवद गीता' : 'Bhagavad Gita',
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: Text(
                languageProvider.isHindi ? 'घर' : 'Home',
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
                languageProvider.isHindi ? 'पसंदीदा' : 'Favorite',
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
                languageProvider.isHindi ? 'विचार' : 'Quotes',
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
                languageProvider.isHindi ? 'English' : 'हिंदी',
              ),
              onTap: () {
                languageProvider.onChange();
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
      body: Consumer<FavoriteController>(builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.all(18),
          child: provider.allFavorite.isNotEmpty
              ? ListView.builder(
                  itemCount: provider.allFavorite.length,
                  itemBuilder: (context, index) {
                    dynamic pro = provider.allFavorite[index];
                    return Card(
                      child: ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                'verse_detail_screen',
                                arguments: index);
                          },
                          leading: const Text("📑"),
                          title: Text(languageProvider.isHindi
                              ? "श्लोक ${pro.verseNumber}"
                              : pro.title),
                          subtitle: Text(languageProvider.isHindi
                              ? "श्लोक पढ़ने के लिए क्लिक करें"
                              : "Click To Read Verse"),
                          trailing: IconButton(
                            onPressed: () {
                              provider.delete(index: index);
                            },
                            icon: const Icon(Icons.delete),
                          )),
                    );
                  },
                )
              : Center(
                  child: Text(languageProvider.isHindi
                      ? "अभी तक कोई पसंदीदा छंद नहीं...!"
                      : "No Favorite Verses Yet...!"),
                ),
        );
      }),
    );
  }
}
