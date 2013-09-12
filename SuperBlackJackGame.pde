
Card[] hand = new Card[11];
PImage[] pics = new PImage[11];
int numCardsInHand = 2;
BlackjackGame myGame = new BlackjackGame();
ArrayList<Card> myHand = myGame.getHand();

final int hitButtonTopL = 100;
final int hitButtonSide = 100;

void setup() {
  size(600, 600);
  background(0);
  getCards(myHand);
  drawOnScreen();
  colorMode(RGB,1000,1000,1000);
  color clOne = color(1000,1000,1000);
  color clTwo = color (30,30,30);
  color buttonColor = lerpColor (clOne,clTwo,.33543);
  fill(buttonColor);
  rect (hitButtonTopL,hitButtonTopL,hitButtonSide,hitButtonSide);

}

void draw() {
}



void getCards(ArrayList<Card> yourHand) {
  for (int i = 0; i < yourHand.size(); i++) {
    hand[i] = yourHand.get(i);
    pics[i] = loadImage("cardImages/" + yourHand.get(i)+".png");
  }
}

void drawOnScreen() {
  for (int i = 0; i < numCardsInHand; i++) {
    image(pics[i], i*72, height/2);
  }
}

void hitMe() {
  myGame.dealOrNoDeal();
  numCardsInHand++;
  getCards(this.myHand);
  drawOnScreen();
}


void mousePressed() {
  if (mouseX < hitButtonTopL+hitButtonSide && mouseX > hitButtonTopL && mouseY > hitButtonTopL && mouseY < hitButtonTopL + hitButtonSide)
  hitMe();
}
