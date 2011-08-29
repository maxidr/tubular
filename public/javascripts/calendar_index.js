$(document).ready(function() {	

    function details(info){
      return "<h3>" + info.title + "</h3>" +
      "<ul>" + $.map(info.segments, render_segment).join("") + "</ul>" + 
      "<a href='/schedules/" + info.id + "/edit'>Editar</a>" + " | " +
      "<a href='/schedules/" + info.id + "'>Mas detalles...</a>";
    }
    
    function render_segment(s){
      return "<li>" + s.wday + " de " + s.start + " a " + s.end + "</li>";
    }
    
		$('#calendar').fullCalendar({
			editable: true,
			events: '/calendars/events',
      eventClick: function(calEvent, jsEvent, view) {        
        $(this).qtip({
          content: {
            text: details(calEvent),
            title: { text: "Información de la agenda", button: true }
          },
          position: {
             my: 'bottom center', // ...at the center of the viewport
             at: 'top center'
          },
          show: {
            solo: true,
            ready: true
          },
          hide: false,
        });
      }
		});
		
});
