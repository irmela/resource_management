# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#jQuery ->
  #$('#ressource_color').minicolors({theme: 'bootstrap'});
$(document).on "page:load", (e) ->
	$('#ressource_color').minicolors({theme: 'bootstrap'});
	return
$(document).ready ->
	$('#ressource_color').minicolors({theme: 'bootstrap'});
	return
