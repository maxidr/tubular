$(function () {

  function toggle_times(checkbox){
    var selections = $(checkbox).parents("li").nextAll("li").find("select");
    if( checkbox.checked ){
      selections.removeAttr("disabled");
    }else{
      selections.attr("disabled", "disabled");
    }
  }

  $("input:checkbox.selection").bind("change", function(e){
    toggle_times(this);

    if(edit){
      var value = "";
      if(!this.checked){        
        value = "true";
      }
      $(this).parents("li").nextAll("input:hidden").val(value);
    }
  });
});

