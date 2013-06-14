# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  Pusher.log = (message) ->
    window.console.log message  if window.console and window.console.log

  $list = $('.m-achivement-list')
  pusher = new Pusher("7075132451181dcab88f")
  channel = pusher.subscribe("yak")

  channel.bind "new_checkin", (data) ->
    $item = $list.children().first().clone()
    $item.find(".m-achivement--headline").text(data.message)
    $list.prepend($item)
