import java.awt.EventQueue;

import javax.swing.JFrame;
import java.awt.event.ActionListener;
import java.io.File;
import java.awt.event.ActionEvent;
import java.awt.Button;
import java.awt.TextField;

public class GUI {
	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					GUI window = new GUI();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		
		File harnessList = new File("Harnesses.txt");
		HarnessRecords records = new HarnessRecords(harnessList);
		System.out.println(records.getHarnessList());
	}

	/**
	 * Create the application.
	 */
	public GUI() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 683, 448);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		Button removeHarness = new Button("Remove a Harness");
		removeHarness.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				TextField textField = new TextField();
				textField.setBounds(97, 241, 159, 50);
				frame.getContentPane().add(textField);
				
			}
		});
		removeHarness.setBounds(15, 164, 261, 61);
		frame.getContentPane().add(removeHarness);
		
		Button addRecord = new Button("Add Record for New Harness");
		addRecord.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		addRecord.setBounds(15, 52, 261, 61);
		frame.getContentPane().add(addRecord);
		
		Button recordCheck = new Button("Record Safety Check");
		recordCheck.setBounds(10, 297, 641, 61);
		frame.getContentPane().add(recordCheck);
		
		Button loanHarness = new Button("Loan a Harness");
		loanHarness.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
			}
		});
		loanHarness.setBounds(360, 52, 261, 61);
		frame.getContentPane().add(loanHarness);
		
		Button returnHarness = new Button("Return a Harness");
		returnHarness.setBounds(360, 164, 261, 61);
		frame.getContentPane().add(returnHarness);
		
		
	}
}
