import 'package:flutter/material.dart';

class RoundButtonCustom extends StatelessWidget {
  RoundButtonCustom({this.icon, this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
    );
  }
}
