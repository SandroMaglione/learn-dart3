import 'dart:convert';
import 'dart:io';

import 'deck.dart';
import 'hand.dart';

void main() {
  final deck = Deck.init();

  Hand hand = NoCardHand();
  var gameDeck = deck.shuffle;
  assert(gameDeck.cards.length == 52);

  while (true) {
    if (gameDeck.isEmpty) break;

    if (hand is NoCardHand) {
      print("Empty, assigning new cards...");
      final assignTurn = gameDeck.assignHand;
      gameDeck = assignTurn.deck;
      hand = assignTurn.hand;
      continue;
    } else if (hand is OneCardHand) {
      final pickedCard = hand.card;
      hand = hand.extractCard(pickedCard);
      continue;
    } else if (hand is TwoCardsHand) {
      final card1 = hand.cards.card1;
      final card2 = hand.cards.card2;

      print("Choose between $card1 (1) and $card2 (2)");
      final input = stdin.readLineSync(encoding: utf8);
      if (input == "1") {
        hand = hand.extractCard(card1);
        print("Card: $card1");
        continue;
      } else if (input == "2") {
        hand = hand.extractCard(card2);
        print("Card: $card2");
        continue;
      }

      print("Only 1 or 2 allowed");
      continue;
    } else if (hand is ThreeCardsHand) {
      final card1 = hand.cards.card1;
      final card2 = hand.cards.card2;
      final card3 = hand.cards.card3;

      print("Choose between $card1 (1) and $card2 (2) and $card3 (3)");
      final input = stdin.readLineSync(encoding: utf8);
      if (input == "1") {
        hand = hand.extractCard(card1);
        print("Card: $card1");
        continue;
      } else if (input == "2") {
        hand = hand.extractCard(card2);
        print("Card: $card2");
        continue;
      } else if (input == "3") {
        hand = hand.extractCard(card3);
        print("Card: $card3");
        continue;
      }

      print("Only 1 or 2 or 3 allowed");
      continue;
    }
  }

  print("End!");
}
