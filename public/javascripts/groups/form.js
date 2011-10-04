$(function () {
  $("#group_client_id").bind("change", function(event){
    $.ajax({
      url: "client_structure/" + $(this).val(),
      dataType: "script"
    });
  });

  $("#tree ul").checkboxTree({
    initializeUnchecked: 'collapsed'
  });
});

