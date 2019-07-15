<!DOCTYPE html>
<html lang = "pt-br">
    <head>
        <meta charset = "utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Djudge - Corretor de Questões</title>

        <link rel="stylesheet" href="css/fontawesome-all.css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

        <script src="js/jquery/jquery-3.4.1.min.js"></script>
    </head>

    <body class="background">

        <jsp:include page="header.jsp"/>

        <div class="row justify-content-center" style="margin-top: 10%; margin-bottom: 5%">
            <div class="col-md-4 card text-black">
                <form action="/djudge/PrivadoServlet" method="POST"><br>
                    <div class="row form-group">
                        <div class="col-md-6">
                            <label for="nome">Nome</label>
                            <input type="nome" class="form-control" name="nome" placeholder="Primeiro nome" autocomplete="off">

                        </div>
                        <div class="col-md-6">
                            <label for="sobrenome">Sobrenome</label>
                            <input type="sobrenome" class="form-control" name="sobrenome" placeholder="Último nome" autocomplete="off">
                        </div>
                    </div>

                    <center>

                        <ul class="nav nav-tabs nav-justified" role="tablist">
                            <li class="nav-item active">
                                <a href="#aluno" class="nav-link active" data-toggle="tab" role="tab">
                                    Aluno
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#avaliador" class="nav-link" data-toggle="tab" role="tab">
                                    Avaliador   
                                </a>
                            </li>
                        </ul>

                    </center>

                    <br>

                    <div class="tab-content">
                        <div class="tab-pane fade in show active" id="aluno" role="tabpanel">
                            <div class="row">
                                <div class="form-groupp col-md-6">
                                    <label for="senha">Matrícula</label>
                                    <input type="text" class="form-control" name="matricula" placeholder="Insira sua matrícula" autocomplete="off">
                                </div>

                                <div class="form-groupp col-md-6">
                                    <label for="turma">Turma</label>
                                    <select class="form-control" id="turma" name="turma">
                                        <option></option>
                                        <option value="IINF11A">IINF11A</option>
                                        <option value="IINF11B">IINF11B</option>
                                        <option value="IINF21A">IINF21A</option>
                                        <option value="IINF21B">IINF21B</option>
                                        <option value="IINF31A">IINF31A</option>
                                        <option value="IINF31B">IINF31B</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="avaliador" role="tabpanel">
                            <div class="form-groupp">
                                <label for="siape">SIAPE</label>
                                <input type="text" class="form-control" name="siape" placeholder="Insira sua matrícula SIAPE" autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="email">E-mail</label>
                        <input type="email" class="form-control" name="email" placeholder="Insira seu e-mail" autocomplete="off">
                        <small id="emailHelp" class="form-text text-muted">Nós nunca vamos compartilhar seu e-mail com ninguém.</small>
                    </div>

                    <div class="form-group">
                        <label for="senha">Senha</label>
                        <input type="password" class="form-control" name="senha" placeholder="Senha">
                    </div>

                    <div class="form-group">
                        <label for="confirmSenha">Confirmar senha</label>
                        <input type="password" class="form-control" name="confirmSenha" placeholder="Confirme sua senha">
                    </div>

                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="checkbox">
                        <label class="form-check-label" for="checkbox">Li e concordo com os termos de uso</label>
                    </div>

                    <br><button type="submit" name="acao" value="cadastrar" class="btn-lg btn-block bg-black text-light">Cadastrar-se</button><br>
                </form>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>
        <script src="js/cadastro.js"></script>
    </body>
</html>