package servlet;

import java.io.IOException;
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
        
        JDoodle j = new JDoodle();

        QuestaoSaidaEsperada qs = new QuestaoSaidaEsperada();
        qs.setSaidaEsperada(j.post(request, response));
        qs.setQuestao(q);

        GenericDAO<QuestaoSaidaEsperada> gqs = new GenericDAO<>();
        gqs.saveOrUpdate(qs);    
        
    }

}
