

import 'package:coantact_diary/Providers/contact_provider.dart';
import 'package:coantact_diary/Providers/counter_provider.dart';
import 'package:coantact_diary/views/hidden_page.dart';
import 'package:coantact_diary/views/homepage.dart';
import 'package:coantact_diary/views/intro.dart';
import 'package:provider/provider.dart';
import 'package:coantact_diary/views/add_contact.dart';
import 'package:coantact_diary/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'views/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isvisited = preferences.getBool('IsIntroVisited') ?? false;
  runApp(MultiProvider(
    providers: [
      ListenableProvider(create: (context) => Counterprovider()),
      ListenableProvider(create: (context) => Contactprovider()),
      ChangeNotifierProvider(create: (context)=> Contactprovider()),
    ],
    builder: (context, _) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lighttheme,
      darkTheme: darktheme,
      themeMode: ThemeMode.system,
      initialRoute: (isvisited) ? 'home' : "/",
      routes: {
        '/': (context) => Intro_screen(),
        'home': (context) => Home(),
        'add_contact': (context) => add_contact(),
        'homepage': (context) => homepage(),
        'hiddencontact': (context) => hiddencontact(),
      },
    ),
  ));
}
