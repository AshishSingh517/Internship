package SyntheticsGPTKQL;

public class DomainAdapter {
    public static MetadataManager getMetadataManager(){
        MetadataManager metadataManager=new KQLMetadataManager();
        return metadataManager;
    }
}
