 /*  SELF ASSESSMENT 
      Muhammad Rvail Naveed

	1. Did I use appropriate CONSTANTS instead of numbers within the code? 
       Mark out of 10:   10 
   2. Did I use easy-to-understand, meaningful CONSTANT names? 
       Mark out of 5:   5
    3. Did I format the CONSTANT names properly (in UPPERCASE)? 
       Mark out of 5:   5
   4. Did I use easy-to-understand meaningful variable names? 
       Mark out of 10:   10
   5. Did I format the variable names properly (in lowerCamelCase)? 
       Mark out of 10:   10
   6. Did I indent the code appropriately? 
       Mark out of 10:   8
   7. Did I read the input correctly from the user using (an) appropriate question(s)? 
       Mark out of 10:   10
   8. Did I compute the answer correctly for all cases? 
       Mark out of 20:   20
   9. Did I output the correct answer in the correct format (as shown in the examples)? 
       Mark out of 10:   10
   10. How well did I complete this self-assessment? 
       Mark out of 10:   8
   Total Mark out of 100 (Add all the previous marks): 96  
*/ 

import java.util.Scanner;
import java.text.NumberFormat;
import javax.swing.JOptionPane;

public class Currencyconverter {
	public static final int OLD_PENNEY_NEW_PENNEY = 67;
	public static final int OLD_SHILLING_OLD_PENNEY = 12;
	public static final int OLD_POUND_OLD_SHILLING = 20;
	public static final int NEW_POUND_NEW_PENNEY = 100;

	public static void main(String[] args) {
		String oldPounds = JOptionPane.showInputDialog("Enter amount of old pounds");
		Scanner poundInput = new Scanner(oldPounds);
		int poundsEntered = poundInput.nextInt();
		String oldShillings = JOptionPane.showInputDialog("Enter amount of old shillings");
		Scanner shillingInput = new Scanner(oldShillings);
		int shillingsEntered = shillingInput.nextInt();
		String oldPennies= JOptionPane.showInputDialog("Enter amount of old pennies");
		Scanner pennyInput = new Scanner(oldPennies);
		int penniesEntered = pennyInput.nextInt();
		
		double totalNewPence = (double) (penniesEntered*OLD_PENNEY_NEW_PENNEY)+
        (shillingsEntered *OLD_SHILLING_OLD_PENNEY * OLD_PENNEY_NEW_PENNEY)
		+(poundsEntered * OLD_POUND_OLD_SHILLING * OLD_SHILLING_OLD_PENNEY * OLD_PENNEY_NEW_PENNEY);
		double totalNewPounds = (double) (totalNewPence / NEW_POUND_NEW_PENNEY);
		NumberFormat nF = NumberFormat.getInstance();
		nF.setMinimumFractionDigits(2);
		nF.setMaximumFractionDigits(2);

		JOptionPane.showMessageDialog(null, poundsEntered + " old pounds, " + shillingsEntered +
		" old shillings and " + penniesEntered + " old pence = " + "£" + nF.format(totalNewPounds));
	}
}
