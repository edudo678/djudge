import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Aluno;
import model.bean.Avaliador;
import model.dao.GenericDAO;

/**
 *
 * @author eddunic
 */
public class PreencheBanco extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Aluno a = new Aluno();
        GenericDAO<Aluno> dao = new GenericDAO<>();

        a.setMatricula("201711440060");
        a.setTurma("IINF31A");
        a.setNome("Aluno1");
        a.setEmail("al@g.com");
        a.setSenha("1");

        dao.saveOrUpdate(a);

        Avaliador av = new Avaliador();
        GenericDAO<Avaliador> daov = new GenericDAO<>();

        av.setSiape("6402939");
        av.setNome("Professor1");
        av.setEmail("av@g.com");
        av.setSenha("1");

        daov.saveOrUpdate(av);

    }

}
