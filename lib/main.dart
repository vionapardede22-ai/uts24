import 'package:flutter/material.dart';
import 'pages/registration_page.dart';


void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Toko Pisang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color(0xFFFDF4FF),
        useMaterial3: true,
      ),
      home: const RegistrationPage(),
    );
  }
}
