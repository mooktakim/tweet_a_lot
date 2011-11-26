render_scoreboard = (data) ->
  if(has_changed(data))
    console.log("Data has changed!")
    $('#score_container').html(JST['scoreboard']({players: data}))

load_json = ->
  console.log('Loading json')
  $.getJSON('/scores.json', render_scoreboard)

has_changed = (data) ->
  old_hash = $('#score_container').data('scores')
  new_hash = hex_md5(JSON.stringify(data))
  # console.log("Old hash:")
  # console.log(old_hash)
  # console.log("New hash:")
  # console.log(new_hash)
  $('#score_container').data('scores', new_hash)
  old_hash != new_hash

jQuery ->
  if($('#score_container').length != 0)
    load_json()
    setInterval(load_json, 3000)