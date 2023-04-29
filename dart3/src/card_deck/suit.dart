sealed class Suit {
  const Suit();
  String get symbol;

  @override
  String toString() => symbol;
}

class Club extends Suit {
  const Club();
  @override
  String get symbol => "♣";
}

class Diamond extends Suit {
  const Diamond();
  @override
  String get symbol => "♦";
}

class Heart extends Suit {
  const Heart();
  @override
  String get symbol => "♥";
}

class Spade extends Suit {
  const Spade();
  @override
  String get symbol => "♠";
}

/// If you forget a subtype you get a compile-time error 🎉
void switchExample(Suit suit) {
  switch (suit) {
    case Club():
      print("Club");
      break;
    case Diamond():
      print("Diamond");
      break;
    case Heart():
      print("Heart");
      break;
    case Spade():
      print("Spade");
      break;
  }
}
