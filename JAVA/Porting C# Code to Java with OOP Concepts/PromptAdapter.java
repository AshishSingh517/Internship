package SyntheticsGPTKQL;

public class PromptAdapter {
    public static PromptBuilder getPromptBuilder(){
        PromptBuilder promptBuilder = new SyntheticsGPTPromptBuilder();
        return promptBuilder;
    }
}
