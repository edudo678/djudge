package tests;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Questao;
import model.bean.QuestaoImagem;
import model.bean.QuestaoRestricao;
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
        GenericDAO<Questao> gq = new GenericDAO<>();

        q.setTitulo("teste");
        q.setEnunciado("teste");
        q.setEntrada("teste");
        q.setSaida("test");

        QuestaoImagem qi = new QuestaoImagem();
        GenericDAO<QuestaoImagem> gqi = new GenericDAO<>();

        qi.setImagem(request.getParameter("imagem"));

        QuestaoRestricao qr = new QuestaoRestricao();
        GenericDAO<QuestaoRestricao> gqr = new GenericDAO<>();

        qr.setRestricao("teste");

        gq.saveOrUpdate(q);
        gqi.saveOrUpdate(qi);
        gqr.saveOrUpdate(qr);

    }

}
