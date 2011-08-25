$(function () {
  $(".nested-fields input:checkbox").bind("change", function(e){
    if(edit){
      var value = "";
      if(!this.checked){        
        value = "true";
      }
      $(this).parent("li").nextAll("input:hidden").val(value);
    }
  });
});

