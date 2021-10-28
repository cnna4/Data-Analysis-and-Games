// Connect 4 Redone
// Creator Chidi Nna 
// AP Computer Science
// 18 June 2018

Board b;
Check c;

public int[][] board = new int[6][7];
public int size = 100;

int x = 600;
int locationx;
int locationy;

private int tie_counter = 0;
private int go = 20;
private int player1move = 1;
private int player2move =2;
private int stay = 100;

void setup() {
  size (800, 700);
  smooth();
  background(#4265F4);
  b = new Board();
  b.print();
  c= new Check();
}

void draw ()
{

  if (c.checkVertical() == 1)
  {
    background(300);
    fill(100, 255, 255);
    textSize (50);
    text("Player 1 Wins", go, 200);
    go++;
    textSize (50);
    text("Player 2 loses :(", x, 400);
    x--;
    fill(100, 255, 255);
    textSize (40);
    text("Player 1 Wins By a Vertical Connect", 100, 500);
  }
  if (c.checkVertical() == 2)
  {
    background(300);
    fill(100, 255, 255);
    textSize (50);
    text("Player 2 Wins", go, 200);
    go++;
    textSize (50);
    text("Player 1 loses", x, 200);
    x--;
    fill(100, 255, 255);
    textSize (40);
    text("Player 2 Wins By a Vertical Connect", 100, 500);
  }

  if (c.checkHorizontal() == 1)
  {
    background(300);
    fill(100, 255, 255);
    textSize (50);
    text("Player 1 Wins", go, 200);
    go++;
    textSize (50);
    text("Player 2 loses", x, 200);
    x--;
    fill(100, 255, 255);
    textSize (40);
    text("Player 1 Wins By a Horizonatal Connect", 30, 500);
  }
  if (c.checkHorizontal() == 2)
  {
    background(300);
    fill(100, 255, 255);
    textSize (50);
    text("Player 2 Wins", go, 200);
    go++;
    textSize (50);
    text("Player 1 loses", x, 200);
    x--;
    fill(100, 255, 255);
    textSize (40);
    text("Player 2 Wins By a Horizontal Connect", 30, 500);
  }
  if (c.checkDiagonolRight() == 1)
  {
    background(300);
    fill(100, 255, 255);
    textSize (50);
    text("Player 1 Wins", go, 200);
    go++;
    textSize (50);
    text("Player 2 loses :(", x, 200);
    x--;
    fill(100, 255, 255);
    textSize (40);
    text("Player 1 Wins By a Diagonol Connect", 30, 500);
  }
  if (c.checkDiagonolRight() == 2)
  {
    background(300);
    fill(100, 255, 255);
    textSize (50);
    text("Player 2 Wins", go, 200);
    go++;
    textSize (50);
    text("Player 1 loses :(", x, 200);
    x--;
    fill(100, 255, 255);
    textSize (40);
    text("Player 2 Wins By a Diagonol Connect", 30, 500);
  }
  if (c.checkDiagonolLeft() == 1)
  {
    background(300);
    fill(100, 255, 255);
    textSize (50);
    text("Player 1 Wins", go, 200);
    go++;
    textSize (50);
    text("Player 2 loses :(", x, 200);
    x--;
    fill(100, 255, 255);
    textSize (40);
    text("Player 1 Wins By a Diagonol Connect", 30, 500);
  }
  if (c.checkDiagonolLeft() == 2)
  {
    background(300);
    fill(100, 255, 255);
    textSize (50);
    text("Player 2 Wins", go, 200);
    go++;
    textSize (50);
    text("Player 1 loses :(", x, 200);
    x--;
    fill(100, 255, 255);
    textSize (40);
    text("Player 2 Wins By a Diagonol Connect", 30, 500);
  }
  if (tie_counter == 42 && c.checkDiagonolLeft() == 0 && c.checkDiagonolRight() ==0 && c.checkVertical() == 0  && c.checkHorizontal() == 0)
  {
    background(300);
    fill(100, 255, 255);
    textSize (50);
    text("WOW ITS A TIE", go, 200);
    go++;
  }



  fill (66, 101, 244);
  rect (0, 600, 800, 100);
  fill(255, 255, 255);
  textSize (stay);
  text("CONNECT 4", 0, 700);
}

void mouseClicked() {

  locationx = mouseX;
  locationy = mouseY;
  b.flop();
  b.printPiece ();
}
