

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import static org.apache.http.HttpHeaders.USER_AGENT;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

/**
 *
 * @author eddunic
 */
public class SphereEngineServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {

	doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {

// salva source + compilerID
//	ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
//	List<FileItem> multifiles = null;
//	try {
//	    multifiles = sf.parseRequest(request);
//	} catch (FileUploadException ex) {
//	    Logger.getLogger(SubmissionServlet.class.getName()).log(Level.SEVERE, null, ex);
//	}
//	
//	for(FileItem item : multifiles){
//	    try {
//		item.write(new File("/home/eduardo/Documentos/NetBeansProjects/djudge/" + item.getName()));
//	    } catch (Exception ex) {
//		Logger.getLogger(SubmissionServlet.class.getName()).log(Level.SEVERE, null, ex);
//	    }
//	}


// salva apenas source
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
	
	
// Cria Submissão	
	String url = "https://a53fdb4d.compilers.sphere-engine.com/api/v4/submissions?access_token=8bce219ca0c54390d6b832fa542470b2";

        HttpClient client = HttpClientBuilder.create().build();
        HttpPost request2 = new HttpPost(url);

        List<NameValuePair> urlParameters = new ArrayList<NameValuePair>();
        urlParameters.add(new BasicNameValuePair("source", line));
        urlParameters.add(new BasicNameValuePair("compilerId", "4"));

        request2.setEntity(new UrlEncodedFormEntity(urlParameters));
        //	request.setHeader("Content-Type", "multipart/form-data");
        request2.addHeader("User-Agent", USER_AGENT);

        HttpResponse response2 = client.execute(request2);
        System.out.println("\nSending 'POST' request to URL : " + url);
        System.out.println("Post parameters : " + request2.getEntity());
        System.out.println("Response Code : " + response2.getStatusLine().getStatusCode());

        BufferedReader rd = new BufferedReader(new InputStreamReader(response2.getEntity().getContent()));
        StringBuffer result = new StringBuffer();
        String line2 = "";
        while ((line2 = rd.readLine()) != null) {
            result.append(line2);
        }
	
	System.out.println(result.toString());
	System.out.println(result.substring(6, 14));
	
	String id = result.substring(6, 14);
	
	
	
// Retorna dados da submissão
	String url2 = "https://a53fdb4d.compilers.sphere-engine.com/api/v4/submissions/" + id + "?access_token=8bce219ca0c54390d6b832fa542470b2";
	
	System.out.println(url2);
	
	HttpClient client2 = HttpClientBuilder.create().build();
	HttpGet request3 = new HttpGet(url2);

	// add request header
	request3.addHeader("User-Agent", USER_AGENT);
	HttpResponse response3 = client.execute(request3);

	BufferedReader rd2 = new BufferedReader(
		new InputStreamReader(response3.getEntity().getContent()));

	StringBuffer result2 = new StringBuffer();
	String line3 = "";
	while ((line3 = rd2.readLine()) != null) {
	    System.out.println(result2.append(line3));
	}



// Retorna output da submissão
	String url3 = "https://a53fdb4d.compilers.sphere-engine.com/api/v4/submissions/" + id + "/output?access_token=8bce219ca0c54390d6b832fa542470b2";

	HttpClient client3 = HttpClientBuilder.create().build();
	HttpGet request4 = new HttpGet(url3);

	request2.addHeader("User-Agent", USER_AGENT);
	HttpResponse response4 = client3.execute(request4);

	BufferedReader rd3 = new BufferedReader(
		new InputStreamReader(response4.getEntity().getContent()));

	StringBuffer result3 = new StringBuffer();
	String line4 = "";
	while ((line4 = rd3.readLine()) != null) {
	    System.out.println(result3.append(line4));
	}
	
    }

}
