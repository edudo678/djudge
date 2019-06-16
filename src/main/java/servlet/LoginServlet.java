package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Privado;
import model.dao.GenericDAO;
import model.dao.PrivadoDAO;

/**
 *
 * @author Johann Mayos & eddunic
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {

	doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {

	response.setContentType("text/html");
	PrintWriter out = response.getWriter();

	String usuario = request.getParameter("usuario");
	String senha = request.getParameter("senha");

	PrivadoDAO pDao = new PrivadoDAO();

	Long idPrivado = pDao.login(usuario, senha);

	Privado p;

	if (idPrivado == null) {
	    out.println("NULL");
	} else if (idPrivado == -1) {
	    out.println("-1");
	} else {
	    try {
		GenericDAO<Privado> pDao2 = new GenericDAO<>();
		p = pDao2.findById(Privado.class, idPrivado);
		if (p != null) {
		    request.getSession().setAttribute("usuario", p);
		    response.sendRedirect("/djudge/");
		} else {
		    out.println("ERRO");
		}
	    } catch (IOException e) {
		out.println("ERRO " + e.getMessage());
	    }

	}

    }

}
