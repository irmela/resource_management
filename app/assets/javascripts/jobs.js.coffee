# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "focus", "[data-provide~='datepicker']", (e) ->
 - $(this).datepicker({
 	language: "de"
 	format: "yyyy-mm-dd"
	weekStart: 1
	autoclose: true
	daysOfWeekDisabled: "0,6"
 })

$(document).ready ->
  $(".day").each ->
    
    # set height of job depending on number of jobs
    jobCount = $(this).find(".job").length
    $(this).find(".job").css height: (1 / jobCount) * 100 + "%"
    $(this).hover (->
      
      # making room for new-link
      $(this).find(".job").css height: (1 / (jobCount + 1)) * 100 + "%"
      $(this).find(".new").css height: (1 / (jobCount + 1)) * 100 + "%"
      return
    ), ->
      $(this).find(".job").css height: (1 / (jobCount)) * 100 + "%"
      return

    return

  return
