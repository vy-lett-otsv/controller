class TimeModel {
  final String text;

  const TimeModel({this.text = ''});

  static const TimeModel empty = TimeModel();

  TimeModel copyWith({
    String? text,
  }) {
    return TimeModel(
      text: text ?? this.text,
    );
  }
}