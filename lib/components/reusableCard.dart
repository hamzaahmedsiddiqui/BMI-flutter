import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget childWidget;
  final Function onPress;
  ReusableCard({@required this.colour, this.childWidget, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childWidget,
        decoration: BoxDecoration(
          color: colour, //Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(15),
      ),
    );
  }
}
