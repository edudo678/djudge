package model.dao;

import java.util.List;
import javax.persistence.EntityManager;
import model.bean.Questao;
import util.ConnectionFactory;

/**
 *
 * @author eddunic
 */
public class QuestaoDAO {
    
     public List<Questao> getList() {
	EntityManager manager = ConnectionFactory.getEntityManager();
        List<Questao> questoes = null;
        try {
            questoes = manager.createQuery("FROM Questao q").getResultList();
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            manager.close();
        }
        return questoes;
    }
    
}
