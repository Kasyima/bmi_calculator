import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Screens/input_page.dart';
import 'package:bmi_calculator/components/reusable_content.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(this.bmiresult, this.interpretation, this.resultText);
  final String bmiresult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            )),
            Expanded(
                flex: 5,
                child: ReusableCard(
                  colour: kactiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText.toUpperCase(),
                        style: kresultTextStyle,
                      ),
                      Text(
                        bmiresult,
                        style: kBMITextStyle,
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kSolutionTextStyle,
                      ),
                    ],
                  ),
                )),
            BottomButton(
                onPress: () {
                  Navigator.pop(context);
                },
                text: "RE-CALCULATE"),
          ],
        ));
  }
}
