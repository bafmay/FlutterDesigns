import 'package:flutter/material.dart';
import 'package:flutter_design/newyear/models/enviroment_mode.dart';
import 'package:flutter_design/newyear/pages/landscape_page.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'test_tools.dart';

void main() {
  testGoldens('Landscape goldens', (tester) async {
    configureToLookLikeIphone11(tester);
    await tester.pumpWidget(
      _buildLandscape(EnviromentMode.morning),
    );
    await screenMatchesGolden(tester, 'landscape_morning');

    await tester.pumpWidget(
      _buildLandscape(EnviromentMode.afternoon),
    );
    await screenMatchesGolden(tester, 'landscape_afternoon');

    await tester.pumpWidget(
      _buildLandscape(EnviromentMode.evening),
    );
    await screenMatchesGolden(tester, 'landscape_evening');

    await tester.pumpWidget(
      _buildLandscape(EnviromentMode.night),
    );
    await screenMatchesGolden(tester, 'landscape_night');
  });
}

Widget _buildLandscape(EnviromentMode mode) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Landscape(mode: mode),
    ),
  );
}
