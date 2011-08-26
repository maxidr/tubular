$(document).ready(function() {	
		
		$('#calendar').fullCalendar({
			editable: true,
			events: '/calendars/events',
      eventMouseover: function(calEvent, jsEvent, view) {
        $(this).qtip({
          content: {
            text: "<h2>Título</h2> " + calEvent.title + ", Mas info: " + calEvent.information,
            title: { text: "<h2>Detalles de la agenda</h2>", button: true }
          },
          position: {
             my: 'bottom center', // ...at the center of the viewport
             at: 'top center'
          },
          show: {
            event: 'click', // Show it on click...
            solo: true, // ...and hide all other tooltips...            
          },
          hide: false,
        });
      }			
		});
		
});
