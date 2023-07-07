package SyntheticsGPTKQL;
import java.util.List;
public abstract class NLPProvider implements INLPProvider {
    String[] stopWords;
    char wordBreaker;
    public abstract List<String> getEntities(String userPrompt);
    public abstract List<String> getIntents(String userPrompt);
}
