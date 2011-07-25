$(document).ready(function() {
  $("form.content").submit(function(event){
    $("#order").val( $("#sortable").sortable("toArray") );
  });
});
