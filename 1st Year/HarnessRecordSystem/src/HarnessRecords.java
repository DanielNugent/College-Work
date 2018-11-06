import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class HarnessRecords {
	private ArrayList<Harness> harnessList;
	final int MAKE_INDEX = 0;
	final int MODELNO_INDEX = 1;
	final int INSTRUCTOR_INDEX = 2;

	public HarnessRecords() {
		super();
		this.harnessList = new ArrayList<Harness>();
	}

	public HarnessRecords(File harnessRecords) {
		this();
		try {
			
			FileReader fr = new FileReader(harnessRecords);
			BufferedReader br = new BufferedReader(fr);
			boolean endOfFile = false;
			while (!endOfFile) {
				String harness = br.readLine();
				if (harness != null) {
					String[] harnesses = harness.split(", ");
					String make = harnesses[MAKE_INDEX];
					int modelNo = Integer.parseInt(harnesses[MODELNO_INDEX]);
					String instructor = harnesses[INSTRUCTOR_INDEX];
					Harness newHarness = new Harness(make, modelNo, instructor);
					harnessList.add(newHarness);
				} else {
					endOfFile = true;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public boolean isEmpty() {
		if (this.harnessList.size() <= 0) {
			return true;
		}
		return false;
	}

	public void addHarness(Harness harness) {
		Harness reference;
		for (int i = 0; i < harnessList.size(); i++) {
			reference = harnessList.get(i);
			if (harness.getMake().equals(reference.getMake()) && harness.getModelNo() == reference.getModelNo()) {
				System.out.print("\nHarness already exists!");
			} else {
				harnessList.add(harness);
			}
		}
	}

	public Harness findHarness(String make, int modelNo) {
		if (!isEmpty()) {
			for (int i = 0; i < harnessList.size(); i++) {
				Harness harness = harnessList.get(i);
				if (make.equals(harness.getMake()) && modelNo == harness.getModelNo()) {
					return harness;
				}
			}
		}
		return null;
	}

	public Harness checkHarness(String instructor, String make, int modelNo) {
		if (!isEmpty()) {
			Harness harness = findHarness(make, modelNo);
			if (!harness.isHarnessOnLoan()) {
				harness.checkHarness(instructor);
				return harness;
			}
		}
		return null;
	}

	public Harness loanHarness(String clubMember) {
		if (!isEmpty()) {
			for (int i = 0; i < harnessList.size(); i++) {
				Harness availableHarness = harnessList.get(i);
				if (availableHarness != null) {
					if (!availableHarness.isHarnessOnLoan()) {
						availableHarness.loanHarness(clubMember);
						return availableHarness;
					}
				}
			}
		}
		return null;
	}

	public Harness returnHarness(String make, int modelNo) {
		Harness harness = findHarness(make, modelNo);
		if (harness != null) {
			harness.returnHarness();
			return harness;
		} else {
			return null;
		}
	}

	public Harness removeHarness(String make, int modelNo) {
		Harness harness = findHarness(make, modelNo);
		for (int i = 0; i < harnessList.size(); i++) {
			if ((harness.getMake().equals(harnessList.get(i).getMake())
					&& (harness.getModelNo() == harnessList.get(i).getModelNo()))) {
				harnessList.remove(harness);
				return harness;
			}
		}
		return null;
	}

	public ArrayList<Harness> getHarnessList() {
		return harnessList;
	}
	
	public int getListSize() {
		return harnessList.size();
	}

	@Override
	public String toString() {
		return "HarnessRecords [harnessList=" + harnessList + "]";
	}
	
	
}
