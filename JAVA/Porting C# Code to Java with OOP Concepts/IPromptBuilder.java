package SyntheticsGPTKQL;
import java.util.List;
public interface IPromptBuilder {
    void ShowPrompts();
    List<String> buildPrompts(List<String> tableschema, String userPrompt);
}
