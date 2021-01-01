import 'package:flutter/material.dart';

class CountdownText extends StatefulWidget {
  CountdownText({Key key, this.secondsToNewYear}) : super(key: key);
  final int secondsToNewYear;

  @override
  _CountdownTextState createState() => _CountdownTextState();
}

class _CountdownTextState extends State<CountdownText>
    with SingleTickerProviderStateMixin {
  AnimationController _showNumberController;
  Interval _opacity = Interval(0.0, 0.4);
  Interval _scale = Interval(0.0, 0.5, curve: Curves.elasticOut);
  int _displayNumber;

  @override
  void initState() {
    super.initState();
    _showNumberController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {});
      });

    _displayNumber = widget.secondsToNewYear;
    if (_isCountDown()) {
      _showNumberController.forward();
    }
  }

  @override
  void didUpdateWidget(CountdownText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.secondsToNewYear != _displayNumber) {
      _displayNumber = widget.secondsToNewYear;
      if (_isCountDown()) {
        _showNumberController.forward(from: 0.0);
      }
    }
  }

  @override
  void dispose() {
    _showNumberController.dispose();
    super.dispose();
  }

  bool _isCountDown() =>
      widget.secondsToNewYear != null &&
      widget.secondsToNewYear <= 9 &&
      widget.secondsToNewYear > 0;

  @override
  Widget build(BuildContext context) {
    if (!_isCountDown()) {
      return SizedBox();
    }

    return Align(
      alignment: Alignment(0.0, -0.3),
      child: Transform.scale(
        scale: _scale.transform(_showNumberController.value),
        child: Opacity(
          opacity: _opacity.transform(_showNumberController.value),
          child: Text(
            '${widget.secondsToNewYear}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 240,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
