package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Questao;
import model.bean.QuestaoSaidaEsperada;
import model.dao.GenericDAO;
import model.dao.QuestaoDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import util.JDoodle;

/**
 *
 * @author eddunic
 */
@MultipartConfig
public class SubmissaoAvaliadorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        QuestaoDAO qDAO = new QuestaoDAO();
        List<Questao> questoes = qDAO.getList();
        Questao q;
        GenericDAO<Questao> gqDAO = new GenericDAO();
        q = gqDAO.findById(Questao.class, questoes.get(questoes.size() - 1).getId());

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

        JDoodle j = new JDoodle();

        QuestaoSaidaEsperada qs = new QuestaoSaidaEsperada();
        qs.setSaidaEsperada(j.post(request, response, uploadedFile, value));
        qs.setIdQuestao(String.valueOf(q.getId()));
        qs.setQuestao(q);

        GenericDAO<QuestaoSaidaEsperada> gqs = new GenericDAO<>();
        gqs.saveOrUpdate(qs);
        
        q.setCodigoFonteGabarito(Files.readAllBytes(Paths.get(uploadedFile.getPath())));
        GenericDAO<Questao> gq = new GenericDAO<>();
        gq.saveOrUpdate(q);
    }

}
