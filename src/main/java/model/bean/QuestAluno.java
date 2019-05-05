package model.bean;

public class QuestAluno {

    private int numQuest;
    
    private String matAluno;
    
    private String emailAluno;
    
    private String codAluno;
    
    private String saida;
    
    private int pontuacao;
    

    public QuestAluno() {}

    public QuestAluno(int numQuest, String matAluno, String emailAluno, String codAluno, String saida, int pontuacao) {
        this.numQuest = numQuest;
        this.matAluno = matAluno;
        this.emailAluno = emailAluno;
        this.codAluno = codAluno;
        this.saida = saida;
        this.pontuacao = pontuacao;
    }

    public int getNumQuest() {
        return numQuest;
    }

    public void setNumQuest(int numQuest) {
        this.numQuest = numQuest;
    }

    public String getMatAluno() {
        return matAluno;
    }

    public void setMatAluno(String matAluno) {
        this.matAluno = matAluno;
    }

    public String getEmailAluno() {
        return emailAluno;
    }

    public void setEmailAluno(String emailAluno) {
        this.emailAluno = emailAluno;
    }

    public String getCodAluno() {
        return codAluno;
    }

    public void setCodAluno(String codAluno) {
        this.codAluno = codAluno;
    }

    public String getSaida() {
        return saida;
    }

    public void setSaida(String saida) {
        this.saida = saida;
    }

    public int getPontuacao() {
        return pontuacao;
    }

    public void setPontuacao(int pontuacao) {
        this.pontuacao = pontuacao;
    }
    
}
