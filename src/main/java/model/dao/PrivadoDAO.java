package model.dao;

import javax.persistence.EntityManager;
import model.bean.Privado;
import org.hibernate.Query;
import util.ConnectionFactory;

/**
 *
 * @author eddunic
 */
public class PrivadoDAO {

    public Long login(String usuario, String senha) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        Query query;
        Privado p;
        try {
            manager.getTransaction().begin();
            //Criptografia c = new Criptografia();
            query = (Query) manager.createQuery("from Privado p where p.email =:usuario or p.nome =:usuario")
                    .setParameter("usuario", usuario);
            p = (Privado) query.getSingleResult();
            manager.getTransaction().commit();
            p.setSenha(p.getSenha());
            if (p.getSenha().equals(senha)) {
                return p.getId();
            } else {
                return new Long(-1);
            }
        } catch (Exception e) {
            manager.getTransaction().rollback();
            return null;
        }
    }

}
