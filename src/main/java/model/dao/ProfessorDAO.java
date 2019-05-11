/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;
import javax.persistence.EntityManager;
import model.bean.Professor;
import util.ConnectionFactory;

/**
 *
 * @author eddunic
 */
public class ProfessorDAO {
    
    public List<Professor> getList() {
	EntityManager manager = ConnectionFactory.getEntityManager();
        List<Professor> professores = null;
        try {
            professores = manager.createQuery("FROM Professor p").getResultList();
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            manager.close();
        }
        return professores;
    }
    
}
