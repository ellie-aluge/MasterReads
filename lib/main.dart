import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:masterreads/Service/authentication.dart';
import 'package:masterreads/constants/colors.dart';
import 'package:masterreads/routes/routes.dart';
import 'package:masterreads/views/home/welcomePage.dart';
import 'package:masterreads/views/login/login_screen.dart';
import 'package:masterreads/views/signUp/register_screen.dart';
import 'package:masterreads/views/user/profilePage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MasterReads',
        theme: ThemeData(
          colorScheme: defaultColorScheme,
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRoutes.generateRoutes,
        initialRoute: AppRoutes.routeInitial,
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const ProfilePage();
    }
    return const LoginPage(title: 'Login UI');
  }
}
