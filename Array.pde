//Checks to see the Winner Of the Game 

public class Check
{

  public Check()
  {
  }


  public void reset() //Not Used
  {

    for ( int r = 0; r < 6; r++)
    {
      for ( int c = 0; c < 7; c++)
      {
        board[r][c] = 0;
      }
    }
  }
  public int checkVertical()
  {


    int countred = 1;
    int countyellow =1;
    for (int j = 0; j<7; j++) {
      for (int i = 1; i<6; i++) {    
        if ( (board[i][j] == player1move) && (board[i-1][j] == player1move)) {
          countred++;
          // System.out.println(countred + " Are in a row for player 1");
          // System.out.println("I = " + i + " J = 0");
        } else {

          countred = 1;
        }
        if ( (board[i][j] == player2move) && (board[i-1][j] == player2move)) {
          countyellow++;
          // System.out.println(countred + " Are in a row for player 1");
          // System.out.println("I = " + i + " J = 0");
        } else {

          countyellow = 1;
        }

        if (countred == 4) {
          return 1;
        }
        if (countyellow == 4) {
          return 2;
        }
      }
    }

    return 0;
  }

  public int checkDiagonolRight()
  {


    int countred = 1;
    int countyellow =1;
    for (int i = 3; i<6; i++) {
      for (int j = 3; j<7; j++) {    
        if ( board[i][j] == player1move && board[i-1][j-1] == player1move && board[i-2][j-2]
          == player1move && board[i-3][j-3] == player1move) {
          countred = 4;
          //  System.out.println(countred + " Are in a diagonal for player 1");
          // System.out.println("I = " + i + " J = 0");
        } else {

          countred = 1;
        }
        if ( board[i][j] == player2move && board[i-1][j-1] == player2move && board[i-2][j-2]
          == player2move && board[i-3][j-3] == player2move) {
          countyellow = 4;
          //    System.out.println(countred + " Are in a diagnol for player 1");
          //    System.out.println("I = " + i + " J = 0");
        } else {

          countyellow = 1;
        }

        if (countred == 4) {
          return 1;
        }
        if (countyellow == 4) {
          return 2;
        }
      }
    }
    return 0;
  }
  public int checkDiagonolLeft()
  {


    int countred = 1;
    int countyellow =1;
    for (int i = 0; i < 2; i++) {
      for (int j = 6; j > 3; j--) {    
        if ( board[i][j] == player1move && board[i+1][j-1] == player1move && board[i+2][j-2]
          == player1move && board[i+3][j-3] == player1move) {
          countred = 4;
          // System.out.println(countred + " Are in a diagonal for player 1");
          //  System.out.println("I = " + i + " J = 0");
        } else {

          countred = 1;
        }
        if (board[i][j] == player2move && board[i+1][j-1] == player2move && board[i+2][j-2]
          == player2move && board[i+3][j-3] == player2move) {
          countyellow = 4;
          System.out.println(countred + " Are in a diagnol  for player 2");
          System.out.println("I = " + i + " J = 0");
        } else {

          countyellow = 1;
        }

        if (countred == 4) {
          return 1;
        }
        if (countyellow == 4) {
          return 2;
        }
      }
    }
    return 0;
  }

  public int checkHorizontal()
  {

    int countred = 1;
    int countyellow =1;
    for (int i = 0; i<6; i++) {
      for (int j = 1; j<7; j++) {    
        if ( (board[i][j] == player1move) && (board[i][j-1] == player1move)) {
          countred++;
          // System.out.println(countred + " Are in a row for player 1");
          // System.out.println("I = " + i + " J = 0");
        } else {

          countred = 1;
        }
        if ( (board[i][j] == player2move) && (board[i][j-1] == player2move)) {
          countyellow++;
          //   System.out.println(countred + " Are in a row for player 1");
          //  System.out.println("I = " + i + " J = 0");
        } else {

          countyellow = 1;
        }

        if (countred == 4) {
          return 1;
        }
        if (countyellow == 4) {
          return 2;
        }
      }
    }

    return 0;
  }
 
}
