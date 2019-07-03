<%-- 
    Document   : jstl
    Created on : 07/05/2019, 22:43:57
    Author     : eddunic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="ProfessorDAO" class="model.dao.ProfessorDAO"/>
<c:set var="professores" value="${ProfessorDAO.getList()}"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title></title>
    </head>

    <body>
        <h1>Lista de Professores</h1>
        <table border="1">
            <tr><td>ID</td><td>Nome</td></tr>
            <c:forEach items="${professores}" var="professor">
                <tr>
                    <td><c:out value="${professor.id}"/></td>
                    <td><c:out value="${professor.nome}"/></td>
                </tr>
            </c:forEach>
        </table>
        <c:if test="${professores.size() == 0}">
            <h4>
                Nenhuma formação registrada ainda
            </h4>
        </c:if>
    </body>
</html>