
/*************************************************************************
 *  Binary Search Tree class.
 *  Adapted from Sedgewick and Wayne.
 *
 *  @version 3.0 1/11/15 16:49:42
 *
 *  @author TODO
 *
 *************************************************************************/

import java.util.NoSuchElementException;

public class BST<Key extends Comparable<Key>, Value> {
	private Node root; // root of BST

	/**
	 * Private node class.
	 */
	private class Node {
		private Key key; // sorted by key
		private Value val; // associated data
		private Node left, right; // left and right subtrees
		private int N; // number of nodes in subtree

		public Node(Key key, Value val, int N) {
			this.key = key;
			this.val = val;
			this.N = N;
		}
	}

	// is the symbol table empty?
	public boolean isEmpty() {
		return size() == 0;
	}

	// return number of key-value pairs in BST
	public int size() {
		return size(root);
	}

	// return number of key-value pairs in BST rooted at x
	private int size(Node x) {
		if (x == null)
			return 0;
		else
			return x.N;
	}

	/**
	 * Search BST for given key. Does there exist a key-value pair with given key?
	 *
	 * @param key
	 *            the search key
	 * @return true if key is found and false otherwise
	 */
	public boolean contains(Key key) {
		return get(key) != null;
	}

	/**
	 * Search BST for given key. What is the value associated with given key?
	 *
	 * @param key
	 *            the search key
	 * @return value associated with the given key if found, or null if no such key
	 *         exists.
	 */
	public Value get(Key key) {
		return get(root, key);
	}

	private Value get(Node x, Key key) {
		if (x == null)
			return null;
		int cmp = key.compareTo(x.key);
		if (cmp < 0)
			return get(x.left, key);
		else if (cmp > 0)
			return get(x.right, key);
		else
			return x.val;
	}

	/**
	 * Insert key-value pair into BST. If key already exists, update with new value.
	 *
	 * @param key
	 *            the key to insert
	 * @param val
	 *            the value associated with key
	 */
	public void put(Key key, Value val) {
		if (val == null) {
			delete(key);
			return;
		}
		root = put(root, key, val);
	}

	private Node put(Node x, Key key, Value val) {
		if (x == null)
			return new Node(key, val, 1);
		int cmp = key.compareTo(x.key);
		if (cmp < 0)
			x.left = put(x.left, key, val);
		else if (cmp > 0)
			x.right = put(x.right, key, val);
		else
			x.val = val;
		x.N = 1 + size(x.left) + size(x.right);
		return x;
	}

	/**
	 * Tree height.
	 *
	 * Asymptotic worst-case running time using Theta notation: TODO
	 *
	 * @return the number of links from the root to the deepest leaf.
	 *
	 *         Example 1: for an empty tree this should return -1. Example 2: for a
	 *         tree with only one node it should return 0. Example 3: for the
	 *         following tree it should return 2. B / \ A C \ D
	 */
	public int height() {
		return height(root);
	}

	private int height(Node x) {
		if (isEmpty()) {
			return -1;
		}
		if (size(x) == 1) {
			return 0;
		}
		if (x == null) {
			return 0;
		}
		return 1 + Math.max(height(x.left), height(x.right));
	}

	public int rank(Key key) {
		return rank(key, root);
	}

	private int rank(Key key, Node x) {
		int cmp = key.compareTo(x.key);
		if (cmp < 0)
			return rank(key, x.left);
		else if (cmp > 0)
			return 1 + size(x.left) + rank(key, x.right);
		else
			return size(x.left);
	}

	/**
	 * Median key. If the tree has N keys k1 < k2 < k3 < ... < kN, then their median
	 * key is the element at position (N+1)/2 (where "/" here is integer division)
	 *
	 * @return the median key, or null if the tree is empty.
	 */
	public Key median() {
		if (isEmpty())
			return null;
		// TODO fill in the correct implementation. The running time should be Theta(h),
		// where h is the height of the tree.

		int medianPos = (size(root) - 1) / 2;
		return median(root, medianPos);

	}

	private Key median(Node x, int medianPos) {
		int pos = rank(x.key);
		if (pos < medianPos) { // if the position is on the left side of the root
			return median(x.right, medianPos);
		} else if (pos > medianPos) { // if the position is on the right side of the root
			return median(x.left, medianPos);
		} else {
			return x.key;
		}
	}

	/**
	 * Print all keys of the tree in a sequence, in-order. That is, for each node,
	 * the keys in the left subtree should appear before the key in the node. Also,
	 * for each node, the keys in the right subtree should appear before the key in
	 * the node. For each subtree, its keys should appear within a parenthesis.
	 *
	 * Example 1: Empty tree -- output: "()" Example 2: Tree containing only "A" --
	 * output: "(()A())" Example 3: Tree: B / \ A C \ D
	 *
	 * output: "((()A())B(()C(()D())))"
	 *
	 * output of example in the assignment:
	 * (((()A(()C()))E((()H(()M()))R()))S(()X()))
	 *
	 * @return a String with all keys in the tree, in order, parenthesized.
	 */
	public String printKeysInOrder() {
		return printKeysInOrder(root);
	}

	private String printKeysInOrder(Node x) {
		if (x == null) {
			return "()";
		} else {
			return "(" + printKeysInOrder(x.left) + x.key + printKeysInOrder(x.right) + ")";
		}
	}

	/**
	 * Pretty Printing the tree. Each node is on one line -- see assignment for
	 * details.
	 *
	 * @return a multi-line string with the pretty ascii picture of the tree.
	 */
	public String prettyPrintKeys() {
		if (isEmpty()) {
			return "-null\n";
		}
		String outputStr = prettyPrint(root, "") + "\n";
		return outputStr;
	}

	private String prettyPrint(Node theNode, String stringOne) {
		String result = "";
		if (theNode == null) {
			result = stringOne + "-null";
		} else {
			result = stringOne + "-" + theNode.val + "\n" + prettyPrint(theNode.left, stringOne + " |") + "\n"
					+ prettyPrint(theNode.right, stringOne + "  ");
		}
		return result;
	}

	/**
	 * Deletes a key from a tree (if the key is in the tree). Note that this method
	 * works symmetrically from the Hibbard deletion: If the node to be deleted has
	 * two child nodes, then it needs to be replaced with its predecessor (not its
	 * successor) node.
	 *
	 * @param key
	 *            the key to delete
	 */
	public void delete(Key key) {
		delete(root, key);
	}

	private Node delete(Node root, Key key) {
		Node parent = null;
		Node current = root;

		// Search for key in bst
		while (current != null && current.key != key) {
			// update parent as current
			parent = current;
			if (key.compareTo(current.key) < 0) {
				current = current.left;
			} else {
				current = current.right;
			}
		}
		// if key not found
		if (current == null) {
			return root;
		}

		// 1) Node to be deleted has no children
		if (current.left == null && current.right == null) {
			if (current != root) {
				if (parent.left == current) {
					parent.left = null;
				} else {
					parent.right = null;
				}
			} else {
				root = null;
			}
		}

		// 2)Node to be deleted has two children
		else if (current.left != null && current.right != null) {
			Node predecessor = findPredecessor(root, current);
			Key preKey = predecessor.key;
			delete(root, predecessor.key);
			current.key = preKey;
		}

		// 3) node to to be deleted has only one child
		else {
			// find child
			Node child = (current.left != null) ? current.left : current.right;
			if (current != root) {
				if (current == parent.left) {
					parent.left = child;
				} else {
					parent.right = child;
				}
			} else {
				root = child;
			}
		}
		return root;
	}

	public Node findPredecessor(Node root, Node node) {
		if (node.left != null)
			return max(node.left);
		Node predecessor = null;

		while (root != null) {
			if (node.key == root.key) {
				break;
			} else if (node.key.compareTo(root.key) < 0) {
				root = root.left;
			} else if (node.key.compareTo(root.key) >= 0) {
				predecessor = root;
				root = root.right;
			}
		}
		return predecessor;
	}

	private Node max(Node root) {
		if (root.right == null) {
			return root;
		}
		return max(root.right);
	}
}
