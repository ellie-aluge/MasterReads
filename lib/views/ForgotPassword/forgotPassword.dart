import 'package:flutter/material.dart';
import 'package:travelappui/constants/colors.dart';
import 'package:travelappui/theme.dart';
import 'package:travelappui/views/ForgotPassword/reset_form.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
              ),
              Text(
                'Reset Password',
                style: titleText.copyWith(fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Please enter your email address',
                style: subTitle.copyWith(
                    fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 10,
              ),
              ResetForm(),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                  child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Reset Password',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
                style: ElevatedButton.styleFrom(
                  primary: kAccentColor,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
