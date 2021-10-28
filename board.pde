//Creates the Board as well as the Pieces For it 

public class Board
{    

  private int limit1 = 0;
  private int limit2 = 0;
  private int limit3 = 0;
  private int limit4 = 0;
  private int limit5 = 0;
  private int limit6 = 0;
  private int limit7 = 0;

  private   int [] yvalues = {550, 550, 550, 550, 550, 550, 550};
  private int [] checkyindex = {0, 0, 0, 0, 0, 0, 0};

  boolean player1 = false;

  public Board ()
  {
  }

  public void print()
  {
    for (int h = 0; h < 700; h += size) {
      for (int v = 0; v < 700; v += size) { 

        fill (66, 101, 244);
        rect (h, v, size, size);

        fill(255, 255, 255);
        ellipse(h+50, v+50, 100, 100);
      }
    }
  }
  void printPiece ()
  {

    int column= findColumn();
    if (player1)
    {
      if (column == 1 && limit1 < 6)
      {
        drawRedCircle(column);
        yvalues[0] -= 100;
        board[checkyindex[0]][0] = player1move;
        checkyindex[0] +=1;
        limit1++;
      }


      if (column == 2 && limit2 < 6)
      {
        drawRedCircle(column);
        yvalues[1] -= 100;
        board[checkyindex[1]][1] = player1move;

        checkyindex[1] +=1;
        limit2++;
      }

      if (column == 3 && limit3 < 6)
      {
        drawRedCircle(column);
        yvalues[2] -= 100;
        board[checkyindex[2]][2] = player1move;

        checkyindex[2] +=1;
        limit3++;
      }

      if (column == 4 && limit4 < 6)
      {
        drawRedCircle(column);
        yvalues[3] -= 100;
        board[checkyindex[3]][3] = player1move;

        checkyindex[3] +=1;
        limit4++;
      }
      if (column == 5 && limit5 < 6)
      {
        drawRedCircle(column);
        yvalues[4] -= 100;
        board[checkyindex[4]][4] = player1move;

        checkyindex[4] +=1;
        limit5++;
      }

      if (column == 6 && limit6 < 6)
      {
        drawRedCircle(column);
        yvalues[5] -= 100;
        board[checkyindex[5]][5] = player1move;


        checkyindex[5] +=1;
        limit6++;
      }
      if (column == 7 && limit7 < 6)
      {
        drawRedCircle(column);
        yvalues[6] -= 100;
        board[checkyindex[6]][6] = player1move;


        checkyindex[6] +=1;
        limit7++;
      }
    } else {
      if (column == 1 && limit1 < 6 )
      {
        drawYellowCircle(column);
        yvalues[0] -= 100;


        board[checkyindex[0]][0] = player2move;

        checkyindex[0] +=1;
        limit1++;
      }

      if (column == 2 && limit2 < 6)
      {
        drawYellowCircle(column);
        yvalues[1] -= 100;
        board[checkyindex[1]][1] = player2move;
        limit2 ++;


        checkyindex[1] +=1;
      }

      if (column == 3 && limit3 < 6)
      {
        drawYellowCircle(column);
        yvalues[2] -= 100;
        board[checkyindex[2]][2] = player2move;


        checkyindex[2] +=1;
        limit3 ++;
      }

      if (column == 4 && limit4 < 6)
      {
        drawYellowCircle(column);
        yvalues[3] -= 100;
        board[checkyindex[3]][3] = player2move;


        checkyindex[3] +=1;
        limit4++;
      }
      if (column == 5 && limit5 < 6)
      {
        drawYellowCircle(column);
        yvalues[4] -= 100;
        board[checkyindex[4]][4] = player2move;


        checkyindex[4] +=1;
        limit5++;
      }

      if (column == 6 && limit6 < 6)
      {
        drawYellowCircle(column);
        yvalues[5] -= 100;
        board[checkyindex[5]][5] = player2move;


        checkyindex[5] +=1;
        limit6 ++;
      }
      if (column == 7 && limit7 < 6 )
      {
        drawYellowCircle(column);
        yvalues[6] -= 100;
        board[checkyindex[6]][6] = player2move;


        checkyindex[6] +=1;
        limit7++;
      }
    }
  }
  public void flop ()
  {

    player1 = !player1;
  }

  public int findColumn()
  {

    if (locationx < 100 && locationx > 0)
    {
      return 1;
    }

    if (locationx < 200 && locationx > 100)
    {
      return 2;
    }

    if (locationx < 300 && locationx > 200)
    {
      return 3;
    }

    if (locationx < 400 && locationx > 300)
    {
      return 4;
    }
    if (locationx < 500 && locationx > 400)
    {
      return 5;
    }

    if (locationx < 600 && locationx > 500)
    {
      return 6;
    }
    if (locationx < 700 && locationx > 600)
    {
      return 7;
    }


    return 0;
  }


  public void drawRedCircle(int column)
  {
    tie_counter ++;
    int rowSpace = (50+(100*(column-1)));
    fill(255, 0, 0);
    ellipse (rowSpace, yvalues[column-1], 100, 100);
  }




  public void drawYellowCircle(int column)
  {
    tie_counter++;
    int rowSpace = (50+(100*(column-1)));
    fill(250, 210, 0);
    ellipse (rowSpace, yvalues[column-1], 100, 100);
  }
}
