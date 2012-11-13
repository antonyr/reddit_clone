$(document).ready(function() {
  registerEventsForImages();
});

var registerEventsForImages = function() {
    $('a[href*="jpg"], a[href*="png"]').click(function(e) {
      $('#imageModal').modal('show');
      $('div.modal-body').html('<span>Please wait while we load an image for you</span><img src="">');
      $('div.modal-body img').attr('src', $(e.currentTarget).attr('href')).load(function(){
        $('div.modal-body span').remove();
      });
      e.preventDefault();
    });
  };