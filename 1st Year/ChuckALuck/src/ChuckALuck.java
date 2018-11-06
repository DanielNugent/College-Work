/* SELF ASSESSMENT

1. ResolveBet

    I have correctly defined ResolveBet which takes the bet type (String) and the Wallet object, and a void return type [Mark out of 7: 7].
    Comment: Correct parameters were used and nothing was returned because function is void.
    My program presents the amount of cash in the wallet and asks the user how much he/she would like to bet [Mark out of 8: 8].
    Comment: Every loop represents money in wallet left/initial money on the first run.
    My program ensures the bet amount is not greater than the cash in the wallet [Mark out of 5: 5].
    Comment: the if statement if(betAmount<=wallet.check()) in resolveBet ensures this.
    My program creates three Dice objects, rolls them and creates a total variable with a summation of the roll values returned [Mark out of 15: 15]..
    Comment: Created 3 dice objects die1, die2 and die 3. Rolled them all using the .roll() method in the dice class and summed the total using .topFace().
    My program determines the winnings by comparing the bet type with the total and comparing the bet type with the dice faces for the triple bet [Mark out of 20: 0].
    Comment: Program does do this to ensure a win
    My program outputs the results (win or loss) and adds the winnings to the wallet if user wins or removes the bet amount from the wallet if the user loses [Mark out of 10: 10 ].
    Comment: Amount is added/subtracted to wallet using .put() method in the wallet class as required.


2. Main

    I ask the user for the amount of cash he/she has, create a Wallet object and put this cash into it [Mark out of 15: 15]
    Comment: CReated a wallet using wallet class and placed user inputted cash amount into it using .put() method.
    My program loops continuously until the user either enters quit or the cash in the wallet is 0 [Mark out of 5: 5]
    Comment: Does this appropriately with the use of if statements.
    I ask the user to enter any of the four bet types or quit [Mark out of 5: 5].
    Comment: Asked user for a bet type or quit in the main.
    My program calls resolveBet for each bet type entered [Mark out of 5: 5].
    Comment: resolveBet is called each time the loop runs.
    At the end of the game my program presents a summary message regarding winnings and losses [Mark out of 5: 5]
    Comment: DOes gic=ve a summary once game has ended.


 Total Mark out of 100 (Add all the previous marks): 100
*/
import java.util.Scanner;

public class ChuckALuck {
	public static final double TRIPLE = 30.0;
	public static final double ALL_OTHER_BETS =1.0;
	public static final String TRIPLE_BET ="triple";
	public static final String FIELD ="field";
	public static final String HIGH ="high";
	public static final String LOW ="low";
	
	public static void main(String[] args) {
		boolean finished = false;
		System.out.print("Enter cash in your wallet: ");
		Scanner inputScanner = new Scanner(System.in);
		double money = inputScanner.nextDouble();
		Wallet wallet = new Wallet();
		wallet.put(money);
		while(finished==false)
		{
			if((wallet.check()==0))
			{
				finished = true;
				System.out.println("Initial cash in hand: "+ money);
				System.out.println("Cash in wallet: "+ wallet.check());
				break;
			}
			System.out.println("Place a bet (or enter 'quit' to end game): ");
			Scanner bet = new Scanner(System.in);
			if(bet.hasNext("quit"))
			{
				finished = true;
				System.out.println("Game Over.");
				System.out.println("Overall Summary: ");
				System.out.println("Initial cash in hand: "+ money);
				System.out.println("Cash in wallet: "+ wallet.check());
			}
			else 
			{
				String betType = bet.nextLine();
				resolveBet(betType, wallet);
			}	
		}
	}

	private static void resolveBet(String betType, Wallet wallet) {
		if(betType.equalsIgnoreCase(TRIPLE_BET)||betType.equalsIgnoreCase(LOW)||
				betType.equalsIgnoreCase(HIGH)||betType.equalsIgnoreCase(FIELD))
		{
			String winningBet;
			System.out.println("Amount of cash in wallet: " + wallet.check());
			System.out.println("How much would you like to bet? ");
			Scanner betScanner = new Scanner(System.in);
			double betAmount =betScanner.nextDouble();
			if (betAmount<=wallet.check())
			{
				Dice die1 = new Dice();
				Dice die2 = new Dice();
				Dice die3 = new Dice();
				int firstDiceFace = die1.roll();
				int secondDiceFace = die2.roll();
				int thirdDiceFace = die3.roll();
				int total = die1.topFace()+die2.topFace()+die3.topFace();
				boolean triple = false;
				if((firstDiceFace==secondDiceFace)&&(secondDiceFace==thirdDiceFace))
				{
					
					if((firstDiceFace!=1)&&(firstDiceFace!=6))
					{
						triple =true;
						winningBet = TRIPLE_BET;
						if(winningBet.equalsIgnoreCase(betType))
						{
							System.out.println("You won!");
							wallet.put((TRIPLE*betAmount)+betAmount);
						}
						else
						{
							System.out.println("You lost!");
							wallet.put(betAmount*(-1));
						}
					}
					
				}
				else if(((total)<8)||((total)>12))
				{
					winningBet = FIELD;
					if(winningBet.equalsIgnoreCase(betType))
					{
						System.out.println("You won!");
						wallet.put(( ALL_OTHER_BETS *betAmount)+betAmount);
					}
					else
					{
						System.out.println("You lost!");
						wallet.put(betAmount*(-1));
					}
				}
				else if(((total)>10)&&(triple==false))
				{
					winningBet = HIGH;
					if(winningBet.equalsIgnoreCase(betType))
					{
						System.out.println("You won!");
						wallet.put(( ALL_OTHER_BETS *betAmount)+betAmount);
					}
					else
					{
						System.out.println("You lost!");
						wallet.put(betAmount*(-1));
					}
				}
				else if(((total)<11)&&(triple==false))
				{
					winningBet = LOW;
					if(winningBet.equalsIgnoreCase(betType))
					{
						System.out.println("You won!");
						wallet.put(( ALL_OTHER_BETS *betAmount)+betAmount);
					}
					else
					{
						System.out.println("You lost!");
						wallet.put(betAmount*(-1));
					}
				}	
			}
			else 
			{
				System.out.println("You do not enough cash in your wallet. :(");
			}
		}
		else
		{
			System.out.println("Invalid bet input. Please choose between [triple, field, high, low]");
		}
	}

}
