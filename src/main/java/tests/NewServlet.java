/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tests;

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
public class NewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {

	PrintWriter out = response.getWriter();

//	String value = null; //Compiler value
//	
//	//Read archive
//	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
//
//	File uploadedFile = null;
//
//	if (isMultipart) {
//	    FileItemFactory factory = new DiskFileItemFactory();
//	    ServletFileUpload upload = new ServletFileUpload(factory);
//
//	    try {
//		List items = upload.parseRequest(request);
//		Iterator iterator = items.iterator();
//		while (iterator.hasNext()) {
//		    FileItem item = (FileItem) iterator.next();
//
//		    if (!item.isFormField()) {
//			String fileName = item.getName();
//
//			File path = new File("/home/eduardo/Documentos/NetBeansProjects/djudge/");
//			if (!path.exists()) {
//			    boolean status = path.mkdirs();
//			}
//
//			uploadedFile = new File(path + "/" + fileName);
//			System.out.println(uploadedFile.getAbsolutePath());
//			item.write(uploadedFile);
//		    } else {
//			String name = item.getFieldName();
//			value = item.getString();
//
//			// **************************************************
//			// Process your name and value pairs here! *****
//			// **************************************************
//			System.out.println("Found field " + name + " and value " + value);
//		    }
//		}
//	    } catch (FileUploadException e) {
//		e.printStackTrace();
//	    } catch (Exception e) {
//		e.printStackTrace();
//	    }
//	}
//
//	String line = null;
//
//	BufferedReader br = new BufferedReader(new FileReader(uploadedFile));
//	while (br.ready()) {
//	    line = br.readLine();
//	}
//	br.close();
	//JDoodle
	String clientId = "a720f0daaadb0ebc5102fefe58f6513b"; //Replace with your client ID
	String clientSecret = "89a23de3f78ff50a2a1ca7ab720ac8be20a876f6c39e41cd7de4e0e2281eb2aa"; //Replace with your client Secret
	String script = "#include <stdio.h> \\n int main(){char nome[100];printf(\\\"digite seu nome:\\\");scanf(\\\"%s\\\", nome);printf(\\\"Seu nome é: %s\\\", nome);return 0;}";
        String stdin = "Eduardo";
	String language = "c";
	String versionIndex = "0";

	try {
	    URL url = new URL("https://api.jdoodle.com/v1/execute");
	    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	    connection.setDoOutput(true);
	    connection.setRequestMethod("POST");
	    connection.setRequestProperty("Content-Type", "application/json");

	    String input = "{\"clientId\": \"" + clientId + "\",\"clientSecret\":\"" + clientSecret + "\",\"script\":\"" + script
		    + "\",\"stdin\":\"" + stdin + "\",\"language\":\"" + language + "\",\"versionIndex\":\"" + versionIndex + "\"} ";

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

	    String output;
	    System.out.println("Output from JDoodle .... \n");
	    while ((output = bufferedReader.readLine()) != null) {
		System.out.println(output);
//		out.println(output);
	    }

	    connection.disconnect();

	} catch (MalformedURLException e) {
	    e.printStackTrace();
	} catch (IOException e) {
	    e.printStackTrace();
	}
    }

}