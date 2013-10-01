
Card[] hand = new Card[11];
PImage[] pics = new PImage[11];
int numCardsInHand = 2;
int numCardsDealerHand = 2;
BlackjackGame myGame = new BlackjackGame();
PImage backOfCard;
ArrayList<Card> myHand = myGame.getHand();
ArrayList<Card> dealerHand = myGame.getDealerHand();


final int hitButtonTopX = 100;
final int hitButtonTopY = 100;
final int hitButtonSide = 100;
final int stayButtonTopX = 400;
final int stayButtonTopY = 100;
final int stayButtonSide = 100;
int currentHandCoordinate = 225;

void setup() {
  size(600, 600);
  drawBackground();
  getCards(myHand);
  drawOnScreen();
  drawDealerHand();
  colorMode(RGB,1000,1000,1000);
  color clOne = color(1000,1000,1000);
  color clTwo = color (30,30,30);
  color buttonColor = lerpColor (clOne,clTwo,.33543);
  fill(buttonColor);
  rect (hitButtonTopX,hitButtonTopY,hitButtonSide,hitButtonSide);
  rect(stayButtonTopX,stayButtonTopY,stayButtonSide,stayButtonSide);

}

void draw() {
}

void drawBackground() {
  fill(100,65,8);
  rect(0,0,width,height);
  fill(14,122,32);
  rect(50,50,width-100,height-100);
}



void getCards(ArrayList<Card> yourHand) {
  for (int i = 0; i < yourHand.size(); i++) {
    hand[i] = yourHand.get(i);
    pics[i] = loadImage("cardImages/" + yourHand.get(i)+".png");
  }
}

void drawOnScreen() {
  for (int i = 0; i < numCardsInHand; i++) {
    image(pics[i], currentHandCoordinate+i*72, 7*height/10);
  }
}

void drawDealerHand() {
  for (int i = 0; i < numCardsDealerHand; i++) {
    backOfCard = loadImage("cardImages/BACKREDTALL.png");
    image(backOfCard,50,50);
  
  }
  
}

void hitMe() {
  myGame.dealOrNoDeal();
  numCardsInHand++;
  getCards(this.myHand);
  currentHandCoordinate = currentHandCoordinate -31;
  drawOnScreen();
}


void mousePressed() {
  if (mouseX < hitButtonTopX+hitButtonSide && mouseX > hitButtonTopX && mouseY > hitButtonTopY && mouseY < hitButtonTopY + hitButtonSide)
  hitMe();
}
