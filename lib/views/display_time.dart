import 'package:flutter/material.dart';
import 'package:https/viewmodels/time_model_controller.dart';

class DisplayTimeController{
  late final Function(String newText) updateText;
}

class DisplayTime extends StatefulWidget {
  final DisplayTimeController timeModelController;
  final Function(Function(String s)) callback;
  const DisplayTime({Key? key,
    required this.timeModelController,
    required this.callback
  }) : super(key: key);
  @override
  DisplayTimeState createState() => DisplayTimeState();
}

class DisplayTimeState extends State<DisplayTime> {

  String  text = '';

  @override
  void initState() {
    widget.callback(changeText);
    widget.timeModelController.updateText = changeText;
    super.initState();
  }

  void changeText(String newText){
    setState(() {
      text = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
