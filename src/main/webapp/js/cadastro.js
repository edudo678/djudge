/*tab-pane fade in show active
 aluno
 professor*/


/*$(".nav li.active a").click(function () {
        $("#tab-pane fade in show").trigger("reset");
    
});*/

$('a[data-toggle="tab"]').on('click', function (e) {
   $('.form-groupp input[type="text"]').val('');
   $('.form-groupp #turma').val('');
});