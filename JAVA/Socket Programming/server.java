package Socket_programming;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

public class server {
    public static void main(String[] args) {
        try {

                System.out.println("Server start");
                ServerSocket sct = new ServerSocket(9806);
            while (true) {
                Socket soc = sct.accept();
                System.out.println("Connection established...");
                PrintStream ps = new PrintStream(soc.getOutputStream());
                Scanner sc=new Scanner(System.in);
                System.out.println("Enter message to be send:\n");
                String mes= sc.nextLine();
                ps.print(mes);
                soc.close();
            }
        }
        catch (Exception e){
          e.printStackTrace();
        }
    }
}
