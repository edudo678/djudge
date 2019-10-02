<script src="js/jquery/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
<script src="js/bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/header.css">

<nav class="navbar navbar-expand-md navbar-dark fixed-top">
    <div class="container">
        <div class="logo">
            <a class="navbar-brand" href="index.jsp"><img alt="logo Djudge" src="img/djudge_logo.png"></a>
        </div>


        <a class="navbar-toggler btn-dark" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <div class="animated-icon1"><span></span><span></span><span></span><span></span></div>
        </a>
        <form method="get" action="/djudge/PrivadoServlet">
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <button type="submit" name="acao" value="entrar" class="nav-link btn btn-login">Entrar</button>
                    </li>
                    <li class="nav-item">
                        <button type="submit" name="acao" value="cadastrar" class="nav-link btn btn-login">Cadastrar</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
</nav>