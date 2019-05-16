package SphereEngine.Api.compilers;
/**
 * Example presents usage of the successful getCompilers() API method  
 */

import SphereEngine.Api.CompilersClientV3;
import SphereEngine.Api.Exception.NotAuthorizedException;
import SphereEngine.Api.Exception.ClientException;
import SphereEngine.Api.Exception.ConnectionException;
import com.google.gson.JsonObject;

public class getCompilers
{

	public static void main(String[] args) 
	{
		CompilersClientV3 client = new CompilersClientV3(
				"<access_token>", 
				"<endpoint>");
		
		try {
			JsonObject response = client.getCompilers();
		} catch (NotAuthorizedException e) {
			System.out.println("Invalid access token");
		} catch (ClientException e) {
			System.out.println(e.getMessage());
		} catch (ConnectionException e) {
			System.out.println(e.getMessage());
		}
	}	
}
