package util;

import java.io.File;
import java.net.MalformedURLException;
import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.MultiPartEmail;

public class CommonsMail {

    public static void enviarEmail(String endereco, File codigo, String nome, String turma, String matricula, String questao) throws EmailException, MalformedURLException {
                  
        EmailAttachment attachment = new EmailAttachment();  
        attachment.setPath(codigo.getPath());
        attachment.setDisposition(EmailAttachment.ATTACHMENT);  
        attachment.setDescription("Anexo");  
        attachment.setName(codigo.getName()); 

        try {  
          MultiPartEmail email = new MultiPartEmail();  
          email.setDebug(true);  
          email.setHostName("smtp.gmail.com");  
          email.setFrom("adopets.foundation@gmail.com", "Djudge");
          email.setAuthentication("adopets.foundation@gmail.com","stephoda");  
          email.setSSL(true);  
          email.addTo(endereco); 
          email.setFrom("adopets.foundation@gmail.com"); 
          email.setSubject("Submissão Djudge");  
          email.setMsg(questao + "\n" + "Nome: " + nome + "\n" + "Matrícula: " + matricula + "\n" + "Turma: " 
                  + turma);  

          email.attach(attachment);  
  
          email.send();  
      } catch (EmailException e) {  
          e.printStackTrace();  
      }  
    }
}