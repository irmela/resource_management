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
//= require ../../../vendor/assets/javascripts/bootstrap-select.min.js
//= require recurring_select

var setJobHeights;

$(document).ready(function() {
  setJobHeights();
  $('select').selectpicker({size: 6});
});

$(document).on("page:load", function(e) {
  setJobHeights();
  $('select').selectpicker({size: 6});
});

setJobHeights = function() {
  $(".day").each(function() {
    var jobCount;
    jobCount = $(this).find(".job").length;

    // If there is a job tagged with all-day set height to 100%
    if($(this).find(".all-day").length) {
      $(this).find('.all-day').eq(0).css({height: '100%', borderTop: 'none'});
      if($(this).find(".all-day").length) {
        $(this).find('.all-day').eq(0).css({height: '100%', borderTop: 'none'});
        $(this).hover((function() {
          $(this).find('.all-day').eq(0).css({height: '50%'});
          $(this).find(".new").css({height: '50%'});
        }), function() {
          $(this).find('.all-day').eq(0).css({height: '100%'});
        });
      }
    }
    // set job height to (1 / jobCount) * 100 + "%"
    else {
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
    }
  });
};
