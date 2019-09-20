package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Questao;
import model.bean.QuestaoExemplo;
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

        //questao
        Questao q = new Questao();

        q.setTitulo(request.getParameter("titulo"));
        q.setEnunciado(request.getParameter("enunciado"));
        q.setEntrada(request.getParameter("entrada"));
        q.setSaida(request.getParameter("saida"));
        q.setNivel(Integer.parseInt(request.getParameter("nivel")));
        q.setPeso(Integer.parseInt(request.getParameter("peso")));

        GenericDAO<Questao> gq = new GenericDAO<>();
        gq.saveOrUpdate(q);

        //imagem
        QuestaoImagem qi = new QuestaoImagem();

        qi.setImagem(request.getParameter("imagem").getBytes());
        qi.setQuestao(q);

        GenericDAO<QuestaoImagem> gqi = new GenericDAO<>();
        gqi.saveOrUpdate(qi);
        //restricao
        QuestaoRestricao qr = new QuestaoRestricao();

        qr.setRestricao(request.getParameter("restricao"));
        qr.setQuestao(q);

        GenericDAO<QuestaoRestricao> gqr = new GenericDAO<>();
        gqr.saveOrUpdate(qr);
        //exemplo
        QuestaoExemplo qe = new QuestaoExemplo();

        qe.setExemplo(request.getParameter("exemplo"));
        qe.setQuestao(q);

        GenericDAO<QuestaoExemplo> gqe = new GenericDAO<>();
        gqe.saveOrUpdate(qe);

        response.sendRedirect("../djudge/questao/cadastro2.jsp?id=" + q.getId());

    }

}
