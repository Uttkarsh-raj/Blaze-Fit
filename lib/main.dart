import 'package:blaze_fit/screens/AuthPage/main_auth.dart';
import 'package:blaze_fit/screens/FormPage/form_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'ProductSans',
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ), // Apply the custom TextStyle
          // You can also apply the custom font to other text styles if needed
        ),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const MainAuthPage(),
      // home: const FormPage(),
    );
  }
}
