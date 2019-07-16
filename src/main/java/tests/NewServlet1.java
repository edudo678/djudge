package tests;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Aluno;
import model.bean.Privado;
import model.dao.AlunoDAO;
import model.dao.GenericDAO;
import model.dao.PrivadoDAO;

/**
 *
 * @author eddunic
 */
public class NewServlet1 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //saveOrUpdate save
//	model.bean.Privado p = new model.bean.Privado();
//	GenericDAO<model.bean.Privado> daoP = new GenericDAO<>();
//	p.setNome("Jucibs");
//	daoP.saveOrUpdate(p);
        model.bean.Aluno a = new model.bean.Aluno();
        GenericDAO<model.bean.Aluno> daoA = new GenericDAO<>();
        a.setNome("Eduardo");
        a.setSenha("123");
        daoA.saveOrUpdate(a);
//	Avaliador prof = new Avaliador();
//	prof.setId(1L);
//	Questao q = new Questao();
//	q.setTitulo("Lobo Mau");
//	q.setAvaliador(prof);
//	GenericDAO<Questao> daoQ = new GenericDAO<>();
//	daoQ.saveOrUpdate(q);
//findById
//	GenericDAO<Privado> dao = new GenericDAO<>();
//	Privado p = dao.findById(Privado.class, 1L);
//
//	System.out.println("### Entidade Pessoa encontrada ###");
//	System.out.println("ID: " + p.getId());
//	System.out.println("NOME: " + p.getNome());
//	System.out.println("Senha: " + p.getSenha());
//saveOrUpdate update
//	GenericDAO<Privado> dao = new GenericDAO<>();
//
//	Privado p = dao.findById(Privado.class, 1L);
//	p.setSenha("quatromeiacinco");
//	dao.saveOrUpdate(p);
//	System.out.println("Entidade atualizada com sucesso.");
//remove
//	GenericDAO<Privado> dao = new GenericDAO<>();
//	dao.remove(Privado.class, 2L);
//	System.out.println("Entidades removidas com sucesso!");
//        AlunoDAO dao = new AlunoDAO();
//        Aluno a = dao.findById(Aluno.class, 2L);
//        dao.remove(a);     
//        GenericDAO<Privado> dao = new GenericDAO();
//        Privado p = dao.findById2(Privado.class, 1L);
//        dao.remove(p);

    }

}
