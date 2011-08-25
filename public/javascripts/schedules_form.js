$(function () {
  $(".nested-fields input:checkbox").bind("change", function(e){
    if(this.checked){
      $(this).parent("li").nextAll("input:hidden").val("");
    }else{
      $(this).parent("li").nextAll("input:hidden").val("1");
    }
  });
});

