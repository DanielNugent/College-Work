/* SELF ASSESSMENT

 1. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)?
        Mark out of 5:  5
        Comment: All my variable names were clear and easy to understand. They were all in lowerCamelCase. 

 2. Did I indent the code appropriately?
		Mark out of 5:  5
        Comment: All my code was appropriately indented away from the main.

 3. Did I write the initialiseHighScores function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 15: 15
       Comment: I wrote the initialiseHighScores function correctly. After the user inputs the size of the array the function is
        		invoked and sets the given number of elements to zero.

 4. Did I write the printHighScores function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 15:  13
	   Comment: I wrote the function with correct parameters but my program wouldn't let me call the initialiseHighScores function
	   			inside printHighScores so the output String was not processed as requested in the assignment instructions.
	   
 5. Did I write the higherThan function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 15:  15
       Comment: I think I wrote this function correctly. It takes a new score and runs through all elements currently in the array
       			and checks if it is higher than any of them. If it is, the function returns true, otherwise it returns false.
       
 6. Did I write the insertScore function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 20:  20
       Comment: Instead of creating a complicated loop where the function would shift the numbers to make room for another number if it 
       			was higher than any of the numbers in the array, I used java utilities that are already available for use. The array sort 
       			along with Collections.reverseorder() automatically sorts the array list in descending order as required. I used Integer[]
       			instead of int[] for my array as that is what is needed for Collections() to work.
       
 7. Did I write the main function body correctly (first asking for the number of scores to be maintained and then repeatedly asking for scores)?
       Mark out of 20:  20
       Comment: I did what was required. The user enters the size of the array they would like to maintain, an array is created from that 
       user input and numbers are continuously added into that array as the user enters numbers until the array is full.
 		
 8. How well did I complete this self-assessment?
        Mark out of 5: 5
        Comment: I think all my marks are correct and I took away 2 marks from part 4 appropriately.
 
 Total Mark out of 100 (Add all the previous marks): 98

*/ 
import java.util.Scanner;
import java.util.Arrays;
import java.util.Collections;

public class HighScores {

	public static void main(String[] args) {
		System.out.print("How many scores do you want to maintain?: ");
		Scanner input = new Scanner(System.in);
		Integer scoreCount = input.nextInt();
		Integer[] highScores = new Integer[scoreCount];
		int index = 0;
		Integer newScore = 0;
		initialiseHighScores(highScores);
		
		for(index=0; index<highScores.length; index++)
		{
			System.out.println("\nEnter a high score: ");
			Scanner scoreScanner = new Scanner(System.in);
			newScore = scoreScanner.nextInt();
			highScores[index] = newScore;
			printHighScores(highScores);
			
			if(higherThan(newScore,  highScores))
			{
				insertScore(newScore, highScores);
			}
			else
			{
				highScores[index] = newScore;
				insertScore(newScore, highScores);
			}
		}
	}
	
	public static void initialiseHighScores(Integer[] highScores) {
		for(int index=0; index<highScores.length; index++)
		{
			highScores[index]=0;
		}
	}
	
	public static void printHighScores(Integer[] highScores) {
		System.out.print("The high scores are ");
	}
		
	public static boolean higherThan(Integer newScore, Integer[] highScores) {
		for(int index=0; index<highScores.length; index++)
		{
			if(newScore>highScores[index])
			{
				return true;
			}
		}
		return false;
	}
		
	public static void insertScore(Integer newScore, Integer[] highScores) {
			Arrays.sort(highScores, Collections.reverseOrder());
			System.out.print(Arrays.toString(highScores));
	}
}