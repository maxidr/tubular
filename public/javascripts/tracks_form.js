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

    $('.preview_button').button({
        icons: {primary: 'ui-icon-play'}
    });

    function generate_playlist(){
      var playlist = new Array();
      $(".name a").each(function(){
        playlist.push(this.href);
      });
      return playlist;
    }

    $('.preview_button').click(function(e){
      e.preventDefault();
      $("#preview").dialog({
        modal: true,
        height: 400,
        width: 600,
        open: function(event, ui){
          flowplayer("preview", "/flowplayer-3.2.7.swf", {
            clip:  {
              autoPlay: true,
              autoBuffering: true,
              controls: { playlist: true }
            },
            playlist: generate_playlist(),
          });
        }
      });
    });

    $(".name > a").live("click", function(event){
      var uri = this.href;

      $("#preview").dialog({
        modal: true,
        height: 400,
        width: 600,
        open: function(event, ui){
          flowplayer("preview", "/flowplayer-3.2.7.swf", {
            clip:  {
              autoPlay: true,
              autoBuffering: true,
            },
            playlist: [ uri ],
          });
        },
      });
      event.preventDefault();
      return false;
    });
});

