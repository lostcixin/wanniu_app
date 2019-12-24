import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover)),
        child: child);
  }
}
