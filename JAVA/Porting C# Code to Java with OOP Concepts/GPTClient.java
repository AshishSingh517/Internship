package SyntheticsGPTKQL;
import java.util.List;
public class GPTClient extends LLMClient {
    public void GetCompletionsAsync(List<String> prompts) {
    }

    @Override
    public void invokeLLMCommandAsync(List<String> prompts, String model) {
        this.GetCompletionsAsync(prompts);
    }
}
