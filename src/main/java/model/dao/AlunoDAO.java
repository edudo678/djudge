package model.dao;

import java.util.List;
import javax.persistence.EntityManager;
import model.bean.Aluno;
import util.ConnectionFactory;

/**
 *
 * @author eddunic
 */
public class AlunoDAO {

    public List<Aluno> getList() {
        EntityManager manager = ConnectionFactory.getEntityManager();
        List<Aluno> alunos = null;
        try {
            alunos = manager.createQuery("FROM Aluno a").getResultList();
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            manager.close();
        }
        return alunos;
    }

}
