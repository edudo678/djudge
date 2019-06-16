/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
