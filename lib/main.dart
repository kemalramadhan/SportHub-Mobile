import 'package:flutter/material.dart';
import 'package:sporthub/firebase_options.dart';
import 'package:sporthub/view/login/login_checker.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SportHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Quicksand",
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(252, 163, 17, 255)),
        useMaterial3: false,
      ),
      home: const LoginChecker(),
    );
  }
}
