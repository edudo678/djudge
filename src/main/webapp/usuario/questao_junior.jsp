<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    </head>
    <body class="background">
        <jsp:include page="header.jsp"/>

        <div class="container-fluid home">

            <div class="row">
                <div class="col-8 row justify-content-end">
                    <div class="col-10">
                        <div class="card text-black">

                            <div class="card-body">                                
                                <h4 class="card-title text-center"><strong>Hello World</strong></h4>
                                <p class="card-text text-justify">
                                    Imprima "hello world".
                                </p>

                                <h5 class=""><strong>Saída</strong></h5>
                                <p class="card-text text-justify">
                                    Seu programa deve produzir uma linha contendo a saída esperada.</p>

                                <h5 class=""><strong>Exemplo</strong></h5>

                                <table class="table table-borderless">
                                    <tr>                                       
                                        <td><strong>Saída</strong></td>
                                    </tr>
                                    <tr>                                       
                                        <td>hello world</td>
                                    </tr>
                                </table>

                                <div class="list-group list-group-flush card-body ">
                                    <form action="/djudge/SubmissaoServlet?id=1" enctype="multipart/form-data" method="POST">
                                        <input class="form-control" type="hidden" id="id" name="id" value="1" readonly>
                                        <table class="table">
                                            <strong>Submissão</strong>
                                            <tr> 
                                                <td> 
                                                    <div>
                                                        <select name="compilerId">
                                                            <option>Selecione a linguagem</option>
                                                            <option  value="c">C</option>   
                                                            <option  value="cpp">C++</option>                  
                                                            <option value="java">Java</option> 
                                                            <option value="python2">Python 2</option> 
                                                            <option value="python3">Python 3</option> 
                                                        </select>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group">
                                                        <input type="file" name="source" class="form-control-file" id="exampleFormControlFile1">
                                                    </div>
                                                    <button type="submit" class="btn btn-primary btn-block">Submeter</button>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-4">
                    <div class="row justify-content-start">
                        <div class="card text-black col-md-5">
                            <div class="card-header text-center">
                                Menu
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"><a href="#" class="text-black">Histórico</a></li>
                                <li class="list-group-item"><a href="#" class="text-black">Maratonas</a></li>
                                <li class="list-group-item"><a href="#" class="text-black">Resultados</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
