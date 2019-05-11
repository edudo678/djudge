/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tests;

import model.bean.Coordenacao;
import model.bean.Privado;
import model.bean.Professor;
import model.bean.Questao;
import model.dao.GenericDAO;

/**
 *
 * @author eddunic
 */
public class Teste {

    public static void main(String[] args) {

//saveOrUpdate save
//	Privado priv = new Privado(); 
//	GenericDAO<Privado> daoPriv = new GenericDAO<>();
//	priv.setEmail("privado@jmail.com");
//	daoPriv.saveOrUpdate(priv);
//	System.out.println("Entidades salvas com sucesso!");
	
//	Coordenacao c = new Coordenacao();
//	GenericDAO<Coordenacao> daoC = new GenericDAO<>();
//	c.setNome("Jucibs");
//	daoC.saveOrUpdate(c);

	Professor p = new Professor();
	GenericDAO<Professor> daoP = new GenericDAO<>();
	p.setNome("Jucibs");
	daoP.saveOrUpdate(p);
//
//	Professor prof = new Professor();
//	prof.setId(3L);
//	Questao q = new Questao();
//	q.setTitulo("Lobo Mau");
//	q.setProfessor(prof);
//	GenericDAO<Questao> daoQ = new GenericDAO<>();
//	daoQ.saveOrUpdate(q);


//findById
//	GenericDAO<Privado> dao = new GenericDAO<>();
//	Privado p = dao.findById(Privado.class, 1L);
//
//	System.out.println("### Entidade Pessoa encontrada ###");
//	System.out.println("ID: " + p.getId());
//	System.out.println("NOME: " + p.getEmail());
//	System.out.println("Senha: " + p.getSenha());


//saveOrUpdate update
//	GenericDAO<Privado> dao = new GenericDAO<>();
//
//	Privado p = dao.findById(Privado.class, 1L);
//	p.setSenha("quatromeiacinco");
//	dao.saveOrUpdate(p);
//	System.out.println("Entidade atualizada com sucesso.");


//remove
//	GenericDAO<Privado> dao = new GenericDAO<>();
//	dao.remove(Privado.class, 1L);
//	System.out.println("Entidades removidas com sucesso!");

    }

}

//https://www.profissionaisti.com.br/2016/12/design-pattern-criando-uma-classe-dao-generica/
