import 'package:flutter/material.dart';
import '../constants.dart';

import '../screens/result_page.dart';

class BottomButton extends StatelessWidget {
  final String labelText;
  final Function onTap;

  BottomButton({@required this.labelText, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomButtonColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomButtonHeight,
        padding: EdgeInsets.only(bottom: 20),
        child: Center(
          child: Text(
            labelText,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
