<%-- 
    Document   : gabarito
    Created on : 21/09/2019, 22:01:11
    Author     : eddunic
--%>
<%@page import="model.dao.GenericDAO"%>
<%@page import="model.bean.Questao"%>
<%@page import="model.bean.Questao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            Questao q = new Questao();
            GenericDAO<Questao> gqDAO = new GenericDAO();
            q = gqDAO.findById(Questao.class, Long.parseLong(request.getParameter("id")));
            String codeDecode  = new String(q.getCodigoFonteGabarito(), "UTF-8");
        %>
        <%=codeDecode%>
    </body>
</html>
