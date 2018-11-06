/* SELF ASSESSMENT
 1. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)?
        Mark out of 5:    5
 	    Comment: All my variable names were in lowerCamelCase and were meaningful to what they represented.
 	
 2. Did I indent the code appropriately?
        Mark out of 5:	  5
	 	Comment: All my code was indented appropriately away from the main.
	
 3. Did I write the determineStarNumber or determineTriangleNumber function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 20:	  20    
       Comment: I believe my determineStarNumber function was written appropriately and invoked correctly with 
				meaningful parameters and return type.
				
 4. Did I write the isStarNumber function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 20:    20
       Comment: I believe my isStarNumber function was written appropriately and invoked correctly with 
				meaningful parameters and return type.
				
 5. Did I calculate and/or check triangle numbers correctly?
       Mark out of 15:    15
       Comment: I think I produced the triangle numbers correctly in the main.
  
 6. Did I loop through all possibilities in the program using system defined constants to determine when to stop?
       Mark out of 10:    10
       Comment:	I used the Integer.MAX_VALUE system constant to determine when the program should stop and I think I looped through
   				all possibilities correctly.
   				
 7. Does my program compute and print all the correct triangular star numbers?
       Mark out of 20:    20
       Comment:	I checked the numbers that were supposed to print online and they all printed correctly, however the final number takes a 
     			couple of seconds to compute before the program terminates.
     			
 8. How well did I complete this self-assessment?
        Mark out of 5:    5
	    Comment: I think all marks are deserved and given correctly.
	
	EXTRA COMMENT: For some reason beyond my understanding i found that if i used curly brackets to define while loops and if statements 
				   in some parts of functions they would produce incorrect results and/or fail to terminate the program correctly.
				   For this reason i did not use curly brackets on some of them.
	
 Total Mark out of 100 (Add all the previous marks): 100
*/

import java.util.Scanner;
import javax.swing.JOptionPane;

public class TriangularStars {
	//Calculates all Triangle numbers and if the calculated star numbers equal the triangle number it prints it to the console
	public static void main(String[] args) {
      int triangleNumber=0;
      int triangleIndex=0;
      int number=1;
      int index=0;
      
      while(java.lang.Integer.MAX_VALUE >= triangleIndex++)
      {
    	  triangleNumber+=triangleIndex;
    	  
    	  if(isStarNumber(triangleNumber))
    	  {
    		  System.out.println("The number " + triangleNumber + " is a triangle number and a star number");
    	  }
      }
	}
	//Determines if a passed number value is a star number and returns true if the number equals the star number
	public static boolean isStarNumber(int number) {
		int starIndex=0;
		int starNumber=determineStarNumber(starIndex);
		
		while((number > starNumber))
			starNumber=determineStarNumber(starIndex++); 
			return (number == starNumber);
	}
	//Finds all star numbers from the passed index
	public static int determineStarNumber(int index) {
		if (index==0)
			return 1;
		int starNumber=0;
			
		if((index >0)&& ((java.lang.Integer.MAX_VALUE/6) > index))
		{ 
			starNumber=6*index;
			
			if((java.lang.Integer.MAX_VALUE/starNumber) > (index-1))
			{
				starNumber=starNumber*(index-1);
				if((java.lang.Integer.MAX_VALUE-1) >= starNumber)
				{
					starNumber=starNumber+1;
					return starNumber;
				}
			}
		}
		return 0;
	}
}