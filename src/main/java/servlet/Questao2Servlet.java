package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Questao;
import model.dao.GenericDAO;

/**
 *
 * @author eddunic
 */
public class Questao2Servlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");

//        if (acao.equals("excluir")) {
            Questao q = new Questao();
            GenericDAO<Questao> gq = new GenericDAO<>();
            q = gq.findById2(Questao.class, Long.parseLong(request.getParameter("id")));
            gq.remove(q);
            response.sendRedirect("../djudge/usuario/avaliador/index.jsp");
//        }

    }

}
