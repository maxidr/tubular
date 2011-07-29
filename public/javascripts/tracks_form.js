$(function () {
    'use strict';

    // Initialize the jQuery File Upload widget:
    $('#fileupload').fileupload();

    // Load existing files:
    $.getJSON($('#fileupload form').prop('action'), function (files) {
        var fu = $('#fileupload').data('fileupload');
        fu._adjustMaxNumberOfFiles(-files.length);
        fu._renderDownload(files)
            .appendTo($('#fileupload .files tbody'))
            .fadeIn(function () {
                // Fix for IE7 and lower:
                $(this).show();
            });
    });

    // Open download dialogs via iframes,
    // to prevent aborting current uploads:
    $('#fileupload .files a:not([target^=_blank])').live('click', function (e) {
        e.preventDefault();
        $('<iframe style="display:none;"></iframe>')
            .prop('src', this.href)
            .appendTo('body');
    });
    
        
    // Return a helper with preserved width of cells
    var fixHelper = function(e, ui) {
        ui.children().each(function() {
            $(this).width($(this).width());
        });
        return ui;
    };
 

    $("#sortable").sortable({      
      helper: fixHelper,
      stop: function(event, ui) {
		    // console.log("Move item to: " + ui.item.index());
		    console.log("Order: " + $("#sortable").sortable("toArray"));
		    $.ajax({
		      url: 'sort', 
		      data: { order: $("#sortable").sortable("toArray") },
		      type: 'PUT',
		    });
		    
//		    getJSON("sort", { order: $("#sortable").sortable("toArray") }, function(json){});
		  },
		  axis: 'y',
		  dropOnEmpty: false,      
    }).disableSelection();

});
