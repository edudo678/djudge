document.getElementById('imprimir').onclick = function () {
    var conteudo = document.getElementById('oculto').innerHTML,
            tela_impressao = window.open('about:blank');

    tela_impressao.document.write(conteudo);
    tela_impressao.window.print();
    tela_impressao.window.close();
};