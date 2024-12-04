import 'package:flutter/material.dart';
import 'loginpage.dart'; // Import the LoginPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Start at the LoginPage
      routes: {
        '/': (context) => const LoginPage(), // LoginPage route
      },
      // Fallback for unknown routes
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
      },
    );
  }
}
