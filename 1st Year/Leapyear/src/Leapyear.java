import java.util.Scanner;
import javax.swing.JOptionPane;

public class Leapyear {

	public static void main(String[] args) {
		
		String year = JOptionPane.showInputDialog("Enter year");
		Scanner yearInput = new Scanner(year);
		int yearEntered = yearInput.nextInt();
		boolean leapYear = false;
		
		if (yearEntered % 400 == 0)
		{
			JOptionPane.showMessageDialog(null, "The year entered is a leap year");
		}
		else if (yearEntered % 100 == 0)
		{
			JOptionPane.showMessageDialog(null, "The year entered is not a leap year");
		}
		else if (yearEntered % 4 == 0)
		{
			JOptionPane.showMessageDialog(null, "The year entered is a leap year");
		}
	}
}
