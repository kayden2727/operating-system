package assignments;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class DiningPhilosophers {

    private static final long startTime = System.currentTimeMillis();

    private static String getTimestamp() {
        long elapsed = System.currentTimeMillis() - startTime;
        long seconds = (elapsed / 1000) % 60;
        long minutes = (elapsed / 60000) % 60;
        return String.format("[%02d:%02d]", minutes, seconds);
    }

    static class Fork {
        public final int id;
        public final Lock lock = new ReentrantLock();

        public Fork(int id) {
            this.id = id;
        }
    }

    static class Philosopher implements Runnable {
        private final int id;
        private final Fork firstFork;
        private final Fork secondFork;
        private final String firstForkName;
        private final String secondForkName;

        public Philosopher(int id, Fork left, Fork right) {
            this.id = id;

            if (left.id < right.id) {
                this.firstFork = left;
                this.firstForkName = "Left Fork.";
                this.secondFork = right;
                this.secondForkName = "Right Fork.";
            } else {
                this.firstFork = right;
                this.firstForkName = "Right Fork.";
                this.secondFork = left;
                this.secondForkName = "Left Fork.";
            }
        }

        private void logAction(String action) {
            System.out.println(getTimestamp() + " Philosopher " + id + " " + action);
        }

        private void simulateTimePassing() throws InterruptedException {
            Thread.sleep((long) (Math.random() * 40 + 10));
        }

        @Override
        public void run() {
            try {
                for (int i = 0; i < 3; i++) {
                    logAction("is Thinking.");
                    simulateTimePassing();

                    firstFork.lock.lock();
                    logAction("picked up " + firstForkName);

                    secondFork.lock.lock();
                    logAction("picked up " + secondForkName);

                    logAction("is Eating.");
                    simulateTimePassing();

                    secondFork.lock.unlock();
                    logAction("put down " + secondForkName);

                    firstFork.lock.unlock();
                    logAction("put down " + firstForkName);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }

    public static void main(String[] args) {
        int numPhilosophers = 3;
        Philosopher[] philosophers = new Philosopher[numPhilosophers];
        Fork[] forks = new Fork[numPhilosophers];

        for (int i = 0; i < numPhilosophers; i++) {
            forks[i] = new Fork(i);
        }

        for (int i = 0; i < numPhilosophers; i++) {
            Fork leftFork = forks[i];
            Fork rightFork = forks[(i + 1) % numPhilosophers];

            philosophers[i] = new Philosopher(i + 1, leftFork, rightFork);

            Thread t = new Thread(philosophers[i]);
            t.start();
        }
    }
}