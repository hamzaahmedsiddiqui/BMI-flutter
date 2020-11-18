import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../constants.dart';
import '../components/reusableCard.dart';
import '../components/bottomButton.dart';
import '../components/bottomButton.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String bmiResult;
  final String interpretation;

  ResultPage(
      {@required this.bmi,
      @required this.bmiResult,
      @required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'your result',
              style: kResultLabelStyle,
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kResultCardColour,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiResult,
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF22D073),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmi,
                    style: kResultText,
                  ),
                  Text(
                    'Normal BMI range:',
                    style: kLabelStyle,
                  ),
                  Text(
                    '18.5 - 25 kg/m2',
                    style: kWhiteLabelStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kResultMessage,
                  ),
                  GestureDetector(
                    child: Container(
                      color: kSaveResultButtonColour,
                      constraints: BoxConstraints(
                          minHeight: 70,
                          maxWidth: MediaQuery.of(context).size.width - 100),
                      child: Center(
                        child: Text('Save Result', style: kWhiteLabelStyle),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            labelText: 'RE-CALCULATE YOUR BMI',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
