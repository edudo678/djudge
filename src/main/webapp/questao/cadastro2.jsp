<%@page import="model.dao.GenericDAO"%>
<%@page import="model.dao.QuestaoDAO"%>
<%@page import="model.bean.Questao"%>
<div class="modal fade" id="modalVisualizarQuestao" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">

    <%
        Questao q = new Questao();
        GenericDAO<Questao> gqDAO = new GenericDAO();

        q = gqDAO.findById(Questao.class, Long.parseLong(request.getParameter("id")));
    %>
    <div class="modal-dialog modal-dialog-centered modal-lg text-black" role="document">
        <div class="modal-content">
            <form action="/djudge/SubmissaoAvaliadorServlet?id=<%=q.getId()%>" enctype="multipart/form-data" method="POST">
                <div class="modal-header">

                    <h5 class="modal-title" id="TituloModalCentralizado">Visualização da questão</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>
                    </button>

                </div>
                <div class="modal-body text-black">

                    <input name="id" id="id" value="<%= q.getId()%>" readonly/> 

                    <div class="form-group col-md-6">
                        <label>Código-fonte gabarito</label>
                        <input type="file" name="source" class="form-control-file" id="source"> 
                    </div>
                    <div class="form-group col-md-6">
                        <select name="compilerId">
                            <option>Selecione a linguagem</option>
                            <option  value="c">C</option>   
                            <option  value="cpp">C++</option>                  
                            <option value="java">Java</option> 
                            <option value="python2">Python 2</option> 
                            <option value="python3">Python 3</option> 
                        </select>                                                
                    </div>

                    <h4 class="card-title text-center" id="modalTitulo"><strong></strong></h4>

                    <p class="card-text text-justify" id="modalEnunciado"></p>

                    <center>
                        <img id="modalPreviewImg" class="mini_foto" src="../img/default_question.png" style="max-width: 300px; max-height: 300px;"/>
                    </center>  

                    <h5 class=""><strong>Entrada</strong></h5>
                    <p class="card-text text-justify" id="modalEntrada"></p>

                    <h5><strong>Saída</strong></h5>
                    <p class="card-text text-justify" id="modalSaida"></p>  

                    <h5><strong>Restrições</strong></h5>
                    <p class="card-text text-justify" id="modalRestricao"></p>  

                    <h5><strong>Exemplos</strong></h5>
                    <p class="card-text text-justify" id="modalExemplo"></p>  
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Editar</button>
                    <button type="submit" class="btn btn-primary">Confirmar cadastro</button>
                </div>
            </form>
        </div>
    </div>
</div>