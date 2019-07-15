package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Aluno;
import model.bean.Avaliador;
import model.bean.Privado;
import model.dao.GenericDAO;
import model.dao.PrivadoDAO;

/**
 *
 * @author eddunic
 */
public class PrivadoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if (acao.equals("cadastrar")) {

            if (request.getParameter("senha").equals(request.getParameter("confirmSenha"))) {

                String nome = request.getParameter("nome") + " " + request.getParameter("sobrenome");

                if (!request.getParameter("matricula").equals("") && !request.getParameter("turma").equals("")) {

                    Aluno a = new Aluno();
                    GenericDAO<Aluno> dao = new GenericDAO<>();

                    a.setMatricula(request.getParameter("matricula"));
                    a.setTurma(request.getParameter("turma"));
                    a.setNome(nome);
                    a.setEmail(request.getParameter("email"));
                    a.setSenha(request.getParameter("senha"));

                    dao.saveOrUpdate(a);

                    response.sendRedirect("../djudge/cadastro.jsp");

                } else {

                    if (!request.getParameter("siape").equals("")) {

                        Avaliador a = new Avaliador();
                        GenericDAO<Avaliador> dao = new GenericDAO<>();

                        a.setSiape(request.getParameter("siape"));
                        a.setNome(nome);
                        a.setEmail(request.getParameter("email"));
                        a.setSenha(request.getParameter("senha"));

                        dao.saveOrUpdate(a);

                        response.sendRedirect("../djudge/cadastro.jsp");

                    }

                }

            }

        } else {

            if (acao.equals("entrar")) {

                PrintWriter out = response.getWriter();

                String email = request.getParameter("email");
                String senha = request.getParameter("senha");

                PrivadoDAO pDAO = new PrivadoDAO();

                Long idPrivado = pDAO.login(email, senha);

                Privado p;

                if (idPrivado == null) {
                    out.println("NULL");
                } else if (idPrivado == -1) {
                    out.println("-1");
                } else {
                    try {
                        GenericDAO<Privado> pDAO2 = new GenericDAO<>();
                        p = pDAO2.findById(Privado.class, idPrivado);
                        if (p != null) {
                            request.getSession().setAttribute("usuario", p);
                            response.sendRedirect("/djudge/usuario/index.jsp");
                        } else {
                            out.println("ERRO");
                        }
                    } catch (IOException e) {
                        out.println("ERRO " + e.getMessage());
                    }

                }

            }

        }

    }

}
