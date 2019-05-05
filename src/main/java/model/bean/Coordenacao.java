package model.bean;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import model.dao.BaseEntity;

@Entity
public class Coordenacao extends Privado implements Serializable, BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;

    private String senha;

    private String email;

    public Coordenacao() {
    }

    public Coordenacao(String nome, String senha, String email) {
	this.nome = nome;
	this.senha = senha;
	this.email = email;
    }

    @Override
    public Long getId() {
	return id;
    }

    @Override
    public void setId(Long id) {
	this.id = id;
    }

    @Override
    public String getNome() {
	return nome;
    }

    @Override
    public void setNome(String nome) {
	this.nome = nome;
    }

    @Override
    public String getSenha() {
	return senha;
    }

    @Override
    public void setSenha(String senha) {
	this.senha = senha;
    }

    @Override
    public String getEmail() {
	return email;
    }

    @Override
    public void setEmail(String email) {
	this.email = email;
    }

}
