import 'package:flutter/material.dart';
import 'package:photogram/app_sizing.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: const Text("Welcome Home"),
      )),
    );
  }
}
