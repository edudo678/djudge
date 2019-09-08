package util;

/**
 *
 * @author Ronaldo
 */
public class JDoodleOutputFormat {

    private final String[] splitOutput;
    private final String language;
    private String codeOutput;
    private String statusCode;
    private String memory;
    private String cpuTime;

    public JDoodleOutputFormat(String jdoodleOutput, String language) {
        splitOutput = jdoodleOutput.split("\"");
        codeOutput = "";
        statusCode = "";
        memory = "";
        cpuTime = "";
        this.language = language;

        formatAttributes();
    }

    private void formatAttributes() {
        int i = 0;

        while (!splitOutput[i].equals("output")) {
            i++;
        }

        i++;

        while (!splitOutput[i].equals("statusCode")) {
            codeOutput += splitOutput[i];
            i++;
        }

        i++;

        while (!splitOutput[i].equals("memory")) {
            statusCode += splitOutput[i];
            i++;
        }

        i++;

        while (!splitOutput[i].equals("cpuTime")) {
            memory += splitOutput[i];
            i++;
        }

        i++;

        while (i < splitOutput.length) {
            cpuTime += splitOutput[i];
            i++;
        }

        if (codeOutput.contains("\\n")) {
            codeOutput = codeOutput.substring(1, codeOutput.length() - 3);
        } else {
            codeOutput = codeOutput.substring(1, codeOutput.length() - 1);
        }
        statusCode = statusCode.substring(1, statusCode.length() - 1);
        memory = memory.substring(1, memory.length() - 1);
        cpuTime = cpuTime.substring(1, cpuTime.length() - 1);
    }

    public String getCodeOutput() {
        return codeOutput;
    }

    public String getStatusCode() {
        return statusCode;
    }

    public String getMemory() {
        return memory;
    }

    public String getCpuTime() {
        return cpuTime;
    }

    public String getLanguage() {
        return language;
    }

}
