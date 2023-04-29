/// You cannot do this in Dart 3 🔒
///
/// If you uncomment this you will get the following error (`invalid_use_of_type_outside_library`):
/// ```
/// The class 'Suit' can't be extended, implemented, or mixed in outside of its library
/// because it's a sealed class.
/// ```

// import 'suit.dart';

// class Extra extends Suit {
//   const Extra();
//   @override
//   String get symbol => "🤷🏼‍♂️";
// }