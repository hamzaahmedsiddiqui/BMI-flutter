import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusableCard.dart';
import 'package:bmi_calculator/components/ReusableCardChildWidget.dart';
import '../constants.dart';
import '../components/enums.dart';
import '../components/roundButtonCustom.dart';
import 'result_page.dart';
import '../components/bottomButton.dart';
import '../bmiBrain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int heightValue = 150;
  int weightValue = 33;
  int age = 12;
  double bmi;
  double bmiResult;
  int interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: kUnselectedCardColour,
                    childWidget: ReusableCardChildWidget(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                      contentColour: selectedGender == Gender.male
                          ? kSelectedCardContentColour
                          : kUnselectedCardContentColour,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: kUnselectedCardColour,
                    childWidget: ReusableCardChildWidget(
                        icon: FontAwesomeIcons.venus,
                        label: 'Female',
                        contentColour: selectedGender == Gender.female
                            ? kSelectedCardContentColour
                            : kUnselectedCardContentColour),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kUnselectedCardColour,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        heightValue.toString(),
                        style: kHeightLabelStyle,
                      ),
                      Text('cm', style: kLabelStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kSliderThumbColour,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      overlayColor: kOverlayColor,
                      inactiveTrackColor: kInactiveTrackColor,
                      activeTrackColor: Colors.white,
                    ),
                    child: Slider(
                      value: heightValue.toDouble(),
                      min: 50.0,
                      max: 200.0,
                      onChanged: (double newValue) {
                        setState(() {
                          heightValue = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kUnselectedCardColour,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelStyle,
                        ),
                        Text(
                          weightValue.toString(),
                          style: kHeightLabelStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButtonCustom(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weightValue++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundButtonCustom(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(
                                  () {
                                    weightValue > 5
                                        ? weightValue--
                                        : weightValue; // ignore: unnecessary_statements
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kUnselectedCardColour,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kHeightLabelStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButtonCustom(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundButtonCustom(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(
                                  () {
                                    // ignore: unnecessary_statements
                                    age > 1 ? age-- : age;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            labelText: 'CALCULATE YOUR BMI',
            onTap: () {
              BmiBrain calBmi = BmiBrain(
                  weight: weightValue.toDouble(),
                  height: heightValue.toDouble(),
                  age: age);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    bmi: calBmi.calculateBMI(),
                    bmiResult: calBmi.getResult(),
                    interpretation: calBmi.getInterpretation(),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
