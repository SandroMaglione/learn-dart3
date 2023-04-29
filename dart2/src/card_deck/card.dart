import 'rank.dart';
import 'suit.dart';

class Card {
  final Suit suit;
  final Rank rank;

  const Card(this.suit, this.rank);

  @override
  String toString() => "($suit, $rank)";
}
