import 'package:flutter/material.dart';
import 'package:https/views/test_screen.dart';
class HelloTest extends StatefulWidget {
  const HelloTest({Key? key}) : super(key: key);

  @override
  State<HelloTest> createState() => _HelloTestState();
}

class _HelloTestState extends State<HelloTest> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TestScreen(),
    );
  }
}
