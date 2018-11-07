import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertNull;
import org.junit.Test;
import org.junit.Ignore;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

//-------------------------------------------------------------------------
/**
*  Test class for Doubly Linked List
*
*  @author  Muhammad Rvail Naveed - 17321983
*  @version 17/10/18 18:15
*/
@RunWith(JUnit4.class)
public class DoublyLinkedListTest {

    //~ Constructor ........................................................
    @Test
    public void testConstructor()
    {
      new DoublyLinkedList<Integer>();
    }

    //~ Public Methods ........................................................

    // ----------------------------------------------------------
    /**
     * Check if the insertBefore works
     */
    @Test
    public void testInsertBefore()
    {
        // test non-empty list
        DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(0,1);
        testDLL.insertBefore(1,2);
        testDLL.insertBefore(2,3);

        testDLL.insertBefore(0,4);
        assertEquals( "Checking insertBefore to a list containing 3 elements at position 0", "4,1,2,3", testDLL.toString() );
        testDLL.insertBefore(1,5);
        assertEquals( "Checking insertBefore to a list containing 4 elements at position 1", "4,5,1,2,3", testDLL.toString() );
        testDLL.insertBefore(2,6);       
        assertEquals( "Checking insertBefore to a list containing 5 elements at position 2", "4,5,6,1,2,3", testDLL.toString() );
        testDLL.insertBefore(-1,7);        
        assertEquals( "Checking insertBefore to a list containing 6 elements at position -1 - expected the element at the head of the list", "7,4,5,6,1,2,3", testDLL.toString() );
        testDLL.insertBefore(7,8);        
        assertEquals( "Checking insertBefore to a list containing 7 elemenets at position 8 - expected the element at the tail of the list", "7,4,5,6,1,2,3,8", testDLL.toString() );
        testDLL.insertBefore(700,9);        
        assertEquals( "Checking insertBefore to a list containing 8 elements at position 700 - expected the element at the tail of the list", "7,4,5,6,1,2,3,8,9", testDLL.toString() );

        // test empty list
        testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(0,1);        
        assertEquals( "Checking insertBefore to an empty list at position 0 - expected the element at the head of the list", "1", testDLL.toString() );
        testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(10,1);        
        assertEquals( "Checking insertBefore to an empty list at position 10 - expected the element at the head of the list", "1", testDLL.toString() );
        testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(-10,1);        
        assertEquals( "Checking insertBefore to an empty list at position -10 - expected the element at the head of the list", "1", testDLL.toString() );
     }

    // TODO: add more tests here. Each line of code in DoublyLinkedList.java should
    // be executed at least once from at least one test.
    
    @Test
    public void testget(){
    	DoublyLinkedList<Integer> test = new DoublyLinkedList<Integer>();
    	test.push(1);
    	test.push(2);
    	test.push(3);
    	assertEquals( "Checking get() after adding 3 elements at pos 0", "3", test.get(0).toString());
    }
    
    @Test
    public void testDeleteAt(){
    	DoublyLinkedList<Integer> test = new DoublyLinkedList<Integer>();
    	test.push(1);
    	test.push(2);
    	test.push(3);
    	test.push(4);
    	//test.deleteAt(0);
    	assertEquals( "Checking deleteAt(0) after adding 3 elements", true, test.deleteAt(0));
    	test.push(5);
    	test.push(6);
    	test.push(7);
    	test.push(8);
    	//test.deleteAt(100);
    	assertEquals( "Checking deleteAt(100) after adding 4 elements", false, test.deleteAt(100));
    	assertEquals( "Checking deleteAt(7/tail) after adding 4 elements", true, test.deleteAt(7));
    	test.push(23);
    	test.push(12);
    	assertEquals( "Checking deleteAt(4/somewhere in middle) after adding 2 elements", true, test.deleteAt(4));
    	assertEquals( "Checking deleteAt(-10) after adding 2 elements, should return false, outside of list", false, test.deleteAt(-10));
    }
    
    @Test
    public void testReverse(){
    	DoublyLinkedList<Integer> test = new DoublyLinkedList<Integer>();
    	test.push(1);
    	test.push(2);
    	test.push(3);
    	test.push(4);
    	test.reverse();
    	assertEquals( "Checking reverse() after adding 4 elements", "1,2,3,4", test.toString());
    }
    
    @Test
    public void testMakeUnique(){
    	DoublyLinkedList<Integer> test = new DoublyLinkedList<Integer>();
    	test.push(1);
    	test.push(4);
    	test.push(2);
    	test.push(3);
    	test.push(4);
    	test.push(4);
    	test.push(5);
    	test.push(6);
    	test.push(7);
    	test.push(8);
    	test.push(4);
    	test.makeUnique();
    	assertEquals( "Checking makeeUnique() after adding 10 elements", "4,8,7,6,5,3,2,1", test.toString());
    }
    	
    @Test
    public void testPush(){
    	DoublyLinkedList<Integer> test = new DoublyLinkedList<Integer>();
    	test.push(1);
    	assertEquals( "Checking push() after adding 1 elements", "1", test.toString());
    	test.push(null);
    	assertEquals( "Checking push() after pushing null, list should be unchanged", "1", test.toString());
    	test.push(2);
    	test.push(3);
    	test.push(4);
    	test.push(5);
    	assertEquals( "Checking push() after pushing 4 more elements", "5,4,3,2,1", test.toString());
    	test.push(null);
    	assertEquals( "Checking push() after pushing null, list should be unchanged", "5,4,3,2,1", test.toString());
    }
   
    @Test
    public void testPop(){
    	DoublyLinkedList<Integer> test = new DoublyLinkedList<Integer>();
    	test.push(1);
    	test.push(2);
    	test.push(3);
    	test.push(4);
    	test.push(5);
    	int popped = test.pop();
    	assertEquals("Checking if pop() popped correct element", 5, popped);
    	test = new DoublyLinkedList<Integer>();
    	assertEquals("Checking if pop() returns null when list is empty", null, test.pop());
    }
    
    @Test
    public void testEnqueue(){
    	DoublyLinkedList<Integer> test = new DoublyLinkedList<Integer>();
    	test.enqueue(1);
    	test.enqueue(2);
    	test.enqueue(3);
    	test.enqueue(4);
    	test.enqueue(5);
    	assertEquals("Checking if items enqueued properly", "1,2,3,4,5", test.toString());
    	
    }
    
    @Test
    public void testDequeue(){
    	DoublyLinkedList<Integer> test = new DoublyLinkedList<Integer>();
    	test.enqueue(1);
    	test.enqueue(2);
    	test.enqueue(3);
    	test.enqueue(4);
    	test.enqueue(5);
    	test.dequeue();
    	assertEquals("Checking if items enqueued properly", "2,3,4,5", test.toString());
    	test = new DoublyLinkedList<Integer>();
    	assertEquals("Checking if dequeue() returned null on empty list", null, test.dequeue());
    }
    
    @Test
    public void testGetSize(){
    	DoublyLinkedList<Integer> test = new DoublyLinkedList<Integer>();
    	test.enqueue(1);
    	test.enqueue(2);
    	test.enqueue(3);
    	test.enqueue(4);
    	test.enqueue(5);
    	assertEquals("Checking if getSIze() returns correct size of list", 5, test.getSize());
    }
}
