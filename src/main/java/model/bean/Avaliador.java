package model.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Avaliador extends Privado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; 
    
    private String siape;

    public Avaliador() {
    }

    public Avaliador(String email, Long id, String senha, String nome, String siape) {
        super(email, id, senha, nome);
        this.siape = siape;
    }

    @Override
    public Long getId() {
	return id;
    }

    @Override
    public void setId(Long id) {
	this.id = id;
    }  

    public String getSiape() {
	return siape;
    }

    public void setSiape(String siape) {
	this.siape = siape;
    }

}
