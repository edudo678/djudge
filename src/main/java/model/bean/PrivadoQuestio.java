package model.bean;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import model.dao.BaseEntity;

/**
 *
 * @author Mauro Roger
 */
@Entity
public class PrivadoQuestio implements Serializable, BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String saida;
    
    private int pontuacaoManual;
    
    private int pontuacaoAuto;
    
    private float media;
    
    @ManyToOne
    private Privado privado;
    
    @ManyToOne
    private Questionario questionario;
    

    public PrivadoQuestio() {
    }

    public PrivadoQuestio(Long id, String saida, int pontuacaoManual, int pontuacaoAuto, float media) {
	this.id = id;
	this.saida = saida;
	this.pontuacaoManual = pontuacaoManual;
	this.pontuacaoAuto = pontuacaoAuto;
	this.media = media;
    }

    @Override
    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getSaida() {
	return saida;
    }

    public void setSaida(String saida) {
	this.saida = saida;
    }

    public int getPontuacaoManual() {
	return pontuacaoManual;
    }

    public void setPontuacaoManual(int pontuacaoManual) {
	this.pontuacaoManual = pontuacaoManual;
    }

    public int getPontuacaoAuto() {
	return pontuacaoAuto;
    }

    public void setPontuacaoAuto(int pontuacaoAuto) {
	this.pontuacaoAuto = pontuacaoAuto;
    }

    public float getMedia() {
	return media;
    }

    public void setMedia(float media) {
	this.media = media;
    }

    public Privado getPrivado() {
	return privado;
    }

    public void setPrivado(Privado privado) {
	this.privado = privado;
    }

    public Questionario getQuestionario() {
	return questionario;
    }

    public void setQuestionario(Questionario questionario) {
	this.questionario = questionario;
    }
    
}
