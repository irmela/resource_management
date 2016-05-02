$(document).on("page:load", function(e) {
  $('#resource_color').minicolors({
    theme: 'bootstrap'
  });
});

$(document).ready(function() {
  $('#resource_color').minicolors({
    theme: 'bootstrap'
  });
  $(document).on('scroll', function(e) {
    // // create fixed header
    if($(document).scrollTop() > 108) {
      $('#calendar table').floatThead({"top":"50px", "autoReflow":true});
    } else {
      $('#calendar table').floatThead("destroy");
    }
  });
});
