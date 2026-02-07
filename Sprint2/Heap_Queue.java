package Sprint2;

import java.util.ArrayList;

public class Heap_Queue {
    private ArrayList<Integer> queue;

    public Heap_Queue() {
        queue = new ArrayList<>();
    }

    public boolean isEmpty() {
        return queue.isEmpty();
    }

    public int peak() {
        if (isEmpty()) throw new IllegalStateException("Empty Queue");
        return queue.get(0);
    }

    public void insert(int value) {
        queue.add(value);
        queueUp(queue.size() - 1);
    }

    private void queueUp(int index) {
        while (index > 0) {
            int parentIndex = (index - 1) / 2;

            if (queue.get(index) < queue.get(parentIndex)) {
                swap(index, parentIndex);
                index = parentIndex;
            } else {
                break;
            }
        }
    }

    public int remove() {
        if (isEmpty()) throw new IllegalStateException("Empty queue");

        int root = queue.get(0);
        int last = queue.remove(queue.size() - 1);

        if (!queue.isEmpty()) {
            queue.set(0, last);
            queueDown(0);
        }

        return root;
    }

    private void queueDown(int index) {
        int size = queue.size();

        while (true) {
            int left = 2 * index + 1;
            int right = 2 * index +2;
            int smallest = index;

            if (left < size && queue.get(left) < queue.get(smallest)) {
                smallest = left;
            }
            if (right < size && queue.get(right) < queue.get(smallest)) {
                smallest = right;
            }

            if (smallest != index) {
                swap(index, smallest);
                index = smallest;
            } else {
                break;
            }
        }
    }

    private void swap(int i, int j) {
        int temp = queue.get(i);

        queue.set(i, queue.get(j));
        queue.set(j, temp);
    }



    public static void main(String[] args) {
        Heap_Queue hq = new Heap_Queue();
    
        hq.insert(5);
        hq.insert(3);
        hq.insert(9);
        hq.insert(15);
        hq.insert(4);
        hq.insert(1);
        hq.insert(28);
    
        while (!hq.isEmpty()) {
            System.out.println(hq.remove());
        }
    }

}