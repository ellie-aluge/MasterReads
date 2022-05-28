import 'package:flutter/material.dart';
import 'package:masterreads/constants/colors.dart';

Widget buyerBooksCount() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          Text(
            'Books Owned',
            style: TextStyle(
              color: Colors.grey[700],
              fontFamily: 'Poppins',
              fontSize: 21,
            ),
          ),
          const Text(
            '0',
            style: TextStyle(
              color: kPrimaryColor,
              fontFamily: 'Poppins',
              fontSize: 21,
            ),
          ),
        ],
      ),
    ],
  );
}
