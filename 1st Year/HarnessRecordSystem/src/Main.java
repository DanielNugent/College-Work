/* SELF ASSESSMENT

Harness Class: Member variables (8 marks):8
All my data members are declared, private and the ones that don't change are marked as private. I also have a constant for the maximum number of uses of a harness.
Comment: DEclared all member variables private and have relevant max use constant.

Harness Class: Harness constructor 1 & constructor 2 (6 marks):6
I initialise all the variables using the parameters given and set the other members to reasonable default values.
Comment: The variables not used in the second constructor are set to null or false as appropriate.

Harness Class: checkHarness method (5 marks):6
My method takes an instructor's name as a parameter, and if the harness is not on loan sets the instructor member variable to the given parameter value (assuming the instructor's name is not null/empty). It also resets the number of times the harness was used.
Comment: Presuming harness is not on loan and safety instructor name is not null the method sets the instructor as the last checking instructor and resets the times used variable to 0.

Harness Class: isHarnessOnLoan method (2 marks):2
My method has no parameters and returns the value of the loan status variable.
Comment: Has no parameters and returns this.onLoan.

Harness Class: canHarnessBeLoaned method (4 marks):4
My method has no parameters and returns true if the harness is not on loan and if the number of times it was used is less than the maximum allowed number of times.
Comment: Will return true appropriately if the conditions above are met. Takes no parameters.

Harness Class: loanHarness method (6 marks):6
My method has a member name as a parameter and it checks if harness can be loaned by using the canHarnessBeLoaned method. If true, it sets the club member value to the parameter value, sets the on loan status to true and increments the number of times used variable.
Comment: Checks using appropriate method and loans the harness by setting this.personWhoLoaned to the member name passed in.
 
Harness Class: returnHarness method (5 marks):5
My method has no parameters, checks if the harness is on loan, and if so, changes its on-loan status to false, and resets the club member value.
Comment: Does the above accordingly.

Harness Class: toString method (3 marks):3
My method returns a String representation of all the member variables.
Comment: Returns an appropriate string value with info about harness.

HarnessRecords Class: member variables (3 marks):3
I declare the member variable as a private collection of Harnesses
Comment: ArrayList is declared private.

HarnessRecords Class: HarnessRecords constructor 1 & 2 (9 marks):9
In the first constructor, I set the member variable to null [1 mark]. In the second constructor, I use the Java I/O to read data from a text file I created containing sets of Harness characteristics. I use these set of characteristics to create Harness objects and add them to the collection.
Comment: In the first constructor member variable is set to null. And the second constructor makes a call to the first by using this() and then uses the java I/O to read a text file and add harnesses to collection.

HarnessRecords Class: isEmpty method (1 marks):1
I return true if the collection is null/empty and, false otherwise.
Comment: Returns correct boolean value.

HarnessRecords Class: addHarness method (5 marks):5
My method takes a Harness object as a parameter and adds the harness to the collection.
Comment: Assuming that the harness does not already exist in the collection, the harness object will be added to the collection, otherwise it will not be.

HarnessRecords Class: findHarness method (6 marks):6
My method takes a make and model number as parameters. It checks if a harness with such properties exists and if it does it returns harness object, otherwise returns null.
Comment: Uses for loop to go through the collection and check if that harness exists, if it does it is returned otherwise a null value is returned.

HarnessRecords Class: checkHarness method (6 marks):6
must take instructor name, make and model number as parameters and return a Harness. If a harness with the make and model number exists by using the findHarness method and is not on loan, the Harness method checkHarness is called with the instructor name as a parameter and the updated Harness object is returned. If the harness is not available returns null.
Comment:

HarnessRecords Class: loanHarness method (7 marks):7
My method takes a club member name as a parameter and looks for an available harness by calling the method canHarnessBeLoaned be loaned. If an available harness is found it is loaned by using the Harness method loanHarness with the club member as a parameter, returning the harness. If there's no available harness null is returned.
Comment: Calls relevant functions and loans harness appropriately.

HarnessRecords Class: returnHarness method (7 marks):7
My method takes a make and model number as parameters. It checks if a harness with those properties exists by using the findHarness method. If the found harness is not null, it returns the harness object by using Harness method returnHarness, otherwise returns null.
Comment: Takes correct parameters, uses findHarness and if found and it was on loan it will be returned.

HarnessRecords Class: removeHarness method (8 marks):8
My method takes a make and model number as parameters and check the collection for a harness with those properties and removes it. It returns the harness object if it is found, otherwise returns null.
Comment: Using the parameters removes harness and returns harness that was removed otherwise returns null.

GUI (Java main line) (5 marks):5
My test class has a menu which implements at least the five points specified using the HarnessRecords class methods.
Comment: Switch statement to handle 5 queries.

*/
import java.io.File;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		File harnesses = new File("harnesses.txt");
		HarnessRecords records = new HarnessRecords(harnesses);

		boolean finished = false;
		while (!finished) {
			System.out.println(
					"What would you like to do?\nEnter 1 to add a record for a new harness\nPress 2 to remove a harness from the club"
							+ " \nPress 3 to record a safety check \nPress 4 to loan a harness"
							+ "\nPress 5 to return a harness");
			Scanner scanner = new Scanner(System.in);
			if (scanner.hasNext("quit")) {
				System.out.println("You have quit the program.");
				finished = true;
			} else {
				int input = scanner.nextInt();
				int model;
				String make;
				String instructor;
				String name;
				Harness harness;
				if (input >= 1 && input <= 5) {
					switch (input) {
					case 1:
						System.out.println("You have decided to add a record for a newly purchased harness"
								+ " \nWhat is the make of this harness?");
						make = scanner.next();
						System.out.println("What is the model number of this harness?");
						model = scanner.nextInt();
						harness = new Harness(make, model, 0, null, false, null);
						records.addHarness(harness);
						System.out.println(harness.toString());
						break;
					case 2:
						System.out.println("You have decided to remove a climbing harness from the club"
								+ " \nWhat is the make of this harness?");
						make = scanner.next();
						System.out.println("What is the model number of this harness?");
						model = scanner.nextInt();
						records.removeHarness(make, model);
						break;
					case 3:
						System.out.println(
								"You have decided to record the fact that a club instructor has checked the safety of a harness."
										+ " \nWhat is the make of this harness?");
						make = scanner.next();
						System.out.println("What is the model number of this harness?");
						model = scanner.nextInt();
						System.out.println("Who checked the safety?");
						instructor = scanner.nextLine();
						harness = records.checkHarness(instructor, make, model);
						if (harness != null) {
							System.out.println(harness.toString());
						} else {
							System.out.println("This harness does not exist.");
						}
						break;
					case 4:
						System.out.println(
								"You have decided to loan a harness to a club member is there is an available harness."
										+ " \nWhat is the name of the club member?");
						name = scanner.nextLine();
						harness = records.loanHarness(name);
						if (harness != null) {
							System.out.println(harness.toString());
						} else {
							System.out.println("There are no available harnesses");
						}
						break;
					case 5:
						System.out.println(
								"You have decided to return a harness which is no longer in use by a club member."
										+ " \nWhat is the make of this harness?");
						make = scanner.next();
						System.out.println("What is the model number of this harness?");
						model = scanner.nextInt();
						harness = records.returnHarness(make, model);
						if (harness != null) {
							System.out.println(harness.toString());
						} else {
							System.out.println("This harness does not exist");
						}
						break;
					default:
						System.out.println("This is not a valid option");
						break;

					}
				}
			}
		}
	}
}
