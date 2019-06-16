package model.bean;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import model.dao.BaseEntity;

@Entity
public class Questionario implements Serializable, BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
//    private String siapeAv;
    
    @ManyToOne
    private Avaliador avaliador;
    

    public Questionario() {
    }

    public Questionario(Long id, String siapeAv) {
        this.id = id;
//        this.siapeAv = siapeAv;
    }

    @Override
    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

//    public String getSiapeAv() {
//        return siapeAv;
//    }
//
//    public void setSiapeAv(String siapeAv) {
//        this.siapeAv = siapeAv;
//    }

    public Avaliador getAvaliador() {
	return avaliador;
    }

    public void setAvaliador(Avaliador avaliador) {
	this.avaliador = avaliador;
    }
    
}
