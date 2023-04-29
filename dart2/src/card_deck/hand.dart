import 'card.dart';

class ThreeCards {
  final Card card1;
  final Card card2;
  final Card card3;

  const ThreeCards(this.card1, this.card2, this.card3);
}

class TwoCards {
  final Card card1;
  final Card card2;

  const TwoCards(this.card1, this.card2);
}

abstract class Hand {
  const Hand();

  Hand extractCard(Card card) {
    final hand = this;
    if (hand is ThreeCardsHand) {
      final cards = hand.cards;
      if (cards.card1 == card) {
        return TwoCardsHand(TwoCards(cards.card2, cards.card3));
      } else if (cards.card2 == card) {
        return TwoCardsHand(TwoCards(cards.card1, cards.card3));
      } else if (cards.card3 == card) {
        return TwoCardsHand(TwoCards(cards.card1, cards.card2));
      }

      throw "No matching card! ($card in $cards)";
    } else if (hand is TwoCardsHand) {
      final cards = hand.cards;
      if (cards.card1 == card) {
        return OneCardHand(cards.card2);
      } else if (cards.card2 == card) {
        return OneCardHand(cards.card1);
      }

      throw "No matching card! ($card in $hand)";
    } else if (hand is OneCardHand) {
      final singleCard = hand.card;
      if (singleCard == card) {
        return NoCardHand();
      }

      throw "No matching card! ($card in $this)";
    }

    throw "Well, this should never happen 🤷🏼‍♂️";
  }
}

class ThreeCardsHand extends Hand {
  final ThreeCards cards;
  const ThreeCardsHand(this.cards);
}

class TwoCardsHand extends Hand {
  final TwoCards cards;
  const TwoCardsHand(this.cards);
}

class OneCardHand extends Hand {
  final Card card;
  const OneCardHand(this.card);
}

class NoCardHand extends Hand {
  const NoCardHand();
}
