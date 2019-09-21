/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import model.bean.QuestaoEntrada;
import util.ConnectionFactory;

/**
 *
 * @author eddunic
 */
public class QuestaoEntradaDAO {
    
     public List<QuestaoEntrada> getEntradaByQuestao(String id) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        Query query;
        manager.getTransaction().begin();
        query = (Query) manager.createQuery("from " + QuestaoEntrada.class.getName() + " r where r.id_questao =:id")
                .setParameter("id", id);
        manager.getTransaction().commit();
        return query.getResultList();
    }
    
}
