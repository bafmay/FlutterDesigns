
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/anime/pages/anime_home_page.dart';
import 'package:flutter_design/anime/utils/anime_ui_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: AnimeUiColors.background,
          textTheme: GoogleFonts.sourceSansProTextTheme()),
      home: AnimeHomePage(),
    );
  }
}