import 'package:flutter/material.dart';
import 'package:flutter_design/newyear/widgets/newyear_countdown_page.dart';
import 'package:flutter_design/newyear/widgets/time_lapse.dart';

class NewYearPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happy New Year!',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NewYearCountdownScreen(
        overrideStartDateTime: DateTime.parse('2020-12-31 23:59:55'),
        doTick: true,
      ),
    );
  }
}

class NewYearCountdownScreen extends StatelessWidget {
  final DateTime overrideStartDateTime;
  final bool doTick;

  NewYearCountdownScreen({
    Key key,
    this.overrideStartDateTime,
    this.doTick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TimeLapse(
        overrideStartDateTime: overrideStartDateTime,
        doTick: doTick,
        dateTimeBuilder: (DateTime currentTime) {
          return NewYearCountdownPage(
            currentTime: currentTime,
          );
        },
      ),
    );
  }
}
