package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
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
public class QuestaoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if (acao.equals("cadastrar")) {

            Questao q = new Questao();
            GenericDAO<Questao> gq = new GenericDAO<>();

            q.setTitulo(request.getParameter("titulo"));
            q.setEnunciado(request.getParameter("enunciado"));
            q.setEntrada(request.getParameter("entrada"));
            q.setSaida(request.getParameter("saida"));

            QuestaoImagem qi = new QuestaoImagem();
            GenericDAO<QuestaoImagem> gqi = new GenericDAO<>();

            qi.setImagem(request.getParameter("imagem"));

            QuestaoRestricao qr = new QuestaoRestricao();
            GenericDAO<QuestaoRestricao> gqr = new GenericDAO<>();

            qr.setRestricao(request.getParameter("restricao"));

            gq.saveOrUpdate(q);
            gqi.saveOrUpdate(qi);
            gqr.saveOrUpdate(qr);

        }

    }

}
