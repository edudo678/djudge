package SphereEngine.Api.compilers.initialization;
/**
 * Example presents connection error handling for 
 * Sphere Engine Compilers API client
 */

import SphereEngine.Api.CompilersClientV3;
import SphereEngine.Api.Exception.ClientException;
import SphereEngine.Api.Exception.ConnectionException;

public class connectionError 
{

	public static void main(String[] args) 
	{
		CompilersClientV3 client = new CompilersClientV3(
				"<access_token>", 
				"<endpoint>");
		
		try {
			client.test();
		} catch (ConnectionException e) {
			System.out.println("API connection problem");
		} catch (ClientException e) {
			// client error
		}
	}	
}
