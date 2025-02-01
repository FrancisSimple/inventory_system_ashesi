// import 'dart:math';

// import 'package:ashinventory/pages/dashboard/dash_home.dart';
import 'package:ashinventory/pages/home.dart';
import 'package:ashinventory/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:paged_datatable/paged_datatable.dart';
import 'package:ashinventory/post.dart';
// import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initializeDateFormatting("en");

  PostsRepository.generate(500);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        PagedDataTableLocalization.delegate
      ],
      supportedLocales: const [
        Locale("es"),
        Locale("en"),
        Locale("de"),
        Locale("it"),
      ],
      locale: const Locale("en"),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: ThemeMode.light,
      home: const HomePage(),
    );
  }
}

