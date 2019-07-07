package tests;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 *
 * @author eddunic
 */
public class Switch {
	
	private final String clientId1 = "a720f0daaadb0ebc5102fefe58f6513b";
	private final String clientSecret1 = "89a23de3f78ff50a2a1ca7ab720ac8be20a876f6c39e41cd7de4e0e2281eb2aa";
	
	private final String clientId2 = "2d91a51cbd65b52de38f21bb7495f298";
	private final String clientSecret2 = "f81ee9b20f41363b8bc5e3decff4199b22f3e590f05dd750544a8e9ce905f8f6";

	public static void main(String[] args) {

		//JDoodle
		String clientId = "a720f0daaadb0ebc5102fefe58f6513b"; //Replace with your client ID
		String clientSecret = "89a23de3f78ff50a2a1ca7ab720ac8be20a876f6c39e41cd7de4e0e2281eb2aa"; //Replace with your client Secret
		String script = "print('ola')";
		String language = "python3";
		String versionIndex = "0";

		try {
			URL url = new URL("https://api.jdoodle.com/v1/execute");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json");

			String input = "{\"clientId\": \"" + clientId + "\",\"clientSecret\":\"" + clientSecret + "\",\"script\":\"" + script
					+ "\",\"language\":\"" + language + "\",\"versionIndex\":\"" + versionIndex + "\"} ";

			System.out.println(input);

			OutputStream outputStream = connection.getOutputStream();
			outputStream.write(input.getBytes());
			outputStream.flush();

			if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
				throw new RuntimeException("Please check your inputs : HTTP error code : " + connection.getResponseCode());
			}

			BufferedReader bufferedReader;
			bufferedReader = new BufferedReader(new InputStreamReader(
					(connection.getInputStream())));

			System.out.println("Output from JDoodle .... \n");

			String saidaJDoodle, concat = "";
			while ((saidaJDoodle = bufferedReader.readLine()) != null) {
				concat += saidaJDoodle;
				System.out.println(concat);
			}

			String[] output = concat.split("\"");

			if (output[3].contains("\\n")) {
				System.out.println(output[3].substring(0, output[3].length() - 2));
			} else {
				System.out.println(output[3]);
			}

			connection.disconnect();

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();

		}
	}
	
}
