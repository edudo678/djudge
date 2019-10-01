package model.dao;

import java.util.List;
import javax.persistence.EntityManager;
import model.bean.Privado;
import org.hibernate.Query;
import util.ConnectionFactory;

/**
 *
 * @author eddunic
 */
public class PrivadoDAO {

    public Long login(String email, String senha) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        Query query;
        Privado p;
        try {
            manager.getTransaction().begin();
            //Criptografia c = new Criptografia();
            query = (Query) manager.createQuery("from Privado p where p.email =:email")
                    .setParameter("email", email);
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

    public String getTurmaById(Long id) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        Query query;
        manager.getTransaction().begin();
        query = (Query) manager.createQuery("select turma from " + Privado.class.getName() + " r where r.id =:id")
                .setParameter("id", id);
        manager.getTransaction().commit();
        return (String) query.getSingleResult();
    }
    
    public String getMatriculaById(Long id) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        Query query;
        manager.getTransaction().begin();
        query = (Query) manager.createQuery("select matricula from " + Privado.class.getName() + " r where r.id =:id")
                .setParameter("id", id);
        manager.getTransaction().commit();
        return (String) query.getSingleResult();
    }
    
     public String getSiapeById(Long id) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        Query query;
        manager.getTransaction().begin();
        query = (Query) manager.createQuery("select siape from " + Privado.class.getName() + " r where r.id =:id")
                .setParameter("id", id);
        manager.getTransaction().commit();
        return (String) query.getSingleResult();
    }

}
