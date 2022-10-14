import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/calculator_brain.dart';
import 'package:bmi_calculator/Screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../components/icon_content.dart';
import '../components/reusable_content.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male
                            ? kactiveCardColour
                            : kinactiveCardColour,
                        cardChild: CardChild(
                            fontType: FontAwesomeIcons.mars,
                            genderType: 'MALE')),
                  ),
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? kactiveCardColour
                            : kinactiveCardColour,
                        cardChild: CardChild(
                            fontType: FontAwesomeIcons.venus,
                            genderType: 'FEMALE')),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: klabel1TextStyle,
                      ),
                      Text(
                        'cm',
                        style: klabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xFFeb1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color.fromARGB(158, 182, 152, 152),
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour: kactiveCardColour,
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardChild: ReusablePersonCard(
                        onPressedminus: () {
                          setState(() {
                            weight--;
                          });
                        },
                        onPressedplus: () {
                          setState(() {
                            weight++;
                          });
                        },
                        data: weight,
                        title: 'WEIGHT',
                      ),
                      colour: kactiveCardColour,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: ReusablePersonCard(
                        onPressedminus: () {
                          setState(() {
                            age--;
                          });
                        },
                        onPressedplus: () {
                          setState(() {
                            age++;
                          });
                        },
                        data: age,
                        title: 'AGE',
                      ),
                      colour: kactiveCardColour,
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
                onPress: () {
                  CalculatorBrain calc = CalculatorBrain(
                    height: height,
                    weight: weight,
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ResultsPage(
                      calc.calculateBMI(),
                      calc.getresult(),
                      calc.getInterpretation(),
                    );
                  }));
                },
                text: "CALCULATE")
          ],
        ));
  }
}
