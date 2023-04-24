import 'card.dart';

sealed class Hand {
  const Hand();

  Hand extractCard(Card card) => switch (this) {
        ThreeCards(cards: final cards) => switch (cards) {
            (final c1, final c2, final c3) when c1 == card =>
              TwoCards((c2, c3)),
            (final c1, final c2, final c3) when c2 == card =>
              TwoCards((c1, c3)),
            (final c1, final c2, final c3) when c3 == card =>
              TwoCards((c1, c2)),
            _ => throw "No matching card! ($card in $cards)"
          },
        TwoCards(cards: final cards) => switch (cards) {
            (final c1, final c2) when c1 == card => OneCard((c2)),
            (final c1, final c2) when c2 == card => OneCard((c1)),
            _ => throw "No matching card! ($card in $cards)"
          },
        OneCard(card: final singleCard) when singleCard == card => NoCard(),
        _ => throw "No matching card! ($card in $this)",
      };
}

class ThreeCards extends Hand {
  final (Card, Card, Card) cards;
  const ThreeCards(this.cards);
}

class TwoCards extends Hand {
  final (Card, Card) cards;
  const TwoCards(this.cards);
}

class OneCard extends Hand {
  final Card card;
  const OneCard(this.card);
}

class NoCard extends Hand {
  const NoCard();
}
