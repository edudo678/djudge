package model.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Aluno extends Privado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; 
    
    private String turma;

    public Aluno() {
    }

    public Aluno(String email, Long id, String senha, String nome, String turma) {
        super(email, id, senha, nome);
        this.turma = turma;
    }

    @Override
    public Long getId() {
	return id;
    }

    @Override
    public void setId(Long id) {
	this.id = id;
    }

    public String getTurma() {
	return turma;
    }

    public void setTurma(String turma) {
	this.turma = turma;
    }

}
