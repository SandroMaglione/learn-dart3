import 'dart:convert';
import 'dart:io';

import 'deck.dart';
import 'hand.dart';

void main() {
  final deck = Deck.init();

  Hand hand = NoCard();
  var gameDeck = deck.shuffle;
  assert(gameDeck.cards.length == 52);

  while (true) {
    if (gameDeck.isEmpty) break;

    switch (hand) {
      case NoCard():
        print("Empty, assigning new cards...");
        (hand, gameDeck) = gameDeck.assignHand;
        break;
      case OneCard(card: final pickedCard):
        print("Card: $pickedCard");
        hand = hand.extractCard(pickedCard);
        break;
      case TwoCards(cards: (final card1, final card2)):
        print("Choose between $card1 (1) and $card2 (2)");
        final input = stdin.readLineSync(encoding: utf8);
        if (input == "1") {
          hand = hand.extractCard(card1);
          print("Card: $card1");
          break;
        } else if (input == "2") {
          hand = hand.extractCard(card2);
          print("Card: $card2");
          break;
        }

        print("Only 1 or 2 allowed");
        break;
      case ThreeCards(cards: (final card1, final card2, final card3)):
        print("Choose between $card1 (1) and $card2 (2) and $card3 (3)");
        final input = stdin.readLineSync(encoding: utf8);
        if (input == "1") {
          hand = hand.extractCard(card1);
          print("Card: $card1");
          break;
        } else if (input == "2") {
          hand = hand.extractCard(card2);
          print("Card: $card2");
          break;
        } else if (input == "3") {
          hand = hand.extractCard(card3);
          print("Card: $card3");
          break;
        }

        print("Only 1 or 2 or 3 allowed");
        break;
    }
  }

  print("End!");
}
