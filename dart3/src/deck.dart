import 'dart:math';

import 'card.dart';
import 'hand.dart';
import 'rank.dart';
import 'suit.dart';

const List<Card> _deck = [
  // Club
  (Club(), Ace()),
  (Club(), Two()),
  (Club(), Three()),
  (Club(), Four()),
  (Club(), Five()),
  (Club(), Six()),
  (Club(), Seven()),
  (Club(), Eight()),
  (Club(), Nine()),
  (Club(), Ten()),
  (Club(), Jack()),
  (Club(), Queen()),
  (Club(), King()),
  // Diamond
  (Diamond(), Ace()),
  (Diamond(), Two()),
  (Diamond(), Three()),
  (Diamond(), Four()),
  (Diamond(), Five()),
  (Diamond(), Six()),
  (Diamond(), Seven()),
  (Diamond(), Eight()),
  (Diamond(), Nine()),
  (Diamond(), Ten()),
  (Diamond(), Jack()),
  (Diamond(), Queen()),
  (Diamond(), King()),
  // Heart
  (Heart(), Ace()),
  (Heart(), Two()),
  (Heart(), Three()),
  (Heart(), Four()),
  (Heart(), Five()),
  (Heart(), Six()),
  (Heart(), Seven()),
  (Heart(), Eight()),
  (Heart(), Nine()),
  (Heart(), Ten()),
  (Heart(), Jack()),
  (Heart(), Queen()),
  (Heart(), King()),
  // Spade
  (Spade(), Ace()),
  (Spade(), Two()),
  (Spade(), Three()),
  (Spade(), Four()),
  (Spade(), Five()),
  (Spade(), Six()),
  (Spade(), Seven()),
  (Spade(), Eight()),
  (Spade(), Nine()),
  (Spade(), Ten()),
  (Spade(), Jack()),
  (Spade(), Queen()),
  (Spade(), King()),
];

class Deck {
  final List<Card> cards;
  const Deck._(this.cards);

  factory Deck.init() => Deck._(_deck);

  (Card, Deck) get _pickCard {
    final cardIndex = Random().nextInt(cards.length);
    return (
      cards[cardIndex],
      Deck._([
        ...cards.sublist(0, cardIndex),
        ...cards.sublist(cardIndex + 1),
      ])
    );
  }

  Deck get shuffle {
    var source = [...cards];
    for (var i = source.length - 1; i > 0; i--) {
      final j = (Random().nextDouble() * (i + 1)).floor();
      final sourceI = source[i];
      source[i] = source[j];
      source[j] = sourceI;
    }

    return Deck._(source);
  }

  (Hand, Deck) get assignHand {
    final (card1, deck1) = _pickCard;

    if (deck1.isEmpty) return (OneCard(card1), deck1);

    final (card2, deck2) = deck1._pickCard;
    if (deck2.isEmpty) return (TwoCards((card1, card2)), deck2);

    final (card3, deck3) = deck2._pickCard;
    return (ThreeCards((card1, card2, card3)), deck3);
  }

  bool get isEmpty => cards.isEmpty;

  @override
  String toString() => cards.join("\n");
}
