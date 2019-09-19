package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Questao;
import model.bean.QuestaoSaidaEsperada;
import model.dao.GenericDAO;
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

        Questao q;
        GenericDAO<Questao> gqDAO = new GenericDAO();
        q = gqDAO.findById(Questao.class, Long.parseLong(request.getParameter("id")));

        JDoodle j = new JDoodle();
//
//        QuestaoSaidaEsperada qs = new QuestaoSaidaEsperada();
//
//        qs.setSaidaEsperada(j.post(request, response));
//        
//        qs.setQuestao(q);
//
//        GenericDAO<QuestaoSaidaEsperada> gqs = new GenericDAO<>();
//        gqs.saveOrUpdate(qs);     
        System.out.println("id-> " + request.getParameter("id"));
        System.out.println("titulo - > " + q.getTitulo());
        System.out.println("saidaEsperada - > " + j.post(request, response));

    }

}
