import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    required this.onPress,
    required this.text,
  });
  final VoidCallback onPress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: klargeButtonTextStyle,
          ),
        ),
        color: kbottomContainerColor,
        padding: EdgeInsets.only(
          bottom: 20,
        ),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height:
            kbottomContainerHeight, // give a value equal to the screen(any).
      ),
    );
  }
}
