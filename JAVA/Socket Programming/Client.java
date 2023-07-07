package Socket_programming;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.net.UnknownHostException;

public class Client {


    public static void main(String[] args) {

        try{
            System.out.println("Client started" );
            Socket soc=new Socket("Localhost",9806);
            BufferedReader br=new BufferedReader(new InputStreamReader(soc.getInputStream()));
            String message= br.readLine();
            System.out.println("Message recieved:"+message);
            soc.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
