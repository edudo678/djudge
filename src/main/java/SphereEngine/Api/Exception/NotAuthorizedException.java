package SphereEngine.Api.Exception;

public class NotAuthorizedException extends ClientException {
	
	public NotAuthorizedException(String message) {
        super(message, 401);
    }
	
}