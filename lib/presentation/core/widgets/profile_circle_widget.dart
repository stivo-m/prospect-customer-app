import 'package:flutter/material.dart';

class CircleProfileAvatar extends StatelessWidget {
  const CircleProfileAvatar({
    Key? key,
    this.radius = 20,
  }) : super(key: key);
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: radius,
      child: Icon(Icons.person),
    );
  }
}
