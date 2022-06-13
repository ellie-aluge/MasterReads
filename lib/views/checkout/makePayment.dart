import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:masterreads/views/user/books/home_screen/components/library.dart';
import 'package:masterreads/views/user/books/home_screen/components/userLibrary.dart';
import 'package:masterreads/views/user/buyerCart.dart';
 double cost=4;
 String id='';
 Cart cart= new Cart();
Future<void> payment(double amount, String bookID) async {
     cost= amount;


  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
  "pk_test_51L7gEWHCNwHv6amdoazGLKNAE80S8wJcwcBLLqTpyrMyAB8UUVVTjrPRygbd89a3REo6Mwu735CVLBWYNzZ0Myuj00pClhmSwT";
  await Stripe.instance.applySettings();
  setpayment(amount, bookID);
  runApp( StripePay(amount:amount, bookID:bookID));
}

Future<void> setpayment(double amount, String bookID) async {
   cost= amount;

   id=bookID;

}

String getID()  {
  return id;


}

double getpayment()  {
  print(cost);

  return cost;

}
double a=0;

class StripePay extends StatefulWidget {

   const StripePay( {Key? key, required this.amount, required this.bookID}) : super(key: key);

 final double amount;
 final String bookID;
  @override

  State<StripePay> createState() => _StripePayState(amount, bookID);

}

class _StripePayState extends State<StripePay> {
  _StripePayState(double amount, String bookID);


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Payment',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home:  PaymentPage(),
    );

  }
}

class PaymentPage extends StatelessWidget {
   PaymentPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    Future<void> initPaymentSheet(context, {required String bookID,required String email, required double amount}) async {
      try {
        // 1. create payment intent on the server
        final response = await http.post(
            Uri.parse(
                'https://us-central1-masterreads-c40b2.cloudfunctions.net/stripePaymentIntentRequest'),
            body: {
              'email': email,
              'amount': amount.toString(),
            });


        final jsonResponse = jsonDecode(response.body);
        log(jsonResponse.toString());

        //2. initialize the payment sheet
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: jsonResponse['paymentIntent'],
            merchantDisplayName: 'Flutter Stripe Store Demo',
            customerId: jsonResponse['customer'],
            customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
            style: ThemeMode.light,
            testEnv: true,
            merchantCountryCode: 'USD',
          ),
        );

        await Stripe.instance.presentPaymentSheet();


        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Payment completed!')),

        );
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => eLibrary(bookid:bookID)));

        } catch (e) {
        if (e is StripeException) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error from Stripe: ${e.error.localizedMessage}'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () async {
                  // lets assume that product price is 5.99 usd
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const PaypalPayment(
                  //         amount: 5.99,
                  //         currency: 'USD',
                  //       ),
                  //     ));
                  // double cost=30;


                  await initPaymentSheet(context, email: "example@gmail.com", amount: getpayment()*100, bookID: getID());

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
                  MaterialStateProperty.resolveWith((states) => Colors.purple.shade600),
                ),

                child:Container(
                  width: 300,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('assets/images/stripe.jpeg'),
                        height: 40,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'Pay',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )

            ),

            // ElevatedButton(
            //   style: ButtonStyle(
            //     foregroundColor: MaterialStateProperty.all<Color>(Colors.purple.shade400),
            //   ),
            //   onPressed: () async {
            //     await initPaymentSheet(context, email: "example@gmail.com", amount: 200000);
            //   },
            //   child: const Text(
            //     'pay',
            //     style: TextStyle(color: Colors.white),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
