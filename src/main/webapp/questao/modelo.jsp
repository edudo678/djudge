<%-- 
    Document   : index
    Created on : 02/07/2019, 14:59:43
    Author     : Junior
--%>

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
                                <h4 class="card-title text-center"><strong>Câmara de Compensação</strong></h4>
                                <p class="card-text text-justify">
                                    Em uma cidade, muitas pessoas emprestam dinheiro para outras pessoas. A coisa chegou a um tal ponto que tem gente que é ao mesmo 
                                    tempo devedor e credor. As pessoas resolveram então pagar suas dívidas e cada uma emitiu os cheques para pagar suas dívidas. Por exemplo, na figura (a), 
                                    a pessoa C emitiu um cheque de 5 dinheiros para a pessoa A, e a pessoa D emitiu um cheque de 3 dinheiros para a pessoa C. Ou seja, a pessoa 
                                    C recebeu da pessoa D e pagou a pessoa A. Pior ainda, existe um ciclo vicioso, em que a pessoa D emitiu um cheque de 3 dinheiros para a pessoa C, que por sua vez emitiu um cheque de 2 dinheiros para a pessoa B, que por 
                                    sua vez emitiu um cheque de 1 dinheiro para a pessoa D. A situação mostrada no item (a) da Figura abaixo é descrita através de uma lista de cheques, com quatro triplas da forma (X,V,Y), para indicar que X emitiu um cheque de V dinheiros para Y. Na mesma Figura, no item (b), 
                                    a situação é descrita com uma lista de apenas três cheques.
                                </p>
                                <img src="../img/questao.png" width="100%" height="100%">

                                <h5 class=""><strong>Entrada</strong></h5>
                                <p class="card-text text-justify">
                                    A primeira linha contém dois inteiros, M e N, onde M é o número de cheques emitidos e N é o número de habitantes da cidade. Os habitantes são identificados por números inteiros de 1 a N. Cada uma das M linhas seguintes descreve um cheque da lista e contém três inteiros X, V e Y, que indica que X emitiu um cheque de V dinheiros a favor de Y. É possível que haja mais de um cheque de X a Y. Também é possivel que haja cheques de X a Y e de Y a X, mas não de X a X.
                                </p>

                                <h5 class=""><strong>Saída</strong></h5>
                                <p class="card-text text-justify">
                                    Seu programa deve produzir duas linhas na saída. A primeira linha descreve a resposta para a Subtarefa A e deve conter um único caractere. O caractere deve ser S para indicar que é possível diminuir o total dos cheques compensados com uma lista de cheques equivalente, ou N para indicar que não é possível diminuir o total de cheques compensados.
                                    Se o seu programa resolve também a Subtarefa B, a segunda linha descreve a resposta para essa subtarefa e deve conter um número inteiro, o valor mínimo do total de cheques compensados, em uma lista equivalente. Se o seu programa não resolve a Subtarefa B, você pode deixar a linha em branco ou colocar um valor inteiro arbitrário.                                </p>

                                <h5 class=""><strong>Exemplos</strong></h5>

                                <table class="table table-borderless">
                                    <tr>
                                        <td><strong>Entrada</strong></td>
                                        <td><strong>Saída</strong></td>
                                    </tr>
                                    <tr>
                                        <td>44</td>
                                        <td>44</td>
                                    </tr>
                                    <tr>
                                        <td>00</td>
                                        <td>00</td>
                                    </tr>
                                    <tr>
                                        <td>77</td>
                                        <td>77</td>
                                    </tr>
                                </table>

                                <div class="list-group list-group-flush card-body ">
                                    <table class="table">
                                        <strong>Submissão</strong>
                                        <tr>
                                            <td>
                                                <form>
                                                    <div class="dropdown">

                                                        <button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown">
                                                            Selecione a linguagem
                                                        </button>
                                                        <div class="dropdown-menu">
                                                            <a class="dropdown-item" href="#">C</a>
                                                            <a class="dropdown-item" href="#">C++</a>
                                                            <a class="dropdown-item" href="#">Java</a>
                                                            <a class="dropdown-item" href="#">Python 2</a>
                                                            <a class="dropdown-item" href="#">Python 3</a>
                                                            <a class="dropdown-item" href="#"></a>
                                                        </div>
                                                    </div>
                                            </td>
                                            <td>

                                                <div class="form-group">
                                                    <input type="file" class="form-control-file" id="exampleFormControlFile1">
                                                </div>
                                                <button type="submit" class="btn btn-primary btn-block">Submeter</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </table>
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
