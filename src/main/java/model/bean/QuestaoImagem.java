package model.bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import model.dao.BaseEntity;

@Entity
public class QuestaoImagem implements Serializable, BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; 
    
    @Lob
    @Column(columnDefinition = "longblob")
    private byte[] imagem;
    
    private String id_questao;
    
    @ManyToOne
    private Questao questao;

    public QuestaoImagem() {
    }

    public QuestaoImagem(Long id, byte[] imagem, String id_questao) {
        this.id = id;
        this.imagem = imagem;
        this.id_questao = id_questao;
    }

    @Override
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public byte[] getImagem() {
        return imagem;
    }

    public void setImagem(byte[] imagem) {
        this.imagem = imagem;
    }

    public Questao getQuestao() {
	return questao;
    }

    public void setQuestao(Questao questao) {
	this.questao = questao;
    }
    
     public String getIdQuestao() {
        return id_questao;
    }

    public void setIdQuestao(String id_questao) {
        this.id_questao = id_questao;
    }
    
}

