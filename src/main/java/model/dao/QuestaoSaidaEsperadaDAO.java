package model.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import model.bean.QuestaoSaidaEsperada;
import util.ConnectionFactory;

/**
 *
 * @author eddunic
 */
public class QuestaoSaidaEsperadaDAO {
    
     public List<QuestaoSaidaEsperada> getSaidaByQuestao(String id) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        Query query;
        manager.getTransaction().begin();
        query = (Query) manager.createQuery("from " + QuestaoSaidaEsperada.class.getName() + " r where r.id_questao =:id")
                .setParameter("id", id);
        manager.getTransaction().commit();
        return query.getResultList();
    }
    
}
