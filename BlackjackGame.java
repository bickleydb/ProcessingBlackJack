import javax.swing.*;
import java.awt.*;
import java.io.File;
import java.util.*;

public class BlackjackGame extends JFrame {

  private Deck deck;
  private Hand hand;
  private Hand dealerHand;

  public BlackjackGame() {
    super("Welcome to Blackjack!");


    deck = new Deck();
    hand = new Hand();
    dealerHand = new Hand();


    deck.shuffle();
    hand.addCard(this.deck.deal());
    dealerHand.addCard(this.deck.deal());
    hand.addCard(this.deck.deal());
    dealerHand.addCard(this.deck.deal());
    updateScore();
  }

  private void addCardsToPanel(Hand h, JPanel p, boolean showFirst) {

    for (int i = 0; i < h.size(); i++) {
      String cardName = "cardImages/" + h.getCard(i).toString() + ".png";

      if (i == 0 && !showFirst) {
        cardName = "cardImages/BACKREDTALL.png";
      }
    }
  }
  
  public ArrayList<Card> getHand() {
    return this.hand.getHand();
  }
  
  public ArrayList<Card> getDealerHand() {
    return this.dealerHand.getHand();
  }
  
  public void dealOrNoDeal() {
    this.hand.addCard(this.deck.deal());
    
    
  }

  private void updateScore() {
    String message = "";
    if (hand.hasBlackjack())
      message = "BLACKJACK!";
    else
      message = "Your score is " + hand.getTotal();
  }

  public static void main(String[] args) {
    BlackjackGame game = new BlackjackGame();
    game.pack();
    game.setLocationRelativeTo(null);
  }
}

