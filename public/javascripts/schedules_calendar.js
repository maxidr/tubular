$(document).ready(function() {
  $('#calendar').fullCalendar({
			editable: true,
			events: '/schedules/' + schedule_id + '/calendar'
  });
});
