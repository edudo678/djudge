package SphereEngine.Api.compilers.submissions;
/**
 * Example presents usage of the successful getSubmissionStream() API method  
 */

import SphereEngine.Api.CompilersClientV3;
import SphereEngine.Api.Exception.NotAuthorizedException;
import SphereEngine.Api.Exception.NotFoundException;
import SphereEngine.Api.Exception.ClientException;
import SphereEngine.Api.Exception.ConnectionException;

public class getSubmissionStream
{

	public static void main(String[] args) 
	{
		CompilersClientV3 client = new CompilersClientV3(
				"8bce219ca0c54390d6b832fa542470b2", 
				"a53fdb4d.compilers.sphere-engine.com");
		
		try {
			String response = client.getSubmissionStream(82647342, "output");
		} catch (NotAuthorizedException e) {
			System.out.println("Invalid access token");
		} catch (NotFoundException e) {
			// aggregates two possible reasons of 404 error
			// non existing submission or stream
			System.out.println("Non existing resource (submission, stream), details available in the message: " + e.getMessage());
		} catch (ClientException e) {
			System.out.println(e.getMessage());
		} catch (ConnectionException e) {
			System.out.println(e.getMessage());
		}
	}	
}
