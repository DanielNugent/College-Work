import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import java.util.Arrays;

/**	TIME IN NANOSECONDS
 *                      Insert(ns)  Quick(ns)   Merge Recursive(ns) Merge Iterative(ns) Selection(ns)
 * 10 random            11700		12400		8700				30300				3700
 * 100 random           54300		208200		47600				80200				85800
 * 1000 random          4760800		4928800		594600				174600				32224000
 * 1000 duplicates     	2102100		4823700		651000				306300				3675200
 * 1000 nearly ordered  1319800		4273300		689000				268700				3493000
 * 1000 reverse 	   `3526500		4619900		628000				253000				3136600
 * 1000 sorted          33800		3793500		598000				269000				3713400
 * 
 * (a) Which of the sorting algorithms does the order of input have an impact on? Why?
 * 
 * 		Insert sort - The more sorted the array, the less swaps occur.
 * 		Quick sort - By choosing a partition index the algortihm sorts the array for elements to be on eother side of the pivot, if the array is sorted already, 
 * 					 it will take considerably longer
 * 
 * 
 * (b) Which algorithm has the biggest difference between the best and worst performance, based on the type of input, for the input of size 1000? Why?
 * 
 * 		Insert sort - Depends on if the array is sorted already, if it is, insertion sort is of O(n), meanwhile it is of O(n^2) otherwise.
 * 
 * (c) Which algorithm has the best/worst scalability, i.e., the difference in performance time based on the input size? Please consider only input files with random order for this answer.
 * 		
 * 		Best:    Merge Iterative
 * 		Worst:   Selection
 * 
 * (d) Did you observe any difference between iterative and recursive implementations of merge sort?
 * 
 * 		Yes - Merge Iterative seems to scale and perform much better than the recursive implementation.
 * 
 * (e) Which algorithm is the fastest for each of the 7 input files?
 * 		10 random:           Selection
 * 		100 random:          Merge Iterative
 * 		1000 random:         Merge Recursive
 * 		1000 few unique:     Merge Iterative
 * 		1000 nearly ordered: Merge Iterative
 * 		1000 reverse order:  Merge Iterative
 * 		1000 sorted:         Insert
 */
/**
 * Test class for SortComparison.java
 *
 * @author Muhammad Rvail Naveed - 17321983
 * @version HT 2019
 */
@RunWith(JUnit4.class)
public class SortComparisonTest {
	// ~ Constructor ........................................................
	@Test
	public void testConstructor() {
		new SortComparison();
	}

	// ~ Public Methods ........................................................

	// ----------------------------------------------------------
	/**
	 * Check that the methods work for empty arrays
	 */
	@Test
	public void testEmpty() {
		double[] orig = new double[0];
		double[] empty = orig.clone();
		SortComparison.quickSort(empty);
		assertTrue(Arrays.equals(orig, empty));
		SortComparison.insertionSort(empty);
		assertTrue(Arrays.equals(orig, empty));
		SortComparison.mergeSortIterative(empty);
		assertTrue(Arrays.equals(orig, empty));
		SortComparison.mergeSortRecursive(empty);
		assertTrue(Arrays.equals(orig, empty));
		SortComparison.insertionSort(empty);
		assertTrue(Arrays.equals(orig, empty));
		SortComparison.selectionSort(empty);
		assertTrue(Arrays.equals(orig, empty));
	}

	@Test
	public void testUnsortedArray() {
		double[] a = new double[] { 65886.08, 66584.74, 57772.09, 98388.69, 35193.63, 97692.72, 68348.2, 28822.72,
				85294.16, 99877.76 };
		double[] result = new double[] { 28822.72, 35193.63, 57772.09, 65886.08, 66584.74, 68348.2, 85294.16, 97692.72,
				98388.69, 99877.76 };
		double[] reset = a.clone();
		assertTrue(Arrays.equals(SortComparison.quickSort(a), result));
		a = reset.clone();
		
		assertTrue(Arrays.equals(SortComparison.insertionSort(a), result));
		a = reset.clone();
		
		assertTrue(Arrays.equals(SortComparison.mergeSortRecursive(a), result));
		a = reset.clone();
		
		assertTrue(Arrays.equals(SortComparison.mergeSortIterative(a), result));
		a = reset.clone();
		
		assertTrue(Arrays.equals(SortComparison.selectionSort(a), result));
	}
}