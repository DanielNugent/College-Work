/* SELF ASSESSMENT
   1. Did I use appropriate CONSTANTS instead of numbers within the code?
       Mark out of 5: 5
       Comment:	I made constants for all values with names eg: 13 is a king. I also created a constant string containing the question as 
       it needed to be asked repetitively.
       
   2. Did I use easy-to-understand, meaningful CONSTANT names formatted correctly in UPPERCASE?
       Mark out of 5: 5
       Comment: All my constant names had an appropriate name and it is clear t tell what they represent.
       
   3. Did I use easy-to-understand meaningful variable names?
       Mark out of 10: 10
       Comment: All my variable names were easy to understand and it is clear to tell what they represent and what they do.
       
   4. Did I format the variable names properly (in lowerCamelCase)?
       Mark out of 5: 5
       Comment: All variable names were in lowerCamelCase.
       
   5. Did I indent the code appropriately?
       Mark out of 10: 10	
       Comment: Each sub-section is indented appropriately away from the edge.
       
   6. Did I use an appropriate loop to allow the user to enter their guesses until they win or lose?
       Mark out of 20: 20
       Comment: My while loop keeps running until the user has won or lost the game.
       
   7. Did I check the input to ensure that invalid input was handled appropriately?
       Mark out of 10: 10
       Comment: If an invalid input is entered the program will inform the user how to enter an appropriate input and will give the user a new card.
       
   8. Did I generate the cards properly using random number generation (assuming all cards are equally likely each time)?
       Mark out of 10: 10
       Comment: Each card is equally likely to happen. I created two random generators, So that the currentCard could be compared to the nextCard.
       
   9. Did I output the cards correctly as 2, 3, 4, ... 9, 10, Ace, Jack, Queen, King?
       Mark out of 10: 10
       Comment: I used if statements to tell the program to print the name of the card associated with the value,
       if there is no name it will just print the card number. I also ensured the program could not print 0.
       
   10. Did I report whether the user won or lost the game before the program finished?
       Mark out of 10: 10
       Comment: I created an if statement inside the while loop which would end the program if a wrong answer was entered. 
       I also created another if statement which would report a win if the score=4 (right answers in a row to win).
       
   11. How well did I complete this self-assessment?
       Mark out of 5: 5
       Comment: I think all the marks I provided myself have sound reasoning behind them.
       
   Total Mark out of 100 (Add all the previous marks): 100
*/ 
import java.util.Scanner;
import java.util.Random;

public class HighLowGame {
	
	public static final int KING = 13;
	public static final int QUEEN = 12;
	public static final int ACE = 1;
	public static final int JACK = 11;
	public static final int SUIT = 13;
	public static final int RIGHT_ANSWERS_TO_WIN = 4;
	public static final int WRONG_ANSWERS_TO_LOSE = 1;
	public static final String QUESTION = "\nDo you think the next card will be higher, lower or equal?:";
	
			
	public static void main(String[] args) {
		boolean finished = false;
		int score=0;
		int wrongAnswers=0;
		
		
		while(score < RIGHT_ANSWERS_TO_WIN && wrongAnswers < WRONG_ANSWERS_TO_LOSE)
		{
			Random card = new Random();
			int currentCard = card.nextInt(SUIT-ACE+1)+ACE;//Ensuring value of currentCard and nextCard cannot be 0.
			int nextCard = card.nextInt(SUIT-ACE+1)+ACE;
			Scanner guess = new Scanner(System.in);
			
			if(nextCard==KING)
			{
				System.out.print("The card is a King" + QUESTION); //Telling program if value of card equals the card name to print the card name instead of the currentCard numerical value
			}
			else if(nextCard==JACK)
			{
				System.out.print("The card is a Jack" + QUESTION);
			}
			else if(nextCard==ACE)
			{
				System.out.print("The card is an Ace" + QUESTION);
			}
			else if(nextCard==QUEEN)
			{
				System.out.print("The card is a Queen" + QUESTION);
			}
			else
			{	
				System.out.print("The card is a " +  nextCard + QUESTION);
			}
			
			if((currentCard<nextCard)&&(guess.hasNext("lower"))
					||((currentCard>nextCard)&&(guess.hasNext("higher"))
							||((currentCard==nextCard)&&(guess.hasNext("equal")))))
			{
				score++;
			}
			else if
				((currentCard<nextCard)&&(guess.hasNext("higher"))
					||((currentCard<nextCard)&&(guess.hasNext("equal"))
						||((currentCard>nextCard)&&(guess.hasNext("lower"))
							||((currentCard>nextCard)&&(guess.hasNext("equal"))
								||((currentCard==nextCard)&&(guess.hasNext("higher"))
									||((currentCard==nextCard)&&(guess.hasNext("lower"))))))))
			{
				wrongAnswers++;
				finished=true;
				System.out.println("You lose bitch!");
			}
			else
			{
				System.out.println("Invalid input. Try writing 'higher', 'lower' or 'equal' ");
			}
			
			if(score==RIGHT_ANSWERS_TO_WIN)
			{
				finished=true;
				System.out.println("Congratulations, You won!");
			}
		}
	}
}
