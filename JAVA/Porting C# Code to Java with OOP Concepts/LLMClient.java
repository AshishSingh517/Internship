package SyntheticsGPTKQL;
import java.util.List;
public abstract class LLMClient implements ILLMClient {
    public void setProperties(){
    }
    public abstract void invokeLLMCommandAsync(List<String> prompts, String model);
}
