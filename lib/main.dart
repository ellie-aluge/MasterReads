import 'package:flutter/material.dart';
import 'package:masterreads/constants/colors.dart';
import 'package:masterreads/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
