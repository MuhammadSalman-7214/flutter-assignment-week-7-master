import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(ImplicitAnimationWithSlider());

class ImplicitAnimationWithSlider extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OngoingAnimationByModifyingEndTweenValue(),
    );
  }
}



class OngoingAnimationByModifyingEndTweenValue extends StatefulWidget {
  @override
  _OngoingAnimationState createState() => _OngoingAnimationState();
}

class _OngoingAnimationState extends State<OngoingAnimationByModifyingEndTweenValue> {
  double _newValue = 0;
  Color _newColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
          children: <Widget>[
            Center(
              child: TweenAnimationBuilder(
                tween: ColorTween(begin: Colors.white, end: _newColor),
                duration: Duration(seconds: 2),
                builder: (_, Color color, __) {
                  return ColorFiltered(
                    child: Image.asset('assets/sunflr.png'),
                    colorFilter: ColorFilter.mode(color, BlendMode.modulate),
                  );
                },
              ),
            ),
            Slider.adaptive(
              value: _newValue,
              onChanged: (double value) {
                setState(() {
                  _newValue = value;
                  _newColor = Color.lerp(Colors.white, Colors.red, value);
                });
              },
            ),
          ],
        ),

    );
  }
}