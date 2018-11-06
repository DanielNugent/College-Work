import java.util.Scanner;
public class DigitFrequency {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Enter the number:");
		int number = scanner.nextInt();
		// initialize array to hold count of digits
		int[] digitArray = new int[10];
		int remainder = 0;
		// loop to get digits of the number
		while (number > 0) 
		{
			// get the last digit
			remainder = number % 10;
			// increment the count of this digit
			digitArray[remainder]++;
			// remove the last digit from the number
			number = number / 10;
		}
		System.out.println("-------------------------");
		System.out.println("Number\tFrequency");
		System.out.println("-------------------------");
		// iterate over the digit array. Each count represents a digit from 0 to 9
	        for (int counter = 0; counter < digitArray.length; counter++) {
			// get the count
			int digitCount = digitArray[counter];
			if (digitCount != 0) {
				System.out.println(counter + "\t" + digitCount);
			}
		}
		scanner.close();
	}
}
