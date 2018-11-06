import javax.swing.JOptionPane;
import java.util.Scanner;

/*
 * Write a program which takes a date in day/month/year format (e.g. 25/11/2015) from the user and, if the date is valid, then it presents the date in, for example, “Wednesday, 25th November 2015” format. 
You must write and make use of at least the following functions:

numberEnding() which takes a day number returns “th”, “st”, “nd” or “rd”.

monthName() which takes a month number (1-12) and return “January”, or “February”, …

dayOfTheWeek() which takes a day, month and year and returns “Monday”, or “Tuesday”, …
 */
public class DaysOfTheWeek {
	public static final int DAYS_IN_MOST_MONTHS=31;
	public static final int DAYS_IN_FEB_NORMALLY=28;
	public static final int DAYS_IN_FEB_LPYR=29;
	public static final int DAYS_IN_OTHER_MONTHS=30;
	public static final int NUMBER_OF_MONTHS=12;
		

	public static void main(String[] args) {
		try {
			String input = JOptionPane.showInputDialog(null, "Enter date in format (dd/mm/yyyy): ");
			Scanner inputScanner = new Scanner(input);
			inputScanner.useDelimiter("/");
			int day = inputScanner.nextInt();
			int month = inputScanner.nextInt();
			int year = inputScanner.nextInt();
			
			if (validDate( day, month, year))
			{
				JOptionPane.showMessageDialog(null, "" + day + "/" + month + "/" + year + " is a valid date.");
			}
			else
			{
				JOptionPane.showMessageDialog(null, "" + day + "/" + month + "/" + year + " is not a valid date.");
			}
		}
		catch(NullPointerException exception)
		{
		}
		catch (java.util.NoSuchElementException exception)
		{
			System.out.println( "No number entered");
		}
	}
	
	public static boolean isLeapYear(int year) 
	{
		return (((year%4 == 0) && (year%100 != 0)) || (year%400 == 0));
	}
	
	public static int daysInMonth(int month, int year)
	{
		int numberOfDaysInMonth = DAYS_IN_MOST_MONTHS;
		switch (month)
		{
		case 2:
			numberOfDaysInMonth = isLeapYear( year ) ? DAYS_IN_FEB_LPYR : DAYS_IN_FEB_NORMALLY;
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			numberOfDaysInMonth = DAYS_IN_OTHER_MONTHS;
			break;
		default:
			numberOfDaysInMonth = DAYS_IN_MOST_MONTHS;
			break;
		}
		return numberOfDaysInMonth;
	}
	
	public static boolean validDate(int day, int month, int year) 
	{
		return ((day>1) && (day <= daysInMonth( month, year ) && (month>0) && (month<=12) && (year>0)));
	}
	
	public static String numberEnding(int day)
	{
		String dayEnding = "";
		if(day>=11&&day<20)
		{
			dayEnding="th";
		}
		switch(day)
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
		return dayEnding;
	}
	
	public static String monthName(int month)
	{
		String nameOfMonth="";
		switch(month)
		{
		case 1:
			nameOfMonth="January";
			break;
		case 2:
			nameOfMonth="February";
			break;
		case 3:
			nameOfMonth="March";
			break;
		case 4:
			nameOfMonth="April";
			break;
		case 5:
			nameOfMonth="May";
			break;
		case 6:
			nameOfMonth="June";
			break;
		case 7:
			nameOfMonth="July";
			break;
		case 8:
			nameOfMonth="August";
			break;
		case 9:
			nameOfMonth="September";
			break;
		case 10:
			nameOfMonth="October";
			break;
		case 11:
			nameOfMonth="November";
			break;
		default:
			nameOfMonth="December";
			break;
		}
		return nameOfMonth;
	}
}
