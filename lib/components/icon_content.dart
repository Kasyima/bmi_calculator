import 'package:flutter/material.dart';

import '../constants.dart';

class CardChild extends StatelessWidget {
  late final IconData fontType;
  late final String genderType;
  CardChild({required this.fontType, required this.genderType});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          fontType,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(genderType, style: klabelTextStyle)
      ],
    );
  }
}
