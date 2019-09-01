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
            
            q.setTitulo(request.getParameter("titulo"));
            q.setEnunciado(request.getParameter("enunciado"));
            q.setEntrada(request.getParameter("entrada"));
            q.setSaida(request.getParameter("saida"));
            
            GenericDAO<Questao> gq = new GenericDAO<>();
            gq.saveOrUpdate(q);

            QuestaoImagem qi = new QuestaoImagem();            

            qi.setImagem(request.getParameter("imagem").getBytes());
            qi.setQuestao(q);
            
            GenericDAO<QuestaoImagem> gqi = new GenericDAO<>();
            gqi.saveOrUpdate(qi);

        }

    }

}
