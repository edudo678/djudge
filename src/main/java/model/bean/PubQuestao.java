package model.bean;

public class PubQuestao {

    private int numQuest;
    
    private String saida;
    

    public PubQuestao() {}

    public PubQuestao(int numQuest, String saida) {
        this.numQuest = numQuest;
        this.saida = saida;
    }

    public int getNumQuest() {
        return numQuest;
    }

    public void setNumQuest(int numQuest) {
        this.numQuest = numQuest;
    }

    public String getSaida() {
        return saida;
    }

    public void setSaida(String saida) {
        this.saida = saida;
    }
    
}
