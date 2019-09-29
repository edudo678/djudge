<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Djudge - Corretor de Questões</title>
        <link rel="stylesheet" href="css/fontawesome-all.css">
        <script src="js/jquery/jquery-3.4.1.min.js"></script>
        <script src="js/index.js"></script>
        <link rel="stylesheet" href="css/index.css" type="text/css">
        <link href="img/djudge_favicon.png" rel="icon" type="image/x-icon">
    </head>
    <body>

        <jsp:include page="header.jsp"/>

        <div class="container-fluid">

            <div class="d-flex my-auto justify-content-center">

                <h1 style="font-family: 'courier';">Djudge: Juiz Online</h1>

            </div>
            <div class="submeter">
                <p class="text"><b>A Ferramenta da Maratona de Programação do IFAM</b></p>

                <!--            <a href="" class="btn btn-primary"><i class="fas fa-file-alt fa"></i>Saiba mais</a>
                            <small>ou</small>-->
                <a href="questao/listar.jsp" class="btn btn-outline-light"><i class="fas fa-file-code fa"></i>Submeta seu código-fonte</a>
            </div>


            <div class="fixed-background">

                <div class="row dark text-center">

                    <div class="col-12">
                        <h3 class="heading">Critérios de avaliação</h3>
                        <div class="heading-underline"></div>
                    </div>

                    <div class="col-md-4">
                        <h3>Código-gabarito</h3>
                        <div class="feature">
                            <i class="fab fa-creative-commons-share fa-3x"></i>
                        </div>
                        <p class="lead">Saídas equivalentes às do código-gabarito</p>
                    </div>

                    <div class="col-md-4">
                        <h3>Estrutura</h3>
                        <div class="feature">
                            <i class="fas fa-code fa-3x"></i>
                        </div>
                        <p class="lead">Lógica e sintaxe são avaliadas pelo professor</p>
                    </div>

                    <div class="col-md-4">
                        <h3>Tempo de Execução</h3>
                        <div class="feature">
                            <i class="fas fa-clock fa-3x"></i>
                        </div>
                        <p class="lead">Menor tempo de execução do arquivo</p>
                    </div>

                </div>

            </div>
            
            <script>

                function typeWrite(el) {

                    const textoArray = el.innerHTML.split('');
                    el.innerHTML = '';
                    textoArray.forEach((letra, i) => {
                        setTimeout(function () {

                            el.innerHTML += letra;

                        }, 75 * i);
                    });
                }

                const titulo = document.querySelector('h1');
                typeWrite(titulo);

            </script>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>