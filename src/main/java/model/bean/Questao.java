package model.bean;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import model.dao.BaseEntity;

@Entity
public class Questao implements Serializable, BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 255, columnDefinition = "longblob")
    private byte[] titulo;

    @Column(length = 255, columnDefinition = "longblob")
    private byte[] enunciado;

    @Column(nullable = true)
    private int nivel;

    private String publico;

    @Lob
    @Column(columnDefinition = "longblob")
    private byte[] codigoFonteGabarito;

    @Column(nullable = true)
    private int peso;

    @Column(nullable = true)
    private Double tempoExec;

    @Column(length = 255, columnDefinition = "longblob")
    private byte[] entrada;

    @Column(length = 255, columnDefinition = "longblob")
    private byte[] saida;
    
    private Long idAvaliador;

    @ManyToOne
    private Avaliador avaliador;

    @ManyToOne
    private Questionario questionario;

    public Questao() {
    }

    public Questao(Long id, byte[] titulo, byte[] enunciado, int nivel, String publico, byte[] codigoFonteGabarito,
            int peso, Double tempoExec,  byte[] entrada,  byte[] saida, Long idAvaliador) {
        this.id = id;
        this.titulo = titulo;
        this.enunciado = enunciado;
        this.nivel = nivel;
        this.publico = publico;
        this.codigoFonteGabarito = codigoFonteGabarito;
        this.peso = peso;
        this.tempoExec = tempoExec;
        this.entrada = entrada;
        this.saida = saida;
        this.idAvaliador = idAvaliador;
    }

    @Override
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public byte[] getTitulo() {
        return titulo;
    }

    public void setTitulo(byte[] titulo) {
        this.titulo = titulo;
    }

    public byte[] getEnunciado() {
        return enunciado;
    }

    public void setEnunciado(byte[] enunciado) {
        this.enunciado = enunciado;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public String getPublico() {
        return publico;
    }

    public void setPublico(String publico) {
        this.publico = publico;
    }

    public byte[] getCodigoFonteGabarito() {
        return codigoFonteGabarito;
    }

    public void setCodigoFonteGabarito(byte[] codigoFonteGabarito) {
        this.codigoFonteGabarito = codigoFonteGabarito;
    }

    public Double getTempoExec() {
        return tempoExec;
    }

    public void setTempoExec(Double tempoExec) {
        this.tempoExec = tempoExec;
    }

    public int getPeso() {
        return peso;
    }

    public void setPeso(int peso) {
        this.peso = peso;
    }

    public byte[] getEntrada() {
        return entrada;
    }

    public void setEntrada(byte[] entrada) {
        this.entrada = entrada;
    }

    public byte[] getSaida() {
        return saida;
    }

    public void setSaida(byte[] saida) {
        this.saida = saida;
    }

    public Avaliador getAvaliador() {
        return avaliador;
    }

    public void setAvaliador(Avaliador avaliador) {
        this.avaliador = avaliador;
    }

    public Questionario getQuestionario() {
        return questionario;
    }

    public void setQuestionario(Questionario questionario) {
        this.questionario = questionario;
    }

    public Long getIdAvaliador() {
        return idAvaliador;
    }

    public void setIdAvaliador(Long idAvaliador) {
        this.idAvaliador = idAvaliador;
    }
    
}
