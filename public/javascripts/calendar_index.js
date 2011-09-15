$(document).ready(function() {	
    
		$('#calendar').fullCalendar({
			editable: true,
			events: '/calendars/events',
      eventClick: function(calEvent, jsEvent, view) {
        // Schedule ID        
        $.getJSON('schedules/' + calEvent.id, function(data){
          $("#event_information").empty();
          $.tmpl($("#template-event"), data).appendTo("#event_information");        
          $("#event_information").dialog();
        });
      }
		});
		
});
