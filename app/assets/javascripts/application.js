// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.de.js
//= require jquery.minicolors
//= require tipsy

var setJobHeights;

$(document).ready(function() {
  setJobHeights();
});

$(document).on("page:load", function(e) {
  setJobHeights();
});

setJobHeights = function() {
  $(".day").each(function() {
    var jobCount;
    jobCount = $(this).find(".job").length;
    $(this).find(".job").css({
      height: (1 / jobCount) * 100 + "%"
    });
    $(this).hover((function() {
      $(this).find(".job").css({
        height: (1 / (jobCount + 1)) * 100 + "%"
      });
      $(this).find(".new").css({
        height: (1 / (jobCount + 1)) * 100 + "%"
      });
    }), function() {
      $(this).find(".job").css({
        height: (1 / jobCount) * 100 + "%"
      });
    });
  });
};
