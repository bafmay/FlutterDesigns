import 'package:flutter/material.dart';
import 'package:flutter_design/anime/anime_page.dart';
import 'package:flutter_design/linkedin/linkedin_page.dart';

class DesignItem {
  final String option;
  final Widget destWidget;
  DesignItem({this.option, this.destWidget});
}

var optionsData = [
  DesignItem(
    option: 'Anime Design',
    destWidget: AnimePage()
  ),
   DesignItem(
    option: 'Linkedin Design',
    destWidget: LinkedInPage()
  )
];
