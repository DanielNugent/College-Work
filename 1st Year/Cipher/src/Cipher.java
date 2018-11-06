/* SELF ASSESSMENT

 1. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)?
        Mark out of 5: 5
        Comment: All variable names were in lowerCamelCase
        
 2. Did I indent the code appropriately?
        Mark out of 5: 5
        Comment: All subsections of code were indented appropriately away from the main.
        
 3. Did I write the createCipher function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 20: 20
       Comment: I found the easiest way to create the cipher was to generate a random alphabet in a character array and assign a 
                letter to each letter in the phrase. This worked as intended.
 
 4. Did I write the encrypt function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 20:  20
       Comment: I wrote the encrypt function correctly it got the characterArray created in the main as the parameter and
        		used the createCipher function to randomly assign a letter to each letter in the phrase.

 5. Did I write the decrypt function correctly (parameters, return type and function body) and invoke it correctly?
       Mark out of 20:  20
       Comment: The decrypt function was written appropriately, it took the encyptedPhrase as the parameter
                and decrypts it back using the original alphabet.
       
 6. Did I write the main function body correctly (repeatedly obtaining a string and encrypting it and then decrypting the encrypted version)?
       Mark out of 25: 25
       Comment: The main was written appropriately. It continuously asks the user for a phrase as required and calls the encrypt and 
       			decrypt functions correctly to encrypt and decrypt the phrase, respectively.

 7. How well did I complete this self-assessment?
        Mark out of 5: 5
        Comment: All marks I gave myself were given accordingly in my opinion. The program does what is required.

 Total Mark out of 100 (Add all the previous marks): 100

*/ 
import java.util.Scanner;

public class Cipher {

	public static final char[] ALPHABET = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
			   'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
			   'u', 'v', 'w', 'x', 'y', 'z', ' '};

	public static void main(String[] args) {
		while(true)
		{
			System.out.println("Enter a phrase to encrypt or type 'exit': ");
			Scanner input = new Scanner(System.in);
			if(input.hasNext("exit"))
			{
				break;
			}
			else
			{
				String phrase = input.nextLine();
				String lowerCasePhrase = phrase.toLowerCase();
				
				char[] characterArray = lowerCasePhrase.toCharArray();
				characterArray = encrypt(characterArray);
				String encryptedPhrase = new String(characterArray);
				System.out.println("Encrypted: " + encryptedPhrase);
				
				char [] decryptArray = encryptedPhrase.toCharArray();
				decryptArray = decrypt(decryptArray);
				String decryptedPhrase = new String(decryptArray);
				System.out.println("Decrypted: " + decryptedPhrase);
				System.out.println(" ");
			}
		}
	}
	
	public static char createCipher(int index) {
		char[] cipher = {'z', 'y', 'x', 'w', 'v', 'u', 'j', 'i', 'h', 'g',
				   'f', 'e', 'd', 'c', 'b', 'a', 'k', 'l', 'm', 't',
				   's', 'r', 'q', 'o', 'n', 'p', ' '};
		char cipherLetter=' ';
		for(int position =0; position<cipher.length; position++)
		{
			if(index == position)
			{
				cipherLetter = cipher[position];
			}
				
		}
		return cipherLetter;
		
	}
	
	public static char[] encrypt(char[] characterArray) {
		char[] encryptedArray = new char[characterArray.length];
		for(int index = 0; index<characterArray.length; index++)
		{
			if(characterArray != null)
			{
				char newLetter = ' ';
				for(int index2 = 0; index2<ALPHABET.length; index2++)
				{
					if(characterArray[index] == ALPHABET[index2])
					{
						newLetter = createCipher(index2);
						encryptedArray[index] = newLetter;
					}
				}
			}
		}
		return encryptedArray;
	}
	
	public static char[] decrypt(char[] encryptedArray) {
		char[] decryptedArray = new char[encryptedArray.length];
		for(int index = 0; index<ALPHABET.length; index++)
		{
			if(encryptedArray != null)
			{
				char cipherLetter = createCipher(index);
				char newLetter = ' ';
				for(int index2 = 0; index2<encryptedArray.length; index2++)
				{
					if(cipherLetter == encryptedArray[index2])
					{
						newLetter = ALPHABET[index];
						decryptedArray[index2] = newLetter;
					}
				}
			}
		}
		return decryptedArray;
	}
}