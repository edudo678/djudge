package model.dao;

import java.util.List;
import javax.persistence.EntityManager;
import model.bean.Avaliador;
import util.ConnectionFactory;

/**
 *
 * @author eddunic
 */
public class AvaliadorDAO {
    
    public List<Avaliador> getList() {
	EntityManager manager = ConnectionFactory.getEntityManager();
        List<Avaliador> avaliadores = null;
        try {
            avaliadores = manager.createQuery("FROM Avaliador a").getResultList();
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            manager.close();
        }
        return avaliadores;
    }
    
}
