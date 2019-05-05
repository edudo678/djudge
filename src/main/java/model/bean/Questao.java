package model.bean;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import model.dao.BaseEntity;

@Entity
public class Questao implements Serializable, BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int numero;

    private String titulo;

    private String enunciado;

    private int nivel;

    private String status;

    private String codigoFonte;

    private String saidaEsperada;

    private float tempoExec;

//   private String siapeProf;

//  private String emailProf;
    
    
//    private String emailCoord;

    @ManyToOne
    private Professor professor;

    public Questao() {
    }

    public Questao(Long id, int numero, String titulo, String enunciado, int nivel, String status, String codigoFonte,
	    String saidaEsperada, float tempoExec) {
	this.id = id;
	this.numero = numero;
	this.titulo = titulo;
	this.enunciado = enunciado;
	this.nivel = nivel;
	this.status = status;
	this.codigoFonte = codigoFonte;
	this.saidaEsperada = saidaEsperada;
	this.tempoExec = tempoExec;
    }

    @Override
    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public int getNumero() {
	return numero;
    }

    public void setNumero(int numero) {
	this.numero = numero;
    }

    public String getTitulo() {
	return titulo;
    }

    public void setTitulo(String titulo) {
	this.titulo = titulo;
    }

    public String getEnunciado() {
	return enunciado;
    }

    public void setEnunciado(String enunciado) {
	this.enunciado = enunciado;
    }

    public int getNivel() {
	return nivel;
    }

    public void setNivel(int nivel) {
	this.nivel = nivel;
    }

    public String getStatus() {
	return status;
    }

    public void setStatus(String status) {
	this.status = status;
    }

    public String getCodigoFonte() {
	return codigoFonte;
    }

    public void setCodigoFonte(String codigoFonte) {
	this.codigoFonte = codigoFonte;
    }

    public String getSaidaEsperada() {
	return saidaEsperada;
    }

    public void setSaidaEsperada(String saidaEsperada) {
	this.saidaEsperada = saidaEsperada;
    }

    public float getTempoExec() {
	return tempoExec;
    }

    public void setTempoExec(float tempoExec) {
	this.tempoExec = tempoExec;
    }
    
    public Professor getProfessor() {
	return professor;
    }

    public void setProfessor(Professor professor) {
	this.professor = professor;
    }

}
