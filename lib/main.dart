import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techfinix/constants.dart';
import 'package:techfinix/screens/Bottom%20Nav%20Bar/bottom_nav_bar.dart';
import 'package:techfinix/screens/Login/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Techfinix',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: color1),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
