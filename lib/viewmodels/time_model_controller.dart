import '../views/display_time.dart';

class TimeModelController {
  String get text => _text;
  String _text = '';
  set text(String newValue) {
    if (_text == newValue) {
      return;
    }
    _text = newValue;
  }

  late final Function(String newText) updateText;
}