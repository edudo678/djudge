package model.bean;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import model.dao.BaseEntity;

@Entity
public class PrivQuestioCodFonte implements Serializable, BaseEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; 
    
    @Id
    private String codigoFonte;
    
    @Id
    @ManyToOne
    private PrivadoQuestio privadoQuestio;
    
    public PrivQuestioCodFonte() {
    }

    public PrivQuestioCodFonte(Long id, String codigoFonte) {
        this.id = id;
        this.codigoFonte = codigoFonte;
    }

    @Override
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCodigoFonte() {
        return codigoFonte;
    }

    public void setCodigoFonte(String codigoFonte) {
        this.codigoFonte = codigoFonte;
    }

    public PrivadoQuestio getPrivadoQuestio() {
	return privadoQuestio;
    }

    public void setPrivadoQuestio(PrivadoQuestio privadoQuestio) {
	this.privadoQuestio = privadoQuestio;
    }
    
}