render_scoreboard = (data) ->
  $('#scoreboard').replaceWith(JST['scoreboard']({players: data}))

load_json = ->
  console.log('Loading json')
  $.getJSON('/scores.json', render_scoreboard)

jQuery ->
  load_json()
  setInterval(load_json, 3000)