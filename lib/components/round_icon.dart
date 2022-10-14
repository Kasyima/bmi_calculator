import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPress});
  final IconData? icon;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      elevation: 6.0,
      fillColor: Color.fromARGB(255, 57, 59, 82),
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}
