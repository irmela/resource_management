// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  positionTooltips();
});

$(document).on("page:load", function(e) {
  positionTooltips();
});

$(window).resize(function() {
  positionTooltips();
});

positionTooltips = function(){
  $('.job ~ .tooltip').each(function(){
    // get Position of corresponding job and day div
    jobPosition = $(this).prev().position();
    dayPosition = $(this).closest('.day').position();
    // define x and y position
    toolTipX = jobPosition.left - $(this).width()/2 + 10
    toolTipY = dayPosition.top - 30
    // set left and right position
    $(this).css({'left': toolTipX, 'top': toolTipY});
  })
  // toggle display class on hover
  $(".job").hover(
    function() {
      $(this).next().addClass( "display-tooltip" );
    }, function() {
      $(this).next().removeClass( "display-tooltip" );
    }
  );
}
