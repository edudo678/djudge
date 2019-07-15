package model.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Administrador extends Privado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //idAdminCria
    
    private String emailAdminCria;
   
    public Administrador() {
    }

    public Administrador(String email, Long id, String senha, String nome, String emailAdminCria) {
        super(email, id, senha, nome);
        this.emailAdminCria = emailAdminCria;
    }
    
    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public String getEmailAdminCria() {
        return emailAdminCria;
    }

    public void setEmailAdminCria(String emailAdminCria) {
        this.emailAdminCria = emailAdminCria;
    }

}
