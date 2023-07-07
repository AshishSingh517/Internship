package SyntheticsGPTKQL;

public class NLPAdapter {
    public static NLPProvider getNLPClient(){
        NLPProvider nlpClient = new StanfordNLPClient();
        return nlpClient;
    }
}
