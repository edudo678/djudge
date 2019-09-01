package tests;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Questao;
import model.bean.QuestaoImagem;
import model.dao.GenericDAO;

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

        Questao q = new Questao();
        q.setId(1L);
        QuestaoImagem qi = new QuestaoImagem();
        qi.setImagem(request.getParameter("upload").getBytes());
        qi.setQuestao(q);
        
        System.out.println(qi.getImagem());

        GenericDAO<QuestaoImagem> gqi = new GenericDAO<>();

        gqi.saveOrUpdate(qi);
    }

}
