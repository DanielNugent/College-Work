import java.util.Iterator;
import java.util.ListIterator;
import java.util.NoSuchElementException;

// -------------------------------------------------------------------------
/**
 *  This class contains the methods of Doubly Linked List.
 *
 *  @author Muhammad Rvail Naveed - 17321983
 *  @version 17/10/18 17:35:49
 */

/**
 * Class DoublyLinkedList: implements a *generic* Doubly Linked List.
 *
 * @param <T>
 *            This is a type parameter. T is used as a class name in the
 *            definition of this class.
 *
 *            When creating a new DoublyLinkedList, T should be instantiated
 *            with an actual class name that extends the class Comparable. Such
 *            classes include String and Integer.
 *
 *            For example to create a new DoublyLinkedList class containing
 *            String data: DoublyLinkedList<String> myStringList = new
 *            DoublyLinkedList<String>();
 *
 *            The class offers a toString() method which returns a
 *            comma-separated sting of all elements in the data structure.
 *
 *            This is a bare minimum class you would need to completely
 *            implement. You can add additional methods to support your code.
 *            Each method will need to be tested by your jUnit tests -- for
 *            simplicity in jUnit testing introduce only public methods.
 */
class DoublyLinkedList<T extends Comparable<T>> {
	/**
	 * private class DLLNode: implements a *generic* Doubly Linked List node.
	 */
	private class DLLNode {
		public final T data; // this field should never be updated. It gets its
		// value once from the constructor DLLNode.
		public DLLNode next;
		public DLLNode prev;

		/**
		 * Constructor
		 *
		 * @param theData
		 *            : data of type T, to be stored in the node
		 * @param prevNode
		 *            : the previous Node in the Doubly Linked List
		 * @param nextNode
		 *            : the next Node in the Doubly Linked List
		 * @return DLLNode
		 */
		public DLLNode(T theData, DLLNode prevNode, DLLNode nextNode) {
			data = theData;
			prev = prevNode;
			next = nextNode;
		}
	}

	// Fields head and tail point to the first and last nodes of the list.
	private DLLNode head, tail;

	/**
	 * Constructor of an empty DLL
	 *
	 * @return DoublyLinkedList
	 */
	public DoublyLinkedList() {
		head = null;
		tail = null;
	}

	/**
	 * Tests if the doubly linked list is empty
	 *
	 * @return true if list is empty, and false otherwise
	 *
	 *         Worst-case asymptotic running time cost: Theta(1)
	 *
	 *         Justification: Only consists of a single statement. No loops. Constant run time. We know that this method will
	 *         only ever run for the head node.
	 */
	public boolean isEmpty() {
		return head == null;
	}

	/**
	 * Inserts an element in the doubly linked list
	 *
	 * @param pos
	 *            : The integer location at which the new data should be
	 *            inserted in the list. We assume that the first position in the
	 *            list is 0 (zero). If pos is less than 0 then add to the head
	 *            of the list. If pos is greater or equal to the size of the
	 *            list then add the element at the end of the list.
	 * @param data
	 *            : The new data of class T that needs to be added to the list
	 * @return none
	 *
	 *         Worst-case asymptotic running time cost: O(n)
	 *
	 *         Justification: Worst case program will go into for loop and have to check n elements to find the elemtn at pos.
	 *         checking n elemtents in a loop = O(n). We dont know for how many nodes the code will run for so we use big-oh.
	 */
	public void insertBefore(int pos, T data) {
		DLLNode node;
		int count = 0;
		// insert at head
		if (pos <= 0) {
			if (head != null) {
				node = new DLLNode(data, null, head);
				head.prev = node;
				head = node;
			}
			if (head == null) {
				node = new DLLNode(data, null, null);
				head = node;
				tail = node;
				// head.prev = null;
				// tail.prev = head;
				// tail.next = null;
			}
		}

		// insert at tail
		if (pos >= getSize()) {
			node = new DLLNode(data, tail, null);
			if (tail != null) {
				tail.next = node;
				tail = node;
			}
			if (tail == null) {
				tail = node;
				head = node;
			}
		}

		// insert somewhere in the middle
		else {
			if (pos > 0 && pos < getSize()) {
				for (DLLNode current = head; current != null; current = current.next) {
					if (count == pos) {
						node = new DLLNode(data, current.prev, current);
						// current.prev = node;
						current.prev.next = node;
						// node.next = current;
						current.prev = node;
					}
					count++;
				}
			}
		}

	}

	/**
	 * Returns the data stored at a particular position
	 *
	 * @param pos
	 *            : the position
	 * @return the data at pos, if pos is within the bounds of the list, and
	 *         null otherwise.
	 *
	 *         Worst-case asymptotic running time cost: O(n)
	 *
	 *         Justification: Worst case program will go into for loop and have to check n elements to find the element at pos.
	 *         checking n elements in a loop = O(n). We dont know for how many nodes the code will run for so we use big-oh.
	 *
	 */
	public T get(int pos) {
		int count = 0;
		if (pos >= 0 && pos <= getSize() - 1) {
			for (DLLNode current = head; current != null; current = current.next) {
				if (count == pos) {
					return current.data;
				}
				count++;
			}
		}
		return null;
	}

	/**
	 * Deletes the element of the list at position pos. First element in the
	 * list has position 0. If pos points outside the elements of the list then
	 * no modification happens to the list.
	 *
	 * @param pos
	 *            : the position to delete in the list.
	 * @return true : on successful deletion, false : list has not been
	 *         modified.
	 *
	 *         Worst-case asymptotic running time cost: O(n)
	 *         Justification: Worst case program will go into for loop and have to check n elements to find the elemtn at pos.
	 *         checking n elemtents in a loop = O(n). We dont know for how many nodes the code will run for so we use big-oh.
	 */
	public boolean deleteAt(int pos) {
		if (!isEmpty()) {
			int count = 0;
			if (pos > 0 && getSize() == 1) {
				return false;
			}
			if (pos > getSize() - 1) {
				return false;
			}
			if (pos == 0 && getSize() == 1) {
				head = null;
				tail = null;
				return true;
			}
			if (pos >= 0 && pos <= getSize()) {
				if (pos == 0 && head != null) {
					head = head.next;
					// head.prev = null;
					return true;
				}
				if (pos == getSize() - 1 && tail != null) {
					tail = tail.prev;
					tail.next = null;
					return true;
				} else {
					for (DLLNode current = head; current != null; current = current.next) {
						if (count == pos) {
							current.prev.next = current.next;
							current.next.prev = current.prev;
							return true;
						}
						count++;
					}
				}
			}
		}
		return false;
	}

	/**
	 * Reverses the list. If the list contains "A", "B", "C", "D" before the
	 * method is called Then it should contain "D", "C", "B", "A" after it
	 * returns.
	 *
	 * Worst-case asymptotic running time cost: O(n)
	 *
	 * Justification: Worst case program will go into for loop and have to check n elements to find the elemtn at pos.
	 *         checking n elemtents in a loop = O(n). We dont know for how many nodes the code will run for so we use big-oh.
	 */
	public void reverse() {
		DLLNode temp = null;
		DLLNode current = head;
		if (!isEmpty()) {
			if (getSize() == 1) {
				return;
			}
			while (current != null) {
				temp = current.prev;
				current.prev = current.next;
				current.next = temp;
				current = current.prev;
			}
			if (temp != null) {
				head = temp.prev;
			}
		}
	}

	/**
	 * Removes all duplicate elements from the list. The method should remove
	 * the _least_number_ of elements to make all elements uniqueue. If the list
	 * contains "A", "B", "C", "B", "D", "A" before the method is called Then it
	 * should contain "A", "B", "C", "D" after it returns. The relative order of
	 * elements in the resulting list should be the same as the starting list.
	 *
	 * Worst-case asymptotic running time cost: O(n^2)
	 *
	 * Justification: Worst case program will go into for loop with a nested for loop
	 *  and have to check n elements each in the list to find the duplicates.
	 */
	public void makeUnique() {
		DLLNode current, index, temp;
		// Check if list is empty
		if (isEmpty()) {
			return;
		} else {
			// initially, current will point to head
			for (current = head; current != null; current = current.next) {
				// index will point to node next to current
				for (index = current.next; index != null; index = index.next) {
					if (current.data == index.data) {
						// store duplicate in temp
						temp = index;
						if (temp == tail) {
							tail = tail.prev;
							tail.next = null;
						} else {
							// index's prev node will point to node next to
							// index
							// thus, removing duplicate node
							index.prev.next = index.next;
							if (index.next != null) {
								index.next.prev = index.prev;
								// delete duplicate by making temp = null
								temp = null;
							}
						}
					}
				}
			}
		}
	}

	/**
	 * This method adds an element to the data structure. How exactly this will
	 * be represented in the Doubly Linked List is up to the programmer.
	 *
	 * @param item
	 *            : the item to push on the stack
	 *
	 *            Worst-case asymptotic running time cost: Theta(1)
	 *
	 *            Justification: Only consists of statements. No loops. Constant run time
	 */
	public void push(T item) {
		DLLNode node = new DLLNode(item, null, head);
		if (item != null) {
			if (head == null) {
				head = node;
				tail = node;
			} else {
				head.prev = node;
				head = node;
			}
		}
	}

	/*----------------------- STACK API
	 * If only the push and pop methods are called the data structure should behave like a stack.
	 */

	/**
	 * This method returns and removes the element that was most recently added
	 * by the push method.
	 *
	 * @return the last item inserted with a push; or null when the list is
	 *         empty.
	 *
	 *         Worst-case asymptotic running time cost: Theta(1)
	 *
	 *         Justification: Only consists of statements. No loops. Constant run time
	 */
	public T pop() {
		DLLNode removed = head;
		if (head != null && head.next != null) {
			head = head.next;
			head.prev = null;
			return removed.data;
		}
		if (getSize() == 1) {
			head = null;
			return removed.data;
		}
		return null;
	}

	/**
	 * This method adds an element to the data structure. How exactly this will
	 * be represented in the Doubly Linked List is up to the programmer.
	 *
	 * @param item
	 *            : the item to be enqueued to the stack
	 *
	 *            Worst-case asymptotic running time cost: Theta(1)
	 *
	 *            Justification: Only consists of statements. No loops. Constant run time
	 */
	public void enqueue(T item) {
		DLLNode node = new DLLNode(item, tail, null);
		if (item != null) {
			if (tail == null) {
				tail = node;
				head = node;
			} else {
				tail.next = node;
				tail = node;
			}
		}
	}

	/*----------------------- QUEUE API
	 * If only the enqueue and dequeue methods are called the data structure should behave like a FIFO queue.
	 */

	/**
	 * This method returns and removes the element that was least recently added
	 * by the enqueue method.
	 *
	 * @return the earliest item inserted with an enqueue; or null when the list
	 *         is empty.
	 *
	 *         Worst-case asymptotic running time cost: Theta(1)
	 *
	 *         Justification: Only consists of statements. No loops. Constant run time
	 */
	public T dequeue() {
		if (!isEmpty()) {
			T data = head.data;
			if (head != null) {
				head = head.next;
				// head.prev = null;
				return data;
			}
			if (getSize() == 1) {
				head = null;
				tail = null;
				return data;
			}
		}
		return null;
	}

	/**
	 * @return a string with the elements of the list as a comma-separated list,
	 *         from beginning to end
	 *
	 *         Worst-case asymptotic running time cost: Theta(n)
	 *
	 *         Justification: We know from the Java documentation that
	 *         StringBuilder's append() method runs in Theta(1) asymptotic time.
	 *         We assume all other method calls here (e.g., the iterator methods
	 *         above, and the toString method) will execute in Theta(1) time.
	 *         Thus, every one iteration of the for-loop will have cost
	 *         Theta(1). Suppose the doubly-linked list has 'n' elements. The
	 *         for-loop will always iterate over all n elements of the list, and
	 *         therefore the total cost of this method will be n*Theta(1) =
	 *         Theta(n).
	 */
	public String toString() {
		StringBuilder s = new StringBuilder();
		boolean isFirst = true;

		// iterate over the list, starting from the head
		for (DLLNode iter = head; iter != null; iter = iter.next) {
			if (!isFirst) {
				s.append(",");
			} else {
				isFirst = false;
			}
			s.append(iter.data.toString());
		}
		return s.toString();
	}

	public int getSize() {
		int size = 0;
		DLLNode node = head;
		while (node != null) {
			size++;
			node = node.next;
		}
		return size;
	}
}
