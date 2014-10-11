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
