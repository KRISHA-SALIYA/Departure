import 'package:bhagvatgeeta/controller/quote_controller.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../controller/language_controller.dart';
import '../../controller/theme_controller.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic themeProvider = Provider.of<ThemeController>(context);
    dynamic languageProvider = Provider.of<LanguageController>(context);

    return Consumer<QuoteController>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Quote"),
          actions: [
            Visibility(
              visible: provider.canBack,
              child: IconButton(
                onPressed: () {
                  provider.clickPrev();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            Visibility(
              visible: provider.canForward,
              child: IconButton(
                onPressed: () {
                  provider.clickNext();
                },
                icon: const Icon(Icons.arrow_forward_ios),
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
                  languageProvider.isHindi ? 'English' : 'Hindi',
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
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/bg_home.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    languageProvider.isHindi
                        ? provider.allHeadingHindi[provider.currentIndex]
                        : provider.allHeading[provider.currentIndex],
                    style: const TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    languageProvider.isHindi
                        ? provider.allQuotesHindi[provider.currentIndex]
                        : provider.allQuotes[provider.currentIndex],
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
