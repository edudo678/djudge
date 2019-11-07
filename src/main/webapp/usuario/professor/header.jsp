<nav class="navbar navbar-expand-lg navbar-light bg-black ">
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
                        <a href="meus_dados.jsp" class="nav-link btn btn-login"><i class="fas fa-user fa-lg"></i> Meus dados</a>
                    </li>
                    <li class="nav-item">
                        <a  class="nav-link btn btn-login" data-toggle="modal" data-target="#sair"><i class="fas fa-sign-out-alt fa-lg"></i> Sair</a>
                    </li>
                </ul>
            </div>  
            
            <div class="modal fade" id="sair" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content text-black">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Sair</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Você deseja realmente finalizar a sessão?
                        </div>
                        <div class="modal-footer">
                            <button  class="btn btn-danger" type="submit" name="acao" value="sair"><i class="fas fa-sign-out-alt fa-lg"></i> Sim, sair</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal"><i class="fas fa-window-close fa-lg"></i> Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</nav>