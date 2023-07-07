package SyntheticsGPTKQL;
import java.util.List;

public abstract class PromptBuilder {
    public abstract List<String> buildPrompts(List<String> tableschema, String userPrompt);
    public abstract void ShowPrompts();
}
