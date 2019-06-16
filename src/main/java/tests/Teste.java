/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tests;

import model.bean.Avaliador;
import model.bean.Questao;
import model.dao.GenericDAO;

/**
 *
 * @author eddunic
 */
public class Teste {

    public static void main(String[] args) {

//saveOrUpdate save
//	model.bean.Privado p = new model.bean.Privado();
//	GenericDAO<model.bean.Privado> daoP = new GenericDAO<>();
//	p.setNome("Jucibs");
//	daoP.saveOrUpdate(p);
	model.bean.Aluno a = new model.bean.Aluno();
	GenericDAO<model.bean.Aluno> daoA = new GenericDAO<>();
	a.setNome("Eduardo");
	a.setSenha("123");
	daoA.saveOrUpdate(a);


//	Avaliador prof = new Avaliador();
//	prof.setId(1L);
//	Questao q = new Questao();
//	q.setTitulo("Lobo Mau");
//	q.setAvaliador(prof);
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
