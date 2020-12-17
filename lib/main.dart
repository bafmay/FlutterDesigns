import 'package:flutter/material.dart';
import 'package:flutter_design/pages/home_page.dart';
import 'package:flutter_design/utils/anime_ui_colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Designs',
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: AnimeUiColors.background,
          textTheme: GoogleFonts.sourceSansProTextTheme()),
      home: HomePage(),
    );
  }
}
