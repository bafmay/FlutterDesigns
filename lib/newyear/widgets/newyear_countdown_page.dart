import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
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

class _NewYearCountdownPageState extends State<NewYearCountdownPage>
    with SingleTickerProviderStateMixin {
  final DateTime _newYearDateTime = DateTime.parse('2021-01-01 00:00:00');
  final DateFormat _timeFormat = DateFormat('h:mm:ss a');
  final List<ConfettiController> _fireworksControllers = [];
  final List<DateTime> _fireworksStartTimes = [];
  final List<Alignment> _fireworksAligments = [];
  Timer _generateMoreFireworksTimer;
  AnimationController _mountainFlashController;

  @override
  void initState() {
    super.initState();
    _mountainFlashController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void didUpdateWidget(NewYearCountdownPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentTime.year != widget.currentTime.year) {
      _doFireworks();
    }
  }

  @override
  void dispose() {
    _generateMoreFireworksTimer?.cancel();
    _mountainFlashController.dispose();
    for (final controller in _fireworksControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _doFireworks() async {
    if (_fireworksControllers.length < 25) {
      final newController =
          ConfettiController(duration: Duration(milliseconds: 1000))..play();
      _fireworksControllers.add(newController);
      _fireworksStartTimes.add(DateTime.now());

      final random = Random();
      final alignHorizontal = (random.nextDouble() * 2.0) - 1;
      final alignVertical = (random.nextDouble() * -0.5) - 0.5;
      _fireworksAligments.add(Alignment(alignHorizontal, alignVertical));

      _mountainFlashController.reverse(from: 1.0);

      if (mounted) {
        final randomTime = Random().nextInt(2000);
        _generateMoreFireworksTimer = Timer(
            Duration(
              milliseconds: randomTime,
            ), () {
          if (mounted) {
            _doFireworks();
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final secondsToNewYear =
        (_newYearDateTime.difference(widget.currentTime).inMilliseconds / 1000)
            .ceil();
    return Stack(
      children: [
        Landscape(
          mode: _buildEnviromentMode(),
          fireworks: _buildFireworks(),
          time: _timeFormat.format(widget.currentTime),
          year: '${widget.currentTime.year}',
          flashPercent: _mountainFlashController.value,
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

  Widget _buildFireworks() {
    final availableColors = [Colors.blue, Colors.red, Colors.white];
    final colorIndex = Random().nextInt(3);
    final color = availableColors[colorIndex];
    final fireworks = <Widget>[];

    for (var i = 0; i < _fireworksControllers.length; i++) {
      fireworks.add(Align(
        alignment: _fireworksAligments[i],
        child: ConfettiWidget(
          confettiController: _fireworksControllers[i],
          displayTarget: false,
          blastDirectionality: BlastDirectionality.explosive,
          blastDirection: 2 * pi,
          colors: [color],
          minimumSize: Size(1, 1),
          maximumSize: Size(5, 5),
          minBlastForce: 0.001,
          maxBlastForce: 0.0011,
          gravity: 0.1,
          particleDrag: 0.1,
          numberOfParticles: 35,
          emissionFrequency: 0.00000001,
          shouldLoop: false,
        ),
      ));
    }
    return Stack(children: fireworks);
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
