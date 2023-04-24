import 'dart:math';

import 'card.dart';
import 'hand.dart';
import 'rank.dart';
import 'suit.dart';

class PickCard {
  final Card card;
  final Deck deck;
  const PickCard(this.card, this.deck);
}

class AssignTurn {
  final Hand hand;
  final Deck deck;
  const AssignTurn(this.hand, this.deck);
}

const List<Card> _deck = [
  // Club
  Card(Club(), Ace()),
  Card(Club(), Two()),
  Card(Club(), Three()),
  Card(Club(), Four()),
  Card(Club(), Five()),
  Card(Club(), Six()),
  Card(Club(), Seven()),
  Card(Club(), Eight()),
  Card(Club(), Nine()),
  Card(Club(), Ten()),
  Card(Club(), Jack()),
  Card(Club(), Queen()),
  Card(Club(), King()),
  // Diamond
  Card(Diamond(), Ace()),
  Card(Diamond(), Two()),
  Card(Diamond(), Three()),
  Card(Diamond(), Four()),
  Card(Diamond(), Five()),
  Card(Diamond(), Six()),
  Card(Diamond(), Seven()),
  Card(Diamond(), Eight()),
  Card(Diamond(), Nine()),
  Card(Diamond(), Ten()),
  Card(Diamond(), Jack()),
  Card(Diamond(), Queen()),
  Card(Diamond(), King()),
  // Heart
  Card(Heart(), Ace()),
  Card(Heart(), Two()),
  Card(Heart(), Three()),
  Card(Heart(), Four()),
  Card(Heart(), Five()),
  Card(Heart(), Six()),
  Card(Heart(), Seven()),
  Card(Heart(), Eight()),
  Card(Heart(), Nine()),
  Card(Heart(), Ten()),
  Card(Heart(), Jack()),
  Card(Heart(), Queen()),
  Card(Heart(), King()),
  // Spade
  Card(Spade(), Ace()),
  Card(Spade(), Two()),
  Card(Spade(), Three()),
  Card(Spade(), Four()),
  Card(Spade(), Five()),
  Card(Spade(), Six()),
  Card(Spade(), Seven()),
  Card(Spade(), Eight()),
  Card(Spade(), Nine()),
  Card(Spade(), Ten()),
  Card(Spade(), Jack()),
  Card(Spade(), Queen()),
  Card(Spade(), King()),
];

class Deck {
  final List<Card> cards;
  const Deck._(this.cards);

  factory Deck.init() => Deck._(_deck);

  PickCard get _pickCard {
    final cardIndex = Random().nextInt(cards.length);
    return PickCard(
      cards[cardIndex],
      Deck._([
        ...cards.sublist(0, cardIndex),
        ...cards.sublist(cardIndex + 1),
      ]),
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

  AssignTurn get assignHand {
    final cardAndDeck = _pickCard;
    final deck1 = cardAndDeck.deck;
    final card1 = cardAndDeck.card;
    if (deck1.isEmpty) {
      return AssignTurn(OneCardHand(card1), deck1);
    }

    final cardAndDeck2 = deck1._pickCard;
    final card2 = cardAndDeck2.card;
    final deck2 = cardAndDeck2.deck;
    if (deck2.isEmpty) {
      return AssignTurn(TwoCardsHand(TwoCards(card1, card2)), deck2);
    }

    final cardAndDeck3 = deck2._pickCard;
    final card3 = cardAndDeck3.card;
    final deck3 = cardAndDeck3.deck;
    return AssignTurn(ThreeCardsHand(ThreeCards(card1, card2, card3)), deck3);
  }

  bool get isEmpty => cards.isEmpty;

  @override
  String toString() => cards.join("\n");
}
