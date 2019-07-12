package servlet;

import java.io.BufferedReader;
import java.io.File;
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
 * @author eddunic, Felipe, Ronaldo
 */
enum Client {

    //Cliente("ID", "Secret")
    C1("a720f0daaadb0ebc5102fefe58f6513b", "89a23de3f78ff50a2a1ca7ab720ac8be20a876f6c39e41cd7de4e0e2281eb2aa"), //eduardo
    C2("2d91a51cbd65b52de38f21bb7495f298", "f81ee9b20f41363b8bc5e3decff4199b22f3e590f05dd750544a8e9ce905f8f6"), //eddunic
    C3("e783799656995341bb5c09ad276ef033", "f44c6d6f2365341d2a76c733eb4a90b112caf44833eea9e573fd118b04a1a03a"), //tijolo
    C4("53dcea620c9451bc5cab782bd2f6c5c3", "fd98f72640a85ae681d0d172ddb51e4c048e058e8668635210c20da9ef7b3ec8"), //daniela1133
    C5("dfb93851129dc1d084547dae35903b2e", "b4de7f5269cd22b98cdc62bc15903568265b43eab0867f28772f180a898f2a"), //201711440060
    C6("acd5f76bb15898af390d0173603e196d", "ead9cefe549b851227e97521c57f9594b5b93b6afe57c585391995ef1075b4bb"), //danieladanydandan005@gmail.com
    C7("1d0968d69119fb99c493a71998ffae0f", "a1888eef1087b7182d4d02741242a93ac0fed250cf260a19dcd8b96368317a2a"), //feitosaferreiradaniela@gmail.com	
    C8("29fb700a2bfd33d3615c4d16e97190bc", "4d914facaba6bdff33d53803f572eee90641a69d1763525496b941f5d72cc3ea"), //inf11a2017@gmail.com
    C9("b98f73723f40b75355b15de6a6908781", "2b50668d6a86249d2f4a09da1d74f265da4196c6173f0e91209e354cdfbdd9cb"), //201711440302@ifam.edu.br
    C10("f47cd44361dde66e6924a552bf55152d", "64e10f2b6ad3afb43e8a869f33e14ce3e2eb47eb4df05ce6b6000c08fcef196e"); //Ronaldo

    private Client(final String id, final String secret) {
        this.id = id;
        this.secret = secret;
    }
    private String id;
    private String secret;

    public String getId() {
        return id;
    }

    public String getSecret() {
        return secret;
    }

}

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

        JDoodleOutputFormat jdof; //classe para formatar a saída do JDoodle
        JDoodleCodeFormat jdcf; //classe para formatar script a ser enviado ao JDoodle
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

                        File path = new File("/home/eddunic/NetBeansProjects/djudge/");
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

        jdcf = new JDoodleCodeFormat(uploadedFile, value); //formata o uploadFile

        //JDoodle
        String clientId = null;
        String clientSecret = null;
        String script = jdcf.getScript();
        String language = value;
        String versionIndex = "0";
        //       String scriptPython = "print('ola')" ou "print(\\\"ola\\\")";
        //em arquivo -> "print('ola')" ou "print(\"ola\")"
//	String scriptJava = "public class Teste { public static void main(String[] args) { System.out.println(\\\"testeJava\\\"); } }";
        //em arquivo -> "public class Teste { public static void main(String[] args) { System.out.println(\"testeJava\"); } }"
//String c -> "#include <stdio.h> \\n int main(){printf(\\\"ola\\\");return 0;}"
        Client[] clientes = Client.values();
        teste:
        for (Client c : clientes) {
            try {
                URL url = new URL("https://api.jdoodle.com/v1/credit-spent");
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setDoOutput(true);
                connection.setRequestMethod("POST");
                connection.setRequestProperty("Content-Type", "application/json");

                String input = "{\"clientId\": \"" + c.getId() + "\",\"clientSecret\":\"" + c.getSecret() + "\"} ";

                OutputStream outputStream = connection.getOutputStream();
                outputStream.write(input.getBytes());
                outputStream.flush();

                if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                    throw new RuntimeException("Please check your inputs : HTTP error code : " + connection.getResponseCode());
                }

                BufferedReader bufferedReader;
                bufferedReader = new BufferedReader(new InputStreamReader((connection.getInputStream())));

                String saidaJDoodle;
                while ((saidaJDoodle = bufferedReader.readLine()) != null) {
                    if (!(saidaJDoodle.equals("{\"used\":221}"))) {
                        clientId = c.getId();
                        clientSecret = c.getSecret();
                        System.out.println(saidaJDoodle);
                        break teste;
                    }
                }

            } catch (MalformedURLException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

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

            jdof = new JDoodleOutputFormat(concat, language); //formata a saída

            System.out.println(jdof.getCodeOutput());
            out.println(jdof.getCodeOutput());

            connection.disconnect();

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
