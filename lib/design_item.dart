import 'package:flutter/material.dart';
import 'package:flutter_design/anime/anime_page.dart';

class DesignItem {
  final String option;
  final Widget destWidget;
  DesignItem({this.option, this.destWidget});
}

var optionsData = [
  DesignItem(
    option: 'Anime App',
    destWidget: AnimePage()
  ),
   DesignItem(
    option: 'Anime App',
    destWidget: AnimePage()
  ),
   DesignItem(
    option: 'Anime App',
    destWidget: AnimePage()
  )
];
