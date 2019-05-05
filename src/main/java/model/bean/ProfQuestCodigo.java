package model.bean;

public class ProfQuestCodigo {

    private int numQuest;
    
    private String siapeProf;
    
    private String emailProf;
    
    private String codigo;
    

    public ProfQuestCodigo() {
    }

    public ProfQuestCodigo(int numQuest, String siapeProf, String emailProf, String codigo) {
        this.numQuest = numQuest;
        this.siapeProf = siapeProf;
        this.emailProf = emailProf;
        this.codigo = codigo;
    }

    public int getNumQuest() {
        return numQuest;
    }

    public void setNumQuest(int numQuest) {
        this.numQuest = numQuest;
    }

    public String getSiapeProf() {
        return siapeProf;
    }

    public void setSiapeProf(String siapeProf) {
        this.siapeProf = siapeProf;
    }

    public String getEmailProf() {
        return emailProf;
    }

    public void setEmailProf(String emailProf) {
        this.emailProf = emailProf;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    
}
