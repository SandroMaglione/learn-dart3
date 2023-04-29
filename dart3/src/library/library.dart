part 'library_part.dart';

/// Since this class is `sealed`, you are allowed
/// to extended, implemented, or mixin only inside **the same library**.
///
/// What does it mean "in the same library"?
///
/// In `no_library.dart` you get an error if you try to extend `Library`, because
/// `no_library.dart` is not part of the same library of `library.dart`:
/// ```
/// The class 'Library' can't be extended, implemented, or mixed in outside of its library because it's a sealed class.
/// ```
///
/// If you want another file to be in the same library, you need to use `part` and `part of`.
///
/// In `library_part.dart` we use `part of` to assign the file to the same library of `library.dart`
/// (which uses `part`).
///
/// By doing this, the 2 files are in the same library, and so you can use `extends` 🎯
sealed class Library {}
