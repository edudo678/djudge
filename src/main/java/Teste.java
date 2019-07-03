/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Aluno
 */
public class Teste {
    
    public static void main(String []args) {
        String aux = "{\"output\":\"Hello\nWorld\",\"statusCode\":200,\"memory\":\"444\",\"cpuTime\":\"0.00\"}";
        String[] output = aux.split("\"");
        
        //for(String s : output) {
            //System.out.println(s);
        //}
        System.out.println(output[3]);
    }
}
