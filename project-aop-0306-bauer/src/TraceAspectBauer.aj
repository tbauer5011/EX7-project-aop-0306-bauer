import org.aspectj.lang.Signature;


public aspect TraceAspectBauer {

	pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
	
	before(): classToTrace(){
        Signature signature = thisJoinPoint.getSignature();
        String location =""+ thisJoinPointStaticPart.getSourceLocation().getLine();
        
        if(signature.getName().equals("getName")) {
        	System.out.println("[BGN] " + signature + ", " + location);
        }
        
    }
	after(): classToTrace() {
		Signature signature = thisJoinPoint.getSignature();
		String fileName = thisJoinPointStaticPart.getSourceLocation().getFileName();
		if(signature.getName().equals("getName")) {
			System.out.print("[END] " + fileName + "\n");
        }
	}
}
