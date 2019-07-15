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
    
    private String titulo;
    
    private String enunciado;
    
    private int nivel;
    
    private String publico;
    
    private String codigoFonteGabarito;
    
    private int peso;
    
    private float tempoExec;
    
    private String entrada;
    
    private String saida;
    
    @ManyToOne
    private Avaliador avaliador;
    
    @ManyToOne
    private Questionario questionario;
    
    public Questao() {
    }

    public Questao(Long id, String titulo, String enunciado, int nivel, String publico, String codigoFonteGabarito,
	    int peso, float tempoExec, String entrada, String saida) {
	this.id = id;
	this.titulo = titulo;
	this.enunciado = enunciado;
	this.nivel = nivel;
	this.publico = publico;
	this.codigoFonteGabarito = codigoFonteGabarito;
	this.peso = peso;
	this.tempoExec = tempoExec;
        this.entrada = entrada;
        this.saida = saida;
    }

    @Override
    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
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

    public String getPublico() {
	return publico;
    }

    public void setPublico(String publico) {
	this.publico = publico;
    }

    public String getCodigoFonteGabarito() {
	return codigoFonteGabarito;
    }

    public void setCodigoFonteGabarito(String codigoFonteGabarito) {
	this.codigoFonteGabarito = codigoFonteGabarito;
    }

    public float getTempoExec() {
	return tempoExec;
    }

    public void setTempoExec(float tempoExec) {
	this.tempoExec = tempoExec;
    }

    public int getPeso() {
	return peso;
    }

    public void setPeso(int peso) {
	this.peso = peso;
    }

    public String getEntrada() {
        return entrada;
    }

    public void setEntrada(String entrada) {
        this.entrada = entrada;
    }

    public String getSaida() {
        return saida;
    }

    public void setSaida(String saida) {
        this.saida = saida;
    }

    public Avaliador getAvaliador() {
	return avaliador;
    }

    public void setAvaliador(Avaliador avaliador) {
	this.avaliador = avaliador;
    }

    public Questionario getQuestionario() {
	return questionario;
    }

    public void setQuestionario(Questionario questionario) {
	this.questionario = questionario;
    }
    
}
