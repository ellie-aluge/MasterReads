import 'dart:io';
import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:masterreads/views/checkout/PaypalPayment.dart';
import 'package:masterreads/views/checkout/makePayment.dart';
import 'package:masterreads/views/user/buyerCart.dart';
import 'package:masterreads/views/user/cartVM.dart';
class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paypal Payment'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextButton(
            onPressed: () {
              // lets assume that product price is 5.99 usd
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const PaypalPayment(
              //         amount: 5.99,
              //         currency: 'USD',
              //       ),
              //     ));

              // payment();

              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => payment()
              //     // PaypalPayment(
              //     //   onFinish: (number) async {
              //     //     // payment done
              //     //     print('order id: ' + number);
              //     //   },
              //     // ),
              //   ),
              // );
            },
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.blue),
            ),

            child:Container(
              width: 300,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage('assets/images/paypal.png'),
                    height: 40,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    'Pay with Paypal',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            )

          ),
        ),
      ),
    );
  }
}



