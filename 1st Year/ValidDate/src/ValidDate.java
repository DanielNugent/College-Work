/* SELF ASSESSMENT
	(Lost the page where tutorial problem was worked out so used code provided from blackboard for valid date part)
	
 1. Did I use appropriate, easy-to-understand, meaningful CONSTANT names formatted correctly in UPPERCASE?
        Mark out of 5:  5
        All constant names were in uppercase.

 2. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)?
        Mark out of 5:  5
        Variable names were easy to understand and were in lowerCamelCase.

 3. Did I indent the code appropriately?
        Mark out of 5: 5
        Each subsection of code is indented appropriately from he main line.

 4. Did I define the required function correctly (names, parameters & return type) and invoke them correctly?
       Mark out of 20:  20
       All functions were defined appropriately and invoked correctly in the main to the best of my knowledge.

 5. Did I implement the dayOfTheWeek function correctly and in a manner that can be understood?
       Mark out of 20:  20
       dayOfTheWeek function was implemented properly and it is very easy to see what is going on.

 6. Did I implement the other functions correctly, giving credit for any code that you take from elsewhere?
       Mark out of 20:  20
       (Lost the page where tutorial problem was worked out so used code provided from blackboard for valid date part) 
       Other than that i think i implemented the rest of the functions properly.

 7. Did I obtain (and process) the input from the user in the correct format (dd/mm/yyyy), and deal with any invalid input properly?      
  		Mark out of 10: 10
  		Invalid input was dealt with properly mainly using tutorial problem and input was obtained and processed correctly.

 8. Does the program produce the output in the correct format (e.g. Monday, 25th December 2017)?
       Mark out of 10:  10
       Yes it does output in the correct format.

 9. How well did I complete this self-assessment?
        Mark out of 5: 5
        I think all marks are deserved.

 Total Mark out of 100 (Add all the previous marks): 100

*/ 
import java.util.Scanner;
import javax.swing.JOptionPane;

public class ValidDate {

	public static final int DAYS_IN_APRIL_JUNE_SEPT_NOV = 30;
	public static final int DAYS_IN_FEBRUARY_NORMALLY = 28;
	public static final int DAYS_IN_FEBRUARY_IN_LEAP_YEAR = 29;
	public static final int DAYS_IN_MOST_MONTHS = 31;
	public static final int NUMBER_OF_MONTHS = 12;

	public static void main(String[] args) {

		try
		{
			String input=JOptionPane.showInputDialog(null, "Enter date in format (dd/mm/yyyy):");
			Scanner scanner = new Scanner( input );
			scanner.useDelimiter("/");
			int day = scanner.nextInt();
			int month = scanner.nextInt();
			int year = scanner.nextInt();
			
			String numberEnding=numberEnding(day);
			String dayEnding = day+numberEnding;
			String monthName = monthName(month);
			String dayName = dayOfTheWeek(day, month, year);

			if (validDate( day, month, year))
			{
				JOptionPane.showMessageDialog(null, dayName + ", "+ dayEnding + " " + monthName + ", " + year);
			}
			else
			{
				JOptionPane.showMessageDialog(null, "" + day + "/" + month + "/" + year + " is not a valid date.");
			}
		}
		catch (NullPointerException exception)
		{
		}
		catch (java.util.NoSuchElementException exception)
		{
			System.out.println( "No number entered");
		}
	
	}
	
	public static String numberEnding(int day)
	{
		String dayEnding="";
		int remainder = (day%10);
		if (day>=11 && day<20)
		{
			dayEnding="th";
		}
		else
		{
			switch(remainder)
			{
			case 1:
				dayEnding="st";
				break;
			case 2:
				dayEnding="nd";
				break;
			case 3:
				dayEnding="rd";
				break;
			default:
				dayEnding="th";
				break;
			}
		}
		return dayEnding;
	}
	
	public static String monthName(int month)
	{
		String monthName="";
		switch(month)
		{
		case 1:
			monthName="January";
			break;
		case 2:
			monthName="February";
			break;
		case 3:
			monthName="March";
			break;
		case 4:
			monthName="April";
			break;
		case 5:
			monthName="May";
			break;
		case 6:
			monthName="June";
			break;
		case 7:
			monthName="July";
			break;
		case 8:
			monthName="August";
			break;
		case 9:
			monthName="September";
			break;
		case 10:
			monthName="October";
			break;
		case 11:
			monthName="November";
			break;
		case 12:
			monthName="December";
			break;
		}
		return monthName;
	}
	
	public static String dayOfTheWeek(int day, int month, int year)
	{
		int Y=0;
		if(month==1||month==2)
		{
			Y=year-1;
		}
		else 
		{
			Y=year;
		}
		int y=Y%100;//last two digits of Y
		int c=Y/100;//first two digits of Y
		String dayName="";
	
		int w=(int) Math.abs((day + Math.floor(2.6 * (((month + 9) % 12) + 1) - 0.2) + y + Math.floor(y/4) +  Math.floor(c/4) - 2*c)%7);
		
		switch(w)
		{
		case 0:
			dayName="Sunday";
			break;
		case 1:
			dayName="Monday";
			break;
		case 2:
			dayName="Tuesday";
			break;
		case 3:
			dayName="Wednesday";
			break;
		case 4:
			dayName="Thursday";
			break;
		case 5:
			dayName="Friday";
			break;
		case 6:
			dayName="Saturday";
			break;
		}
		return dayName;
	}
	
	public static boolean validDate( int day, int month, int year)
	{
		return ((year >= 0) && (month >= 1) && (month <= NUMBER_OF_MONTHS) &&
				(day >= 1) && (day <= daysInMonth( month, year )));
	}
	
	public static int daysInMonth( int month, int year )
	{
		int numberOfDaysInMonth = DAYS_IN_MOST_MONTHS;
		switch (month)
		{
		case 2:
			numberOfDaysInMonth = isLeapYear( year ) ? DAYS_IN_FEBRUARY_IN_LEAP_YEAR : DAYS_IN_FEBRUARY_NORMALLY;
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			numberOfDaysInMonth = DAYS_IN_APRIL_JUNE_SEPT_NOV;
			break;
		default:
			numberOfDaysInMonth = DAYS_IN_MOST_MONTHS;
			break;
		}
		return numberOfDaysInMonth;
	}
	
	public static boolean isLeapYear( int year )
	{
		return (((year%4 == 0) && (year%100 != 0)) || (year%400 == 0));
	}
}
