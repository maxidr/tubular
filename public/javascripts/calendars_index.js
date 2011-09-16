$(document).ready(function() {	
    
		$('#calendar').fullCalendar({
			editable: true,
			events: '/calendars/events',
      eventClick: function(calEvent, jsEvent, view) {
        // Schedule ID        
        $.ajax({
          url: 'schedules/' + calEvent.id,
          dataType: 'script'
        });
      }
		});
		
});
