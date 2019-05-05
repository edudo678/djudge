package model.bean;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Mauro Roger
 */
public class ProfQuestao {
    
    private int numQuest;
    
    private int pontuacao;
    
    private String siapeProf;
    
    private String emailProf;
    
    private String saida;
    

    public ProfQuestao() { }
    
    public ProfQuestao(int numQuest, int pontuacao, String siapeProf, String emailProf, String saida) {
        this.numQuest = numQuest;
        this.pontuacao = pontuacao;
        this.siapeProf = siapeProf;
        this.emailProf = emailProf;
        this.saida = saida;
    }

    public int getNumQuest() {
        return numQuest;
    }

    public void setNumQuest(int numQuest) {
        this.numQuest = numQuest;
    }

    public int getPontuacao() {
        return pontuacao;
    }

    public void setPontuacao(int pontuacao) {
        this.pontuacao = pontuacao;
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

    public String getSaida() {
        return saida;
    }

    public void setSaida(String saida) {
        this.saida = saida;
    }   
    
}
