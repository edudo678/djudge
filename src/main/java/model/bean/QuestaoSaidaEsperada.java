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
 * @author eddunic
 */
@Entity
public class QuestaoSaidaEsperada implements Serializable, BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Id
    private String saidaEsperada;

    @Id
    @ManyToOne
    private Questao questao;

    public QuestaoSaidaEsperada() {
    }

    public QuestaoSaidaEsperada(Long id, String saidaEsperada) {
        this.id = id;
        this.saidaEsperada = saidaEsperada;
    }

    @Override
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSaidaEsperada() {
        return saidaEsperada;
    }

    public void setSaidaEsperada(String saidaEsperada) {
        this.saidaEsperada = saidaEsperada;
    }

    public Questao getQuestao() {
        return questao;
    }

    public void setQuestao(Questao questao) {
        this.questao = questao;
    }

}
