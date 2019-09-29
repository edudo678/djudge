<%@page import="model.dao.GenericDAO"%>
<%@page import="model.dao.QuestaoDAO"%>
<%@page import="model.bean.Questao"%>

<html>
    <head>
        <meta charset = "utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Djudge - Corretor de Questões</title>

        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/bootstrap-4.3.1-dist/bootstrap-grid.css"/>
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.css"/>

        <script src="../js/bootstrap/bootstrap.js"></script>

        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
        <script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script> 


        <script src="../js/jquery/jquery-3.4.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="../js/bootstrap/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/bootstrap/bootstrap-file-upload.css">
        <script src="../js/bootstrap/bootstrap-file-upload.js"></script>
    </head>

    <body class="background">
        <jsp:include page="header.jsp"/>
        <div class="container-fluid">
            <div class="form-row justify-content-center">
                <div class="card col-lg-11 px-4 py-4 text-black">
                    <form action="/djudge/SubmissaoAvaliadorServlet?id=" enctype="multipart/form-data" method="POST">
                        <h4>Cadastro de questão</h4>
                        <small>Para finalizar o cadastro, insira o código fonte da questão</small>

                        <br><br>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputState">Selecione a linguagem</label><br>
                                <select class="form-control" name="compilerId">
                                    <option>Selecione a linguagem</option>
                                    <option  value="c">C</option>   
                                    <option  value="cpp">C++</option>                  
                                    <option value="java">Java</option> 
                                    <option value="python2">Python 2</option> 
                                    <option value="python3">Python 3</option> 
                                </select>
                            </div>

                            <div class="form-group col-md-6">
                                <label>Código-fonte gabarito</label>
                                <input type="file" name="source" class="form-control-file" id="source"> 
                            </div>
                        </div>


                        <div class="row justify-content-end" >
                            <a href="javascript:history.back()" style="margin-right: 3px"class="btn btn-secondary">Voltar</a>
                            <button type="submit"  class="btn btn-success">Confirmar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>