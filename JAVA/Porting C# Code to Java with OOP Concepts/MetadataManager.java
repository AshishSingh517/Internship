package SyntheticsGPTKQL;
import java.util.List;
public abstract class MetadataManager implements IMetadataManager{
    public abstract List<String> getObjectMetadata(List<String> objectName);
}
