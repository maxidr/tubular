$(document).ready(function() {	
    $.blockUI.defaults.css = {};
    $.blockUI.defaults.message = "Aguarde por favor...";
    
		$('#calendar').fullCalendar({
			editable: true,
			events: '/calendars/events',
      eventClick: function(calEvent, jsEvent, view) {        
        $("#calendar").block();
        // Schedule ID
        $.ajax({
          url: 'schedules/' + calEvent.id,
          dataType: 'script'
        }).complete(function() { $("#calendar").unblock() });
      }
		});
		
});
