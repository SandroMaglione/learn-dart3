import 'suit.dart';

/// This works in Dart 2, since the class is not `sealed`
class Extra extends Suit {
  const Extra();
  @override
  String get symbol => "🤷🏼‍♂️";
}
