<nav class="navbar navbar-expand-lg navbar-light bg-black ">
    <div class="container">
        <a class="navbar-brand" href="/djudge/"><img alt="logo Djudge" src="../../img/djudge_logo.png"></a>
        <button class="navbar-toggler bg-white" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
            </ul>
            <form method="get" action="/djudge/PrivadoServlet">
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a href="meus_dados.jsp" class="nav-link btn btn-login"><i class="fas fa-user-edit fa-lg"></i> Editar perfil</a>
                        </li>
                        <li class="nav-item">
                            <button type="submit" name="acao" value="sair" class="nav-link btn btn-login"><i class="fas fa-sign-out-alt fa-lg"></i> Sair</button>
                        </li>
                    </ul>
                </div>            
            </form>
        </div>
    </div>
</nav>