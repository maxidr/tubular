
$(document).ready(function() { 
  $(".date_string input").datepicker({
      dateFormat: 'dd/mm/yy',
      monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
      dayNamesMin: [ 'Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab' ],
      nextText: 'Siguiente',
      prevText: 'Anterior',
      selectOtherMonths: true,
      changeYear: true,
      changeMonth: true,
      buttonImage: '/images/calendar.png',
      showOn: "button",
			buttonImageOnly: true,
			buttonText: 'Seleccionar fecha'
    });    
});
