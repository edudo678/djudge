package SphereEngine.Api.compilers.submissions;
/**
 * Example presents usage of the successful getSubmission() API method  
 */

import SphereEngine.Api.CompilersClientV3;
import SphereEngine.Api.Exception.NotAuthorizedException;
import SphereEngine.Api.Exception.NotFoundException;
import SphereEngine.Api.Exception.ClientException;
import SphereEngine.Api.Exception.ConnectionException;
import com.google.gson.JsonObject;

public class getSubmission
{

	public static void main(String[] args) 
	{
		CompilersClientV3 client = new CompilersClientV3(
				"8bce219ca0c54390d6b832fa542470b2", 
				"a53fdb4d.compilers.sphere-engine.com");
		
		try {
			JsonObject response = client.getSubmission(82647342);
			System.out.println(response);
		} catch (NotAuthorizedException e) {
			System.out.println("Invalid access token");
		} catch (NotFoundException e) {
			System.out.println("Submission does not exist");
		} catch (ClientException e) {
			System.out.println(e.getMessage());
		} catch (ConnectionException e) {
			System.out.println(e.getMessage());
		}
	}	
}
