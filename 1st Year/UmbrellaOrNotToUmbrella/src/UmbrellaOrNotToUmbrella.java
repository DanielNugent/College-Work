/* SELF ASSESSMENT 
   1. Did I use easy-to-understand meaningful variable names? 
       Mark out of 10: 10
   2. Did I format the variable names properly (in lowerCamelCase)? 
       Mark out of 10: 10
   3. Did I indent the code appropriately? 
       Mark out of 10: 10
   4. Did I read the input correctly from the user using appropriate questions? 
       Mark out of 20: 20
   5. Did I use an appropriate (i.e. not more than necessary) series of if statements? 
       Mark out of 30: 30
   6. Did I output the correct answer for each possibility in an easy to read format? 
       Mark out of 15: 15
   7. How well did I complete this self-assessment? 
       Mark out of 5: 5
   Total Mark out of 100 (Add all the previous marks): 100
*/
import javax.swing.JOptionPane;

public class UmbrellaOrNotToUmbrella {

	public static void main(String[] args) {
		
		int answer = JOptionPane.showConfirmDialog(null, "Is it raining?");
		boolean isRaining = (answer==JOptionPane.YES_OPTION);
		if (isRaining)
		{
			JOptionPane.showMessageDialog(null, "You should bring an umbrella and put it up");
		}
		else
		{
			answer = JOptionPane.showConfirmDialog(null, "Does it look like it may rain?");
			boolean mayRain = (answer==JOptionPane.YES_OPTION);
			if (mayRain)
			{
				JOptionPane.showMessageDialog
				(null, "You should take an umbrella but there is no need to put it up unless it rains");
			}
			else
			{
				JOptionPane.showMessageDialog(null, "It is not necessary to bring an umbrella");
			}
		}
	}
}
