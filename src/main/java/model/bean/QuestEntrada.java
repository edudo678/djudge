package model.bean;

public class QuestEntrada {

    private int numQuest;
    
    private String entrada;
    

    public QuestEntrada() {}

    public QuestEntrada(int numQuest, String entrada) {
        this.numQuest = numQuest;
        this.entrada = entrada;
    }

    public int getNumQuest() {
        return numQuest;
    }

    public void setNumQuest(int numQuest) {
        this.numQuest = numQuest;
    }

    public String getEntrada() {
        return entrada;
    }

    public void setEntrada(String entrada) {
        this.entrada = entrada;
    }
    
}
