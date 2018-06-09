# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
update_weight = ->
  url = '/serial_weight/get_weight.json'
  $.getJSON url, (data) ->
    weight = data
    $("#weight").html("<b>#{weight}</b>")
    if weight == 99999
      $("#status").html("Error leyendo el puerto serial").css('color', 'red')
    else
      $("#status").html("Ok").css('color', 'green')


$ ->
	setInterval(update_weight, 1000)