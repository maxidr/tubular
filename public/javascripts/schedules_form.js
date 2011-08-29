$(function () {

  function toggle_times(checkbox){
    var selections = $(checkbox).parents("li").nextAll("li").find("select");
    if( checkbox.checked ){
      selections.removeAttr("disabled");
    }else{
      selections.attr("disabled", "disabled");
    }
  }
  
  function toggle_copy_link(checkbox){
    var copy_link = $(checkbox).parents("fieldset").first().find("ol li a.copy_link");
    copy_link.toggle();
  }
  
  $("a.copy_link").bind("click", function(event){
    event.preventDefault();
    idx = $(this).data("index");
    start_hour = $("#schedule_segments_attributes_" + idx + "_start_time_4i").val();
    start_minutes = $("#schedule_segments_attributes_" + idx + "_start_time_5i").val();
    end_hour = $("#schedule_segments_attributes_" + idx + "_end_time_4i").val();
    end_minutes = $("#schedule_segments_attributes_" + idx + "_end_time_5i").val();
    console.log("start at " + start_hour + ":" + start_minutes + " end at " + end_hour + ":" + end_minutes);
    $.each()
  });

  $("input:checkbox.selection").bind("change", function(e){
    toggle_times(this);
    toggle_copy_link(this);

    if(edit){
      var value = "";
      if(!this.checked){        
        value = "true";
      }
      $(this).parents("li").nextAll("input:hidden").val(value);
    }    
  });
});

