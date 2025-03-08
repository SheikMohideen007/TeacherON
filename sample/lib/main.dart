import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/home.dart';
import 'package:sample/sample2.dart';
import 'package:sample/sample3.dart';
import 'package:sample/sample4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 123',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme()),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/home': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        '/sample2': (context) => Sample2(),
        '/sample3': (context) => Sample3(str: "Default"),
        '/sample4': (context) => Sample4(),
      },
    );
  }
}
