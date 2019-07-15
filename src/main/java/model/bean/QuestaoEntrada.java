package model.bean;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import model.dao.BaseEntity;

@Entity
public class QuestaoEntrada implements Serializable, BaseEntity {
       
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; 
    
    @Id
    private String entrada;
    
    @Id
    @ManyToOne
    private Questao questao;

    public QuestaoEntrada(Long id, String entrada) {
        this.id = id;
        this.entrada = entrada;
    }

    public QuestaoEntrada() {
    }

    @Override
    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public Questao getQuestao() {
	return questao;
    }

    public void setQuestao(Questao questao) {
	this.questao = questao;
    }

    public String getEntrada() {
        return entrada;
    }

    public void setEntrada(String entrada) {
        this.entrada = entrada;
    }
}
