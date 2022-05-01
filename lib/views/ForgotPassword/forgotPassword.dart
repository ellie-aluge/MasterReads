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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/library.jpg'),
                      fit: BoxFit.fill)),
            ),
            //     child: Stack(
            //       children: <Widget>[
            //         Positioned(
            //           left: 30,
            //           width: 80,
            //           height: 250,
            //           child:
            //               Container(
            //                 decoration: const BoxDecoration(
            //                     image: DecorationImage(
            //                         image: AssetImage(
            //                             'assets/image/light-1.png'))),
            //               )),
            // Positioned(
            //   left: 140,
            //   width: 80,
            //   height: 150,
            //   child:
            //       Container(
            //         decoration: const BoxDecoration(
            //             image: DecorationImage(
            //                 image: AssetImage(
            //                     'assets/image/light-2.png'))),
            //       )),
            // Positioned(
            //   right: 40,
            //   top: 40,
            //   width: 80,
            //   height: 150,
            //   child:
            //       Container(
            //         decoration: const BoxDecoration(
            //             image: DecorationImage(
            //                 image: AssetImage(
            //                     'assets/image/clock.png'))),
            //       )),
            // Positioned(
            //   child:
            //       Container(
            //         margin: const EdgeInsets.only(top: 50),
            //         child: const Center(
            //           child: Text(
            //             "Login",
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 40,
            //                 fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //       )),
            //   ],
            // ),
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
    );
  }
}
