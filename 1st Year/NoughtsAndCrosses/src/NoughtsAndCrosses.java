/* SELF ASSESSMENT
   1. clearBoard:

    Did I use the correct method definition?
    Mark out of 5:5
    Comment:Correct parameters and return type was used.
    Did I use loops to set each position to the BLANK character?
    Mark out of 5:5
    Comment: nested for loops to set each element in each row and column to the blank character.

   2. printBoard

    Did I use the correct method definition?
    Mark out of 5:5
    Comment:correct parameters and return type.
    Did I loop through the array and prints out the board in a way that it looked like a board?
    Mark out of 5:5
    Comment:Board looks like a 3x3 grid. Reasonable for playing noughts and crosses

   3. canMakeMove

    Did I have the correct function definition and returned the correct item?
    Mark out of 5:5
    Comment:Returned true if a apace was "blank" which means a player piece can be placed there. Returns false otherwise.
    Did I check if a specified location was BLANK?
    Mark out of 5:5
    Comment:User can only place a piece if the space is blank.

   4. makeMove

    Did I have the correct function definition?
    Mark out of 5:5
    Comment:correct parameters and return type.
    Did I set the  currentPlayerPiece in the specified location?
    Mark out of 5:5
    Comment: Prints it in the relevant row and column on the board.

   5. isBoardFull

    Did I have the correct function definition and returned the correct item?
    Mark out of 5:5
    Comment: correct parameters and return type.
    Did I loop through the board to check if there are any BLANK characters?
    Mark out of 5: 5
    Comment: for loop wasnt working properly but  each spot was checked individually,

   6. winner

    Did I have the correct function definition and returned the winning character
    Mark out of 5:5
    Comment: returns winner based on different combos
    Did I identify all possible horizontal, vertical and diagonal winners 
    Mark out of 15:15
    Comment: All possiblities were identified and handled.

   7.main

    Did I create a board of size 3 by 3 and use the clearBoard method to set all the positions to the BLANK character ('  ')?
    Mark out of 3:3
    Comments: Board created properly and elements set to blank character. I preferred to use '-' as my blank instead of ' '. 
    		  It made it easier for me to see whats happening
    Did I loop asking the user for a location until wither the board was full or there was a winner?
    Mark out of 5:5
    Comments: Keeps looping and switching player until board is full or there is a winner in which case it terminates.
    Did I call all of the methods above?
    Mark out of 5: 5
    Comments: All methods were called appropriately.
    Did I handle incorrect locations provided by the user (either occupied or invalid locations)?
    Mark out of 3:3
    Comments:Invalid input is printed if it is an incorrect location.
    Did I switch the current player piece from cross to nought and vice versa after every valid move?
    Mark out of 3:3
    Comments:Switches every turn starting with X.
    Did I display the winning player piece or a draw at the end of the game?
    Mark out of 3:3

    Comments: Winning piece is displayed.

   8. Overall

    Is my code indented correctly?
    Mark out of 3:3
    Comments: Appropriately indented from the main.
    Do my variable names and Constants (at least four of them) make sense?
    Mark out of 3:3
    Comments:They are all understandable names.
    Do my variable names, method names and class name follow the Java coding standard
    Mark out of 2:2
    Comments:Yes, variables are in lowerCamelCase and constants are in CAPS etc.

      Total Mark out of 100 (Add all the previous marks):100s
*/

import java.util.Scanner;
public class NoughtsAndCrosses {
	public static final int ROWS =3;
	public static final int COLUMNS=3;
	public static final char NOUGHT='O';
	public static final char CROSS='X';
	public static final char EMPTY='-';
	

	public static void main(String[] args) {
		char[][] board= new char[ROWS][COLUMNS];
		int row=0;
		int column=0;
		char currentPlayerPiece=CROSS;
		clearBoard(board);
		printBoard(board);
		while(isBoardFull(board)==false)
		{
			Scanner input = new Scanner(System.in);
			System.out.println("Pick a row");
			row=input.nextInt()-1;
			System.out.println("Pick a column");
			column=input.nextInt()-1;
			if(winner(board)!='-')
			{
				System.out.println("Winner: " + currentPlayerPiece );
				break;
			}
			if(canMakeMove(board, row, column))
			{
				makeMove(board, currentPlayerPiece, row, column);
				printBoard(board);
				
				if(currentPlayerPiece==CROSS)
				{
					currentPlayerPiece=NOUGHT;
				}
				else
				{
					currentPlayerPiece=CROSS;
				}
			}
			else 
			{
				System.out.println("Invalid input");
			}
		}
	}
	
	public static void clearBoard(char[][] board) {
		for(int row=0; row<ROWS; row++)
		{
			for(int column=0; column<COLUMNS; column++)
			{
				board[row][column]='-';
			}
		}
	}
	
	public static void printBoard(char[][] board) {
	    System.out.println("----------------");
	    for (int row = 0; row < ROWS; row++)
	    {
	    	System.out.print(" | ");
	    	for (int column = 0; column < COLUMNS; column++)
	    	{
	    		System.out.print(board[row][column] + " | ");
	    	}
	    	System.out.println();
	    	System.out.println("----------------");
	    }
	}
	
	public static boolean canMakeMove(char[][] board, int row, int column) {
		if(board[row][column]=='-')
		{
			return true;
		}
		return false;
	}
	
	public static void makeMove(char[][] board, char currentPlayerPiece, int row, int column) {
			board[row][column]=currentPlayerPiece;
			System.out.print(board[row][column]);
	}
	
	public static boolean isBoardFull(char[][] board) {
		if(board[0][0] == EMPTY || 
			 board[0][1] == EMPTY || 
			 board[0][2] == EMPTY || 
			 board[1][0] == EMPTY ||
			 board[1][1] == EMPTY ||
			 board[1][2] == EMPTY ||
			 board[2][0] == EMPTY ||
			 board[2][1] == EMPTY ||
			 board[2][2] == EMPTY)
		{
			    return false;
		}
		return true;
	}
	
	
	public static char winner(char[][] board) {
		// Check if someone won
		// Check horizontals

		// top row
		if((board[0][0] == board[0][1]) && (board[0][1] == board[0][2]))
		{
		    return board[0][0];
		}

		// middle row
		if((board[1][0] == board[1][1]) && (board[1][1] == board[1][2]))
		{
			return board[1][0];
		}
		    
		// bottom row
		if((board[2][0] == board[2][1]) && (board[2][1] == board[2][2]))
		{
			return board[2][0];
		}

		// Check verticals

		// left column
		if((board[0][0] == board[1][0]) && (board[1][0] == board[2][0]))
		{
			return board[0][0];
		}

		// middle column
		if((board[0][1] == board[1][1]) && (board[1][1] == board[2][1]))
		{
			 return board[0][1];
		}
		   

		// right column
		if((board[0][2] == board[1][2]) && (board[1][2] == board[2][2]))
		{
			return board[0][2];
		}

		// Check diagonals
		// one diagonal
		if((board[0][0] == board[1][1]) && (board[1][1] == board[2][2]))
		{
			return board[0][0];
		}

		// the other diagonal
		if((board[0][2] == board[1][1]) && (board[1][1] == board[2][0]))
		{
			return board[0][2];
		}
		return '-';

	}
}
