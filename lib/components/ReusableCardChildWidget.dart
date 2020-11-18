import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableCardChildWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color contentColour;

  ReusableCardChildWidget(
      {@required this.icon,
      @required this.label,
      @required this.contentColour});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
          color: contentColour,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: kLabelStyle,
        ),
      ],
    );
  }
}
