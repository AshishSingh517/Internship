
package SyntheticsGPTKQL;
import java.util.List;
public interface INLPProvider {
    List<String> getIntents(String userPrompt) ;
    List<String> getEntities(String userPrompt) ;

}

