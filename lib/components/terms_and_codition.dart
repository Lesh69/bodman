import 'package:bodman/constants.dart';
import 'package:flutter/material.dart';

class Terms extends StatefulWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  bool condition = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            checkColor: Color.fromARGB(255, 255, 255, 255),
            value: condition,
            onChanged: (bool? value) {
              setState(() {
                condition = value!;
              });
            }),
        Text(
          'accept terms & conditions',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: 'Aileron',
              fontSize: 15,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1),
        )
      ],
    );
  }
}
