
public class Harness {
	private String make;
	private int modelNo;
	private int timesUsed;
	private String instructor;
	private boolean onLoan;
	private String personWhoLoaned;
	private final int MAX_TIMES_CAN_BE_USED = 25;

	public Harness(String make, int modelNo, int timesUsed, String instructor, boolean onLoan, String personWhoLoaned) {
		super();
		this.make = make;
		this.modelNo = modelNo;
		this.timesUsed = timesUsed;
		this.instructor = instructor;
		this.onLoan = onLoan;
		this.personWhoLoaned = personWhoLoaned;
	}

	public Harness(String make, int modelNo, String instructor) {
		this.make = make;
		this.modelNo = modelNo;
		this.instructor = instructor;
		this.personWhoLoaned = null;
		this.timesUsed = 0;
		this.onLoan = false;
	}

	public void checkHarness(String instructor) {
		if (instructor != null) {
			if (this.onLoan == false) {
				this.timesUsed = 0;
				this.instructor = instructor;
			}
		} else {
			throw new NullPointerException();
		}
	}

	public boolean isHarnessOnLoan() {
		return this.onLoan;
	}

	public boolean canHarnessBeLoaned() {
		if (!this.isHarnessOnLoan()) {
			if (this.timesUsed < MAX_TIMES_CAN_BE_USED) {
				return true;
			} else {
				return false;
			}
		} else
			return false;
	}

	public void loanHarness(String personWhoLoaned) {
		if (personWhoLoaned != null) {
			if (this.canHarnessBeLoaned()) {
				this.onLoan = true;
				this.personWhoLoaned = personWhoLoaned;
			}
		} else {
			throw new NullPointerException();
		}
	}

	public void returnHarness() {
		if (this.isHarnessOnLoan() == true) {
			this.onLoan = false;
		} else {
			throw new NullPointerException();
		}
	}

	@Override
	public String toString() {
		return "Harness [Make=" + make + ", ModelNumber=" + modelNo + ", Times Used=" + timesUsed + ", Instructor="
				+ instructor + ", On Loan=" + onLoan + ", Member who Loaned=" + personWhoLoaned + "]";
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public int getModelNo() {
		return modelNo;
	}

	public void setModelNo(int modelNo) {
		this.modelNo = modelNo;
	}

	public int getTimesUsed() {
		return timesUsed;
	}

	public void setTimesUsed(int timesUsed) {
		this.timesUsed = timesUsed;
	}

	public String getInstructor() {
		return instructor;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}

	public boolean isOnLoan() {
		return onLoan;
	}

	public void setOnLoan(boolean onLoan) {
		this.onLoan = onLoan;
	}

	public String getPersonWhoLoaned() {
		return personWhoLoaned;
	}

	public void setPersonWhoLoaned(String personWhoLoaned) {
		this.personWhoLoaned = personWhoLoaned;
	}

}
