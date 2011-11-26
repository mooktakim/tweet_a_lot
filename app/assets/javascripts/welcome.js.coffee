render_scoreboard = (data) ->
  if(has_changed(data))
    console.log("Data has changed!")
    $('#score_container').html(JST['scoreboard']({players: data}))

load_scores_json = ->
  # console.log('Loading scores json')
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

render_recent_tweets = (data) ->
  tweets = $(data).find('.tweet')
  tweets.each(() ->
    tweet = $(this)
    if($('#' + tweet.data('id')).length == 0)
      # console.log(tweet)
      tweet.css("background", "lightyellow")
      setTimeout(() ->
        $('#' + tweet.data('id')).css("background", 'none')
      , 3000)
      $(".tweets").prepend(tweet)
  )

load_tweets = ->
  # console.log('Loading tweets')
  $.get('/recent_tweets.html', render_recent_tweets)

jQuery ->
  if($('#score_container').length != 0)
    load_scores_json()
    setInterval(load_scores_json, 3000)

  if($('.tweets').length != 0)
    load_tweets()
    setInterval(load_tweets, 3000)