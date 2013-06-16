$ ->
  Pusher.log = (message) ->
    window.console.log message  if window.console and window.console.log

  $achievements = $('#achievements')
  pusher = new Pusher("7075132451181dcab88f")
  status_channel = pusher.subscribe("status-monitor")
  checkin_channel = pusher.subscribe("yak")

  $list = $('.m-achivement-list')
  checkin_channel.bind "new_achievement", (data) ->
    $item = $list.children().first().clone()
    $item.find(".m-achivement--headline").text(data.headline)
    $item.find(".m-achivement--text").text(data.text)
    # $item.find(".m-achivement--icon").attr('src,', "/assets/#{data.type}.png")
    $list.prepend($item)

  status_channel.bind "checkin", (data) ->
    window.console.log data
    window.location.href = '/status/'+ data.yak_uid


