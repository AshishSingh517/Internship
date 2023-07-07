package SyntheticsGPTKQL;

import java.util.List;

public class PromptController {
    NLPProvider nlpClient;
    MetadataManager kqlMetadataManager;

    List<String> tableSchema;
    List<String> tableNames;
    List<String> prompts;

    PromptBuilder promptBuilder;

    public PromptController(){
    }
    public List<String> buildPrompts(String userPrompt){

        return prompts;
    }
}
