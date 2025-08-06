import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import 'pages/auth/login_screen.dart';
import 'pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Register App',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: AuthService.isLoggedIn() ? const HomeScreen() : const LoginScreen(),
    );
  }
}
