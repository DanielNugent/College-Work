/* SELF ASSESSMENT
   1. createSequence:

    Did I use the correct method definition?
    Mark out of 5: 5
    Comment: Yes i believe it was correct. The parameters and return type were appropriate.
    Did I create an array of size n (passed as the parameter) and initialise it?
    Mark out of 5:5
    Comment: Array was initalised properly starting from 2
    Did I return the correct item?
    Mark out of 5: 5
    Comment: Correctly returned the sequence of numbers from 2-30 in an array.

   2. crossOutMultiples

    Did I use the correct method definition?
    Mark out of 5: 5
    Comment: Yes i believe it was correct. The parameters and return type were appropriate.
    Did I ensure the parameters are not null and one of them is a valid index into the array
    Mark out of 2: 2
    Comment: The parameters were not null.
    Did I loop through the array using the correct multiple?
    Mark out of 5: 5
    Comment: correctly crossed out numbers using the appropriate multiple.
    Did I cross out correct items in the array that were not already crossed out?
    Mark out of 3: 3
    Comment: Each elemt is only crossed once from a single multiple and not again.

   3. sieve   

    Did I have the correct function definition?
    Mark out of 5: 5
    Comment: Yes i believe it was correct. The parameters and return type were appropriate.
    Did I make calls to other methods?
    Mark out of 5: 5
    Comment: A call to the crossOutHigherMultiples method was used in this method. 
    Did I return an array with all non-prime numbers are crossed out?
    Mark out of 2: 2
    Comment: All non primes were crossed out appropriately.

   4. sequenceTostring  

    Did I have the correct function definition?
    Mark out of 5: 5
    Comment: Yes i believe it was correct. The parameters and return type were appropriate.
    Did I ensure the parameter to be used is not null?
    Mark out of 3: 3
    Comment: Parameter was not null.
    Did I Loop through the array updating the String variable with the non-crossed out numbers and the crossed numbers in brackets?
    Mark out of 10: 5
    Comment:    Program does everything in one go.

   5. nonCrossedOutSubseqToString  

    Did I have the correct function definition
    Mark out of 5: 5
    Comment: Yes i believe it was correct. The parameters and return type were appropriate.
    Did I ensure the parameter to be used is not null? 
    Mark out of 3: 3
    Comment: Was not null.
    Did I loop through the array updating the String variable with just the non-crossed out numbers?
    Mark out of 5: 3
    Comment: Ran in one go.

   6. main  

    Did I ask  the user for input n and handles input errors? 
    Mark out of 5: 3
    Comments: Errors werent handled.
    Did I make calls to other methods (at least one)?
    Mark out of 5: 5
    Comment:  sieve,sequenceToString and create sequence were called.
    Did I print the output as shown in the question? 
    Mark out of 5: 3
    Comment:  Did not iterate every multiple and just did all multiples in ine go, Also did not print out inital sequence.

   7. Overall

    Is my code indented correctly?
    Mark out of 4:4
    Comments: Indented appropriately away from the main.
    Do my variable names make sense?
    Mark out of 4: 4
    Comments: All variable names are easy to understand.
    Do my variable names, method names and class name follow the Java coding standard
    Mark out of 4: 4
    Comments: All names follow coding standards.

      Total Mark out of 100 (Add all the previous marks): 94
*/ 
import java.util.Arrays;
import java.util.Scanner;
public class SieveOfEratosthenes {

	public static void main(String[] args)
	{
		System.out.print("Enter a number>2:");	
		Scanner inputScanner=new Scanner(System.in);
		int number= inputScanner.nextInt();
		sequenceToString(sieve(number,createSequence(number)));
	}
	
	public static int[] createSequence(int number)
	{
		int[] sequence=new int[number-1];
		int num=2;
		for(int i=0;i< sequence.length;i++)
		{
			sequence[i]=num;
			 num++;
			
		}
		
		return sequence;
	}
	public static int[] sieve(int number,int sequence[])
	{	
		double squareRoot=Math.sqrt(number);
		
		int multiple=2;
		int i=0;
		while(multiple<squareRoot)
		{
			crossOutHigherMultiples(multiple,sequence);
			multiple++;
		}
	
		return sequence;
		
	}
	public static int[] crossOutHigherMultiples(int multiple,int sequence[])
	{
		for(int i=0;i<sequence.length ;i++)
		{	
			if(sequence[i]!=multiple && sequence[i]%multiple==0  )
			{
			sequence[i]=0;
			}
			
		}
		return sequence; 
	}
	public static String sequenceToString(int sequence[])
	{	
		String brackets = "";
		for(int i=0;i<sequence.length ;i++)
		{	
			if(sequence[i]==0)
			{
				int originalNumber=i+2;
				brackets+="[" + originalNumber + "], ";
			}
			else if(sequence[i]!=0)
			{
				int originalNumber=i+2;
				brackets+=originalNumber+ ", ";
			}
			
		}
		System.out.print(brackets);
		return brackets ; 
	}
	
	public static String nonCrossedOutSubseqToString (int sequence[])
	{
		String brackets = new String();
		for(int i=0;i<sequence.length ;i++)
		{	
			if(sequence[i]==0)
			{
				brackets+="" ;
			}
			else if(sequence[i]!=0)
			{
				int originalNumber=i+2;
				brackets+=originalNumber+ ", ";
			}
			
		}
		System.out.print(brackets);
		return brackets ; 
	}
}
