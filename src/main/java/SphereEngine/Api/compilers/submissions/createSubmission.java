package SphereEngine.Api.compilers.submissions;
/**
 * Example presents usage of the successful createSubmission() API method
*/

import SphereEngine.Api.CompilersClientV3;
import SphereEngine.Api.Exception.NotAuthorizedException;
import SphereEngine.Api.Exception.ClientException;
import SphereEngine.Api.Exception.ConnectionException;
import com.google.gson.JsonObject;

public class createSubmission
{

	public static void main(String[] args) 
	{
		CompilersClientV3 client = new CompilersClientV3(
				"8bce219ca0c54390d6b832fa542470b2", 
				"a53fdb4d.compilers.sphere-engine.com");
		
		String source = "print('Isso é um teste')";
		Integer compiler = 4; // Python language
		String input = "2016";
		
		try {
			JsonObject response = client.createSubmission(source, compiler, input);
			System.out.println(response);
			// response.get("id") stores the ID of the created submission
		} catch (NotAuthorizedException e) {
			System.out.println("Invalid access token");
		} catch (ClientException e) {
			System.out.println(e.getMessage());
		} catch (ConnectionException e) {
			System.out.println(e.getMessage());
		}
	}	
}
