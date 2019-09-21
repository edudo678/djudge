package model.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import model.bean.QuestaoImagem;
import util.ConnectionFactory;

/**
 *
 * @author eddunic
 */
public class QuestaoImagemDAO {
    
     public List<QuestaoImagem> getImagemByQuestao(String id) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        Query query;
        manager.getTransaction().begin();
        query = (Query) manager.createQuery("from " + QuestaoImagem.class.getName() + " r where r.id_questao =:id")
                .setParameter("id", id);
        manager.getTransaction().commit();
        return query.getResultList();
    }
    
}
