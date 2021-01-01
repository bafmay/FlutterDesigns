import 'package:flutter/material.dart';
import 'package:flutter_design/newyear/models/enviroment_mode.dart';

class Landscape extends StatelessWidget {
  const Landscape({Key key, this.mode, this.time = '', this.year = ''})
      : super(key: key);

  final EnviromentMode mode;
  final String time;
  final String year;
  static const switchModeDuration = Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _buildSky(),
      _buildStars(),
      _buildMountains(),
      _buildText()
    ]);
  }

  Widget _buildSky() {
    return AnimatedSwitcher(
      duration: switchModeDuration,
      child: DecoratedBox(
        key: ValueKey(mode),
        decoration: BoxDecoration(gradient: _buildGradient()),
        child: SizedBox.expand(),
      ),
    );
  }

  LinearGradient _buildGradient() {
    switch (mode) {
      case EnviromentMode.morning:
        return morningGradient;
      case EnviromentMode.afternoon:
        return afternoonGradient;
      case EnviromentMode.evening:
        return eveningGradient;
      case EnviromentMode.night:
        return nightGradient;
      default:
        return nightGradient;
    }
  }

  Widget _buildStars() {
    return mode == EnviromentMode.night
        ? Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Image.asset('assets/newyear/stars.png', fit: BoxFit.cover))
        : SizedBox();
  }

  Widget _buildMountains() {
    String mountainImagePath = "";
    switch (mode) {
      case EnviromentMode.morning:
        mountainImagePath = 'assets/newyear/mountains_morning.png';
        break;
      case EnviromentMode.afternoon:
        mountainImagePath = 'assets/newyear/mountains_afternoon.png';
        break;
      case EnviromentMode.evening:
        mountainImagePath = 'assets/newyear/mountains_evening.png';
        break;
      case EnviromentMode.night:
        mountainImagePath = 'assets/newyear/mountains_night.png';
        break;
    }
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: AnimatedSwitcher(
        duration: switchModeDuration,
        child: Image.asset(
          mountainImagePath,
          key: ValueKey(mode),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildText() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 16,
      child: Column(
        mainAxisSize: MainAxisSize.min, //como wrap_content
        children: [
          Text(
            time,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _buildTextColor(),
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            year,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _buildTextColor(),
              fontSize: 52,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  Color _buildTextColor() {
    switch (mode) {
      case EnviromentMode.morning:
        return morningTextColor;
      case EnviromentMode.afternoon:
        return afternoonTextColor;
      case EnviromentMode.evening:
        return eveningTextColor;
      case EnviromentMode.night:
        return nightTextColor;
      default:
        return nightTextColor;
    }
  }
}
