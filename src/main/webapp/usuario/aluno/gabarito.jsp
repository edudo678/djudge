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
        <meta charset = "utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Djudge - Juiz Online</title>

        <link rel="stylesheet" href="../../css/fontawesome-all.css">
        <link rel="stylesheet" href="../../css/style.css">
        <link rel="stylesheet" href="../../css/header.css">
        <link rel="stylesheet" href="../../css/bootstrap-4.3.1-dist/bootstrap-grid.css"/>
        <link rel="stylesheet" href="../../css/bootstrap/bootstrap.css"/>
        <script src="../../js/bootstrap/bootstrap.js"></script>
        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
        <script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script>
        <script src="../../js/jquery/jquery-3.4.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="../../js/bootstrap/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container-fluid">
            <div class="col-12 row justify-content-center">
                <div class="card col-11 text-black px-4 py-4">
                    
                    <h4>Gabarito da questão</h4>
                    <small>Você pode baixar e testar</small>
                    <br>
                    <%
                        Questao q = new Questao();
                        GenericDAO<Questao> gqDAO = new GenericDAO();
                        q = gqDAO.findById(Questao.class, Long.parseLong(request.getParameter("id")));
                        String codeDecode = new String(q.getCodigoFonteGabarito(), "UTF-8");
                    %>
                    
                    <div class="col-12 border">
                        <a><%=codeDecode%></a>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../../footer.jsp"/>
    </body>
</html>
