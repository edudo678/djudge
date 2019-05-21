package SphereEngine.Api.compilers.initialization;
/**
 * Example presents usage of the successful initialization of 
 * Sphere Engine Compilers API client
 */

import SphereEngine.Api.CompilersClientV3;

public class initialization 
{

	public static void main(String[] args) 
	{
		CompilersClientV3 client = new CompilersClientV3(
				"<access_token>", 
				"<endpoint>");
	}	
}
