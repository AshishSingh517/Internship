package Threads;

import java.io.FileWriter;
import java.io.IOException;

public class print_files implements Runnable {
    private int threads;

    @Override
    public void run() {
        String filename = "Text" + Thread.currentThread().getId() + ".txt";
        FileWriter writer;
        try {
            writer = new FileWriter(filename);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        for (int i = 1; i <= 1000000000 / threads; i++) {
            String s = i + " " + Thread.currentThread().getId();
            try {
                writer.write(s);
                writer.write("\n");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        try {
            writer.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void printnumber() {
        java.util.Scanner sc = new java.util.Scanner(System.in);
       System.out.println("Enter the number of threads: ");
        int a = sc.nextInt();
        sc.close();

        if (a >= 1 && a <= 16) {
            threads = a;
            Thread[] threadsArray = new Thread[threads];

            long starttime = System.currentTimeMillis();

            for (int i = 0; i < threads; i++) {
                threadsArray[i] = new Thread(this);
                System.out.println((i + 1) + "th file print successfully");
                threadsArray[i].start();
            }

            try {
                for (Thread thread : threadsArray) {
                    thread.join();
                }
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }

            long endtime = System.currentTimeMillis();
            long totaltime = endtime - starttime;
            System.out.println("Execution Time: " + totaltime + " milliseconds");

        } else {
            System.out.println("Invalid number of threads. Please enter a number between 1 and 16.");
        }
    }
}
