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
public class QuestaoRestricao implements Serializable, BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 255, columnDefinition = "longblob")
    private byte[] restricao;

    private String id_questao;

    @ManyToOne(cascade={ CascadeType.REMOVE })
    private Questao questao;

    public QuestaoRestricao() {
    }

    public QuestaoRestricao(Long id, byte[] restricao, String id_questao) {
        this.id = id;
        this.restricao = restricao;
        this.id_questao = id_questao;
    }

    @Override
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public byte[] getRestricao() {
        return restricao;
    }

    public void setRestricao(byte[] restricao) {
        this.restricao = restricao;
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
