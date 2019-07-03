package servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author eddunic
 */
@MultipartConfig
public class JDoodleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        String value = null; //Compiler value

        //Read archive
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        File uploadedFile = null;

        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                List items = upload.parseRequest(request);
                Iterator iterator = items.iterator();
                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();

                    if (!item.isFormField()) {
                        String fileName = item.getName();

                        File path = new File("/home/eduardo/Documentos/NetBeansProjects/djudge/");
                        if (!path.exists()) {
                            boolean status = path.mkdirs();
                        }

                        uploadedFile = new File(path + "/" + fileName);
                        System.out.println(uploadedFile.getAbsolutePath());
                        item.write(uploadedFile);
                    } else {
                        String name = item.getFieldName();
                        value = item.getString();

                        // **************************************************
                        // Process your name and value pairs here! *****
                        // **************************************************
                        System.out.println("Found field " + name + " and value " + value);
                    }
                }
            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        String line = null;

        BufferedReader br = new BufferedReader(new FileReader(uploadedFile));
        while (br.ready()) {
            line = br.readLine();
        }
        br.close();

        //JDoodle
        String clientId = "a720f0daaadb0ebc5102fefe58f6513b"; //Replace with your client ID
        String clientSecret = "89a23de3f78ff50a2a1ca7ab720ac8be20a876f6c39e41cd7de4e0e2281eb2aa"; //Replace with your client Secret
        String script = line;
        String language = value;
//	String scriptPython = "print('ola')" ou "print(\\\"ola\\\")";
        //em arquivo -> "print('ola')" ou "print(\"ola\")"
//	String scriptJava = "public class Teste { public static void main(String[] args) { System.out.println(\\\"testeJava\\\"); } }";
        //em arquivo -> "public class Teste { public static void main(String[] args) { System.out.println(\"testeJava\"); } }"
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
            }

            String[] output = concat.split("\"");

            if (output[3].contains("\\n")) {
                out.println(output[3].substring(0, output[3].length() - 2));
            } else {
                out.println(output[3]);
            }

            connection.disconnect();

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
