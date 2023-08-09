import 'package:flutter/material.dart';
import 'package:https/viewmodels/time_model_controller.dart';
import 'display_time.dart';


class TimeView extends StatefulWidget {
  const TimeView({Key? key}) : super(key: key);
  @override
  State<TimeView> createState() => _TimeViewState();
}

class _TimeViewState extends State<TimeView> {
  final DisplayTimeController displayTimeController = DisplayTimeController();
  late Function(String s) changeText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              DisplayTime(
                timeModelController: displayTimeController,
                callback: (Function(String s) callbackFunction) {
                  changeText = callbackFunction;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                      // displayTimeController.updateText(DateTime.now().toString());
                      changeText("Hello");
                  }, child: const Text('Display'))
            ],
          ),
        ),
      ),
    );
  }
}


