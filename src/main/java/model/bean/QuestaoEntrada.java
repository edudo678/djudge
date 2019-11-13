package model.bean;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
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

    @Column(length = 255, columnDefinition = "longblob")
    private byte[] entrada;

    private String id_questao;

    @ManyToOne(cascade={ CascadeType.REMOVE })
    private Questao questao;

    public QuestaoEntrada() {
    }

    public QuestaoEntrada(Long id, byte[] entrada, String id_questao) {
        this.id = id;
        this.entrada = entrada;
        this.id_questao = id_questao;
    }

    @Override
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public byte[] getEntrada() {
        return entrada;
    }

    public void setEntrada(byte[] entrada) {
        this.entrada = entrada;
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
