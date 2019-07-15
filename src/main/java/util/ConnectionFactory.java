package util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author eddunic
 */
public class ConnectionFactory {

    private static EntityManagerFactory factory = Persistence.createEntityManagerFactory("djudgePU");

    public static EntityManager getEntityManager() {
	return factory.createEntityManager();
    }
    
}
