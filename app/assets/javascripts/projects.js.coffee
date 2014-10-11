# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# With Bootstrap theme (Bootstrap-3 is supported):
$(document).on "page:load", (e) ->
	$('#project_color').minicolors({theme: 'bootstrap'});
	return
$(document).ready ->
	$('#project_color').minicolors({theme: 'bootstrap'});
	return