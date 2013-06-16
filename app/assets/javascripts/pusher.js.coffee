$ ->
  Pusher.log = (message) ->
    window.console.log message  if window.console and window.console.log

  $achievements = $('#achievements')
  pusher = new Pusher("7075132451181dcab88f")
  status_channel = pusher.subscribe("status-monitor")

  status_channel.bind "checkin", (data) ->
    window.console.log data
    window.location.href = '/status/'+ data.yak_uid


