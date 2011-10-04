$(function () {
  
  del_players = [];
  
  $("#group_client_id").bind("change", function(event){
    $.ajax({
      url: "client_structure/" + $(this).val(),
      dataType: "script"
    });
  });

  $("#tree ul").checkboxTree({
    initializeUnchecked: 'collapsed',
    onUncheck: { ancestors: 'uncheck' },
    onCheck: { ancestors: 'checkIfFull' }
  });
  
  if( action == "edit" ){    
    $('[name="players[]"]').live("click", function(){
      if( $(this).is(':checked') ){
        check_player($(this).val());
      }else{
        uncheck_player($(this).val());
      }
    });
  }
  
  function check_player(id){
    position = del_players.indexOf(id);
    if( position != -1 ){ del_players.splice(position, 1); }
  }
  
  function uncheck_player(id){
    del_players.push(id);
  }
  
});

