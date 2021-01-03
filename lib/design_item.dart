import 'package:flutter/material.dart';
import 'package:flutter_design/anime/anime_page.dart';
import 'package:flutter_design/auth/screen/welcome/welcome_screen.dart';
import 'package:flutter_design/exchange/exchange_page.dart';
import 'package:flutter_design/linkedin/linkedin_page.dart';
import 'package:flutter_design/newyear/newyear_page.dart';

class DesignItem {
  final String option;
  final Widget destWidget;
  DesignItem({this.option, this.destWidget});
}

var optionsData = [
  DesignItem(option: 'Anime Design', destWidget: AnimePage()),
  DesignItem(option: 'Linkedin Design', destWidget: LinkedInPage()),
  DesignItem(option: 'Exchange Design', destWidget: ExchangePage()),
  DesignItem(option: 'New Year Design', destWidget: NewYearPage()),
  DesignItem(option: 'Auth Design', destWidget: WelcomeScreen())
];
