package SyntheticsGPTKQL;
import java.util.List;
public interface ILLMClient {
    void invokeLLMCommandAsync(List<String> prompts, String model);
}
