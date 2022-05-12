import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:masterreads/constants/colors.dart';
import 'package:masterreads/routes/routes.dart';
import 'package:masterreads/views/home/welcomePage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MasterReads',
      theme: ThemeData(
        colorScheme: defaultColorScheme,
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRoutes.generateRoutes,
      initialRoute: AppRoutes.routeInitial,
    );
  }
}
