package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Questao;
import model.bean.QuestaoEntrada;
import model.bean.QuestaoSaidaEsperada;
import model.dao.GenericDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import util.JDoodle;
import util.JDoodleOutputFormat;

/**
 *
 * @author eddunic
 */
@MultipartConfig
public class SubmissaoPublicoServlet extends HttpServlet {

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

                        File path = new File("D:\\home\\eddunic\\NetBeansProjects\\djudge");
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

        Questao q;
        GenericDAO<Questao> gqDAO = new GenericDAO();
        q = gqDAO.findById(Questao.class, Long.parseLong(request.getParameter("id")));

        QuestaoSaidaEsperada qs;
        GenericDAO<QuestaoSaidaEsperada> gqsDAO = new GenericDAO();
        qs = gqsDAO.findById(QuestaoSaidaEsperada.class, Long.parseLong(request.getParameter("id")));

        QuestaoEntrada qe;
        GenericDAO<QuestaoEntrada> gqeDAO = new GenericDAO();
        qe = gqeDAO.findById(QuestaoEntrada.class, Long.parseLong(request.getParameter("id")));

        byte[] entradaAvaliador = qe.getEntrada();

        JDoodleOutputFormat output = j.post(request, response, uploadedFile, value, entradaAvaliador);

        byte[] saidaAvaliador = qs.getSaidaEsperada();
        String saidaAvaliadorDecode = new String(saidaAvaliador, "ISO-8859-1");
        String saidaUsuario = output.getCodeOutput();

        out.println("Saída do usuário -> " + saidaUsuario);
        out.println("Saída do avaliador -> " + saidaAvaliadorDecode);

        if (saidaUsuario.equals(saidaAvaliadorDecode)) {
            out.println("Questão CORRETA!");
        } else {
            out.println("Questão ERRADA!");
        }

    }

}
