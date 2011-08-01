$(function () {
    'use strict';
    
    $.widget('blueimpUIX.fileupload', $.blueimpUI.fileupload, {
      _renderDownload: function (files) {
          var tmpl = $.blueimpUI.fileupload.prototype._renderDownload.apply(this, arguments);
          tmpl.find('.edit button').button({
                text: false,
                icons: {primary: 'ui-icon-pencil'}
            });
          return tmpl;
      },
      
//      _initEventHandlers: function () {      
//        $.blueimpUI.fileupload.prototype._initEventHandlers.call(this);
//        var filesList = this.element.find('.files'),
//            eventData = {fileupload: this};
//        filesList.find('.edit button')
//            .live(
//                'click.' + this.options.namespace,
//                eventData,
//                this._editHandler
//            );
//      },
//      
//     
//      _renderEdit: function( item_id ) {
//        var that = this;
//        return $.tmpl(            
//            $("#template-edit"),
//            $.map(files, function (item_id) {
//                return that._editTemplateHelper(item_id);
//            })
//        );
//      },
//      
//      _editTemplateHelper: function( item_id ){},
//      
//      
//      _editHandler: function(e) { 
//        e.preventDefault();
//        var button = $(this);
//        tmpl = $.blueimpUI.fileupload.prototype._initEventHandlers.call("_renderEdit", 1)
//        tmpl.appendTo($('#fileupload .files tbody'));
//         
//      },
      
    });
    

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
//		    console.log("Order: " + $("#sortable").sortable("toArray"));
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
   
    $(".edit button").live('click', function(e){
      var url = $(this).data('url');
      $.ajax({
        url: url,
        dataType: 'script',
      });
    });
});
