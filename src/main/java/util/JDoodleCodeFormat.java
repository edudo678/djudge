package util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author Ronaldo
 */
public class JDoodleCodeFormat {

    private final File codeFile;
    private final String language;
    private String script;

    public JDoodleCodeFormat(File codeFile, String language) {
        this.codeFile = codeFile;
        this.language = language;
        script = "";
        scriptFormat();
    }

    private void scriptFormat() {

        try {
            try (BufferedReader br = new BufferedReader(new FileReader(codeFile))) {
                while (br.ready()) {
                    if (language.equals("c") || (language.equals("cpp")) || language.equals("java")) {
                        //lê arquivo usando trim, do contrário a submissão
                        //não é possível
                        script += br.readLine().trim() + "\\n";
                    } else if (language.equals("python2") || language.equals("python3")) {
                        //para respeitar a identação obrigatória de códigos
                        //em python, não se usa trim
                        script += br.readLine() + "\\n";
                    }
                }
            }
        } catch (FileNotFoundException e) {
            System.out.println("Arquivo não encontrado!" + e.getMessage());
        } catch (IOException e) {
            System.out.println("Erro de entrada ou saída!" + e.getMessage());
        }

        String[] splitScript = script.split("\""); //corta string por aspas
        script = ""; //reinicializa script

        for (String s : splitScript) {
            script += s + "\\\""; //concatena colocando contrabarra e aspa
        }

        script = script.substring(0, script.length() - 4); //retira caracteres inúteis
    }

    public String getScript() {
        return script;
    }

}
