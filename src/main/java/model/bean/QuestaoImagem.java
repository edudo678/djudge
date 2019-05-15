package model.bean;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import model.dao.BaseEntity;

@Entity
public class QuestaoImagem implements Serializable, BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; 
    
    @Id
    private String imagem;
    
    @Id
    @ManyToOne
    private Questao questao;
    

    public QuestaoImagem() {
    }

    public QuestaoImagem(Long id, String imagem) {
        this.id = id;
        this.imagem = imagem;
    }

    @Override
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public Questao getQuestao() {
	return questao;
    }

    public void setQuestao(Questao questao) {
	this.questao = questao;
    }
    
}

