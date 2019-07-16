<%-- 
    Document   : testeImagem
    Created on : 15/07/2019, 20:22:31
    Author     : eddunic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="form-panel">
            <form action="/djudge/NewServlet" class="form-horizontal style-form">

                <div class="form-group last">
                    <div class="fileupload fileupload-new" data-provides="fileupload">
                        <div class="fileupload-new thumbnail" >
                            <img src="img/default_question.png" alt="Nenhuma imagem foi enviada"/>
                        </div>

                        <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 550px; max-height: 300px;"></div>
                        <div>
                            <span class="btn btn-theme02 btn-file">
                                <span class="fileupload-new"><i class="fa fa-paperclip"></i> Selecione uma imagem</span>
                                <span class="fileupload-exists"><i class="fa fa-undo"></i> Trocar</span>
                                <input type="file" id="imagem" class="default" name="imagem" onchange="previewImage(this, 'modalPreviewImg');" accept="image/png, image/jpg"  multiple/>
                            </span>
                            <a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload">
                                <i class="fas fa-trash-alt"></i> Apagar</a>
                        </div>
                        <small class="form-text text-muted">Envie arquivos de um desses dois tipos (JPG ou PNG).</small>

                    </div>

                </div>
                <button class="btn btn-green waves-effct" name="acao" type="submit" value="Cadastrar">Salvar</button>
            </form>
        </div>

    </body>
</html>
