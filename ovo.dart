import 'package:flutter/material.dart';
import 'package:ovo_slicing/mainscreen.dart';

void main() => runApp(const OvoApp());

const kPurple = Color(0xFF4C2A9A);
const kPurpleButton = Color(0xFF5B2BD9);
const kPurpleLight = Color(0xFFE3DDF7);

class OvoApp extends StatelessWidget {
  const OvoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OVO',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: kPurpleButton),
      ),
      home: const MainScreen(),
    );
  }
}