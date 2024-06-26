// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:may_model_exam/controller/firebase_controller.dart';
import 'package:may_model_exam/controller/home_screen_controller.dart';
import 'package:may_model_exam/controller/login_screen_controller.dart';
import 'package:may_model_exam/controller/product_screen_controller.dart';
import 'package:may_model_exam/controller/registrion_screen_controller.dart';
import 'package:may_model_exam/firebase_options.dart';
import 'package:may_model_exam/view/login_screen/home_screen/home_screen.dart';
import 'package:may_model_exam/view/login_screen/login_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegistrationScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FirebaseController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        )
      ],
      child: MaterialApp(
          home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      )),
    );
  }
}
