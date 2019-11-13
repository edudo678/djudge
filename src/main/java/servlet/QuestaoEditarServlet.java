package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Questao;
import model.bean.QuestaoEntrada;
import model.bean.QuestaoImagem;
import model.bean.QuestaoRestricao;
import model.dao.GenericDAO;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author eddunic
 */
public class QuestaoEditarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Questao q = new Questao();
        GenericDAO<Questao> gq = new GenericDAO<>();
        q = gq.findById(Questao.class, Long.parseLong(request.getParameter("id")));

        q.setTitulo(request.getParameter("titulo").getBytes());
        q.setEnunciado(request.getParameter("enunciado").getBytes());
        q.setEntrada(request.getParameter("entrada").getBytes());
        q.setSaida(request.getParameter("saida").getBytes());
//        q.setNivel(Integer.parseInt(nivel));
//        q.setPeso(Integer.parseInt(peso));

        gq.saveOrUpdate(q);

//        byte[] fileContent = FileUtils.readFileToByteArray(new File(imagem.getAbsolutePath()));
//        String encodedString = Base64.getEncoder().encodeToString(fileContent);
//
//        String ext[] = request.getAbsolutePath().split("\\.");
//        int i = ext.length;
//        String extensao = null;
//        if (i > 1) {
//            extensao = ext[i - 1];
//        }
//
//        String img = "data:image/" + extensao + ";base64," + encodedString;
//
//        System.out.println(img);
//        QuestaoImagem qi = new QuestaoImagem();
//
//        qi.setImagem(img.getBytes());
//        qi.setIdQuestao(String.valueOf(q.getId()));
//        qi.setQuestao(q);
//
//        GenericDAO<QuestaoImagem> gqi = new GenericDAO<>();
//        gqi.saveOrUpdate(qi);

//        QuestaoRestricao qr = new QuestaoRestricao();
//        
//        GenericDAO<QuestaoRestricao> gqr = new GenericDAO<>();
//        qr = gqr.findById(QuestaoRestricao.class, Long.parseLong(request.getParameter("id")));
//
//        qr.setRestricao(request.getParameter("restricao").getBytes());
//        qr.setIdQuestao(String.valueOf(q.getId()));
//        qr.setQuestao(q);
//        
//        gqr.saveOrUpdate(qr);
//        
//        QuestaoEntrada qe = new QuestaoEntrada();
//        
//        GenericDAO<QuestaoEntrada> gqe = new GenericDAO<>();
//        qe = gqe.findById(QuestaoEntrada.class, Long.parseLong(request.getParameter("id")));
//
//        qe.setEntrada(request.getParameter("entradaExemplo").getBytes());
//        qe.setIdQuestao(String.valueOf(q.getId()));
//        qe.setQuestao(q);
//
//        gqe.saveOrUpdate(qe);

        response.sendRedirect("../djudge/usuario/avaliador/index.jsp");
    }

}
