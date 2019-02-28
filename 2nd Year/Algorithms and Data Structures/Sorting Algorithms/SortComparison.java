import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

// -------------------------------------------------------------------------

/**
 * This class contains static methods that implementing sorting of an array of
 * numbers using different sort algorithms.
 *
 * @author Muhammad Rvail Naveed - 17321983
 * @version HT 2019
 */

class SortComparison {

	/**
	 * Sorts an array of doubles using InsertionSort. This method is static, thus it
	 * can be called as SortComparison.sort(a)
	 * 
	 * @param a:
	 *            An unsorted array of doubles.
	 * @return array sorted in ascending order.
	 *
	 */

	static double[] insertionSort(double a[]) {
		int length = a.length;

		for (int i = 1; i < length; i++) {
			double current = a[i];
			int j = i - 1;

			while (j >= 0 && a[j] > current) {
				a[j + 1] = a[j];
				j = j - 1;
			}
			a[j + 1] = current;
		}
		return a;
	}// end insertionsort

	/**
	 * Sorts an array of doubles using Quick Sort. This method is static, thus it
	 * can be called as SortComparison.sort(a)
	 * 
	 * @param a:
	 *            An unsorted array of doubles.
	 * @return array sorted in ascending order
	 *
	 */
	static double[] quickSort(double a[]) {
		quickSort(a, 0, a.length - 1);
		return a;
	}

	static void quickSort(double a[], int low, int high) {
		if (low < high) {
			int pi = partition(a, low, high);

			quickSort(a, low, pi - 1);
			quickSort(a, pi + 1, high);
		}
	}// end quicksort

	// get pivot
	static int partition(double a[], int low, int high) {
		double pivot = a[high];
		int i = (low - 1); // index of smaller element
		for (int j = low; j < high; j++) {
			if (a[j] <= pivot) {
				i++;
				// swap arr[i] and arr[j]
				double temp = a[i];
				a[i] = a[j];
				a[j] = temp;
			}
		}

		// swap arr[i+1] and arr[high] (or pivot)
		double temp = a[i + 1];
		a[i + 1] = a[high];
		a[high] = temp;

		return i + 1;
	}

	/**
	 * Sorts an array of doubles using Merge Sort. This method is static, thus it
	 * can be called as SortComparison.sort(a)
	 * 
	 * @param a:
	 *            An unsorted array of doubles.
	 * @return array sorted in ascending order
	 *
	 */
	/**
	 * Sorts an array of doubles using iterative implementation of Merge Sort. This
	 * method is static, thus it can be called as SortComparison.sort(a)
	 *
	 * @param a:
	 *            An unsorted array of doubles.
	 * @return after the method returns, the array must be in ascending sorted
	 *         order.
	 */

	static double[] mergeSortIterative(double a[]) {
		int length = a.length;
		double temp[] = new double[length];
		for (int i = 1; i < length; i = i + i)
			for (int lo = 0; lo < length - i; lo += i + i)
				merge(a, temp, lo, lo + i - 1, Math.min(lo + i + i - 1, length - 1));
		return a;
	}// end mergesortIterative

	/**
	 * Sorts an array of doubles using recursive implementation of Merge Sort. This
	 * method is static, thus it can be called as SortComparison.sort(a)
	 *
	 * @param a:
	 *            An unsorted array of doubles.
	 * @return after the method returns, the array must be in ascending sorted
	 *         order.
	 */
	static double[] mergeSortRecursive(double a[]) {
		int length = a.length;
		double temp[] = new double[length];
		mergeSortRecursive(a, temp, 0, a.length - 1);
		return a;
	}// end mergeSortRecursive

	static void mergeSortRecursive(double a[], double temp[], int lo, int hi) {
		if (hi <= lo) {
			return;
		}
		int mid = lo + (hi - lo) / 2;
		mergeSortRecursive(a, temp, lo, mid);
		mergeSortRecursive(a, temp, mid + 1, hi);
		merge(a, temp, lo, mid, hi);
	}

	static void merge(double a[], double temp[], int lo, int mid, int hi) {
		for (int k = lo; k <= hi; k++) {
			temp[k] = a[k];
		}
		int i = lo;
		int j = mid + 1;
		for (int k = lo; k <= hi; k++) {
			if (i > mid)
				a[k] = temp[j++];
			else if (j > hi)
				a[k] = temp[i++];
			else if (temp[j] < temp[i])
				a[k] = temp[j++];
			else
				a[k] = temp[i++];
		}
	}

	/**
	 * Sorts an array of doubles using Selection Sort. This method is static, thus
	 * it can be called as SortComparison.sort(a)
	 * 
	 * @param a:
	 *            An unsorted array of doubles.
	 * @return array sorted in ascending order
	 *
	 */
	static double[] selectionSort(double a[]) {
		for (int i = 0; i < (a.length) - 1; i++) {
			int min_index = i;
			// find location of min value in subarray
			for (int j = i + 1; j < a.length; j++) {
				if (a[j] < a[min_index]) {
					min_index = j;
				}
			}
			// swap value at a[min_index] with value at a[i]
			double tmp = a[min_index];
			a[min_index] = a[i];
			a[i] = tmp;
		}
		return a;
	}// end selectionsort


}// end class
