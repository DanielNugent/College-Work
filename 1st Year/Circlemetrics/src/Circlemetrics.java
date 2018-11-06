import java.util.Scanner;

public class Circlemetrics {

	public static void main(String[] args) {
		while(true)
		{
			try 
			{
				System.out.print("Enter a number: ");
				Scanner input = new Scanner(System.in);
				int number = input.nextInt();
				String romanNumeral="";
				if(number<1||number>4999)
				{
					System.out.println("Invalid number");	
				}
				else
				{
					while(number>=1000)
					{
						romanNumeral+="M";
						number-=1000;
					}
					while(number>=500)
					{
						romanNumeral+="D";
						number-=500;
					}
					while(number>=100)
					{
						romanNumeral+="C";
						number-=100;
					}
					while(number>=50)
					{
						romanNumeral+="L";
						number-=50;
					}
					while(number>=10)
					{
						romanNumeral+="X";
						number-=10;
					}
					while(number>=9)
					{
						romanNumeral+="IX";
						number-=9;
					}
					while(number>=5)
					{
						romanNumeral+="V";
						number-=5;
					}
					while(number>=4)
					{
						romanNumeral+="IV";
						number-=4;
					}
					while(number>=1)
					{
						romanNumeral+="I";
						number-=1;
					}
					System.out.println("Roman numeral: " + romanNumeral);
				}
			}
			catch(java.util.InputMismatchException exception)
			{
				System.out.println("Invalid input");
			}
		}
	}
}
		