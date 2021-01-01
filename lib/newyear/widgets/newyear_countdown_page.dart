import 'package:flutter/material.dart';
import 'package:flutter_design/newyear/models/enviroment_mode.dart';
import 'package:flutter_design/newyear/pages/landscape_page.dart';
import 'package:flutter_design/newyear/widgets/countdown_text.dart';
import 'package:flutter_design/newyear/widgets/happynewyear_text.dart';
import 'package:intl/intl.dart';

class NewYearCountdownPage extends StatefulWidget {
  NewYearCountdownPage({
    Key key,
    @required this.currentTime,
  }) : super(key: key);
  final DateTime currentTime;

  @override
  _NewYearCountdownPageState createState() => _NewYearCountdownPageState();
}

class _NewYearCountdownPageState extends State<NewYearCountdownPage> {
  final DateTime _newYearDateTime = DateTime.parse('2021-01-01 00:00:00');
  final DateFormat _timeFormat = DateFormat('h:mm:ss a');

  @override
  Widget build(BuildContext context) {
    final secondsToNewYear =
        (_newYearDateTime.difference(widget.currentTime).inMilliseconds / 1000)
            .ceil();
    return Stack(
      children: [
        Landscape(
          mode: _buildEnviromentMode(),
          time: _timeFormat.format(widget.currentTime),
          year: '${widget.currentTime.year}',
        ),
        CountdownText(
          secondsToNewYear: secondsToNewYear,
        ),
        HappyNewYearText(
          secondsToNewYear: secondsToNewYear,
        )
      ],
    );
  }

  EnviromentMode _buildEnviromentMode() {
    final hour = widget.currentTime.hour;
    if (hour > 6 && hour < 11) {
      return EnviromentMode.morning;
    } else if (hour >= 11 && hour < 15) {
      return EnviromentMode.afternoon;
    } else if (hour >= 15 && hour <= 18) {
      return EnviromentMode.evening;
    } else {
      return EnviromentMode.night;
    }
  }
}
