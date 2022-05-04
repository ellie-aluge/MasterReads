import 'package:flutter/material.dart';
import 'package:travelappui/constants/colors.dart';

class ResetForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(color: kTextFieldColor, fontFamily: 'Poppins'),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kAccentColor))),
      ),
    );
  }
}
