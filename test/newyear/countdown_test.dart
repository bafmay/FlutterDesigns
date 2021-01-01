import 'package:flutter/material.dart';
import 'package:flutter_design/newyear/newyear_page.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../test_tools.dart';

Future<void> main() async {
  await loadAppFonts();
  testGoldens('new years countdown goldens', (tester) async {
    configureToLookLikeIphone11(tester);

    await tester.pumpWidget(
      _screenForDateTime(DateTime.parse('2020-12-31 23:59:50')),
    );

    await screenMatchesGolden(tester, '10_seconds_to_go');

    await tester.pumpWidget(
      _screenForDateTime(DateTime.parse('2020-12-31 23:59:51')),
    );

    await screenMatchesGolden(tester, '9_seconds_to_go');

    await tester.pumpWidget(
      _screenForDateTime(DateTime.parse('2020-12-31 23:59:59')),
    );

    await screenMatchesGolden(tester, '1_seconds_to_go');

    await tester.pumpWidget(
      _screenForDateTime(DateTime.parse('2021-01-01 00:00:00')),
    );

    await screenMatchesGolden(tester, 'happy_year');
  });
}

Widget _screenForDateTime(DateTime datetime) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NewYearCountdownScreen(
      overrideStartDateTime: datetime,
      doTick: false,
    ),
  );
}
