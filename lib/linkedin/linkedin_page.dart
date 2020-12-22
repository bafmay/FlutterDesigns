import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/linkedin/pages/home/linkedin_home_page.dart';
import 'package:flutter_design/linkedin/providers/menu_options.dart';
import 'package:flutter_design/linkedin/utils/linkedin_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LinkedInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuOptionsInfo(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.montserratTextTheme(),
          scaffoldBackgroundColor: LinkedInColors.background
        ),
        home: HomePage(),
      ),
    );
  }
}
