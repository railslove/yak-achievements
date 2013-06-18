$ ->
  Pusher.log = (message) ->
    window.console.log message  if window.console and window.console.log

  $achievements = $('#achievements')
  pusher = new Pusher("7075132451181dcab88f")
  status_channel = pusher.subscribe("status-monitor")
  checkin_channel = pusher.subscribe("yak")

  $list = $('.m-achievement-list')
  checkin_channel.bind "new_achievement", (data) ->
    $item = $list.children().first().clone()
    console.log $item.length
    $item.find(".m-achievement--title").text(data.yak)
    $item.find(".m-achievement--text").text(data.title)
    $item.find(".m-achievement--icon").attr('class', "m-achievement--icon icon-#{data.short}")
    $list.prepend($item)

  status_channel.bind "checkin", (data) ->
    window.console.log data
    window.location.href = '/status/'+ data.yak_uid


