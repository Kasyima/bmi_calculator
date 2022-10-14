import 'package:bmi_calculator/components/round_icon.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, this.onPress, this.cardChild});
  final VoidCallback? onPress;
  final Color colour;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}

class ReusablePersonCard extends StatelessWidget {
  ReusablePersonCard(
      {required this.onPressedplus,
      required this.onPressedminus,
      required this.data,
      required this.title});
  final VoidCallback onPressedplus;
  final VoidCallback onPressedminus;
  final int data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: klabelTextStyle,
        ),
        Text(
          data.toString(),
          style: klabel1TextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPress: onPressedminus,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPress: onPressedplus,
            ),
          ],
        )
      ],
    );
  }
}
