import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.route,
      routes: {
        Home.route: (context) => const Home(),
      },
    );
  }
}
