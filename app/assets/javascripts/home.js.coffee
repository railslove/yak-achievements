# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  # Pusher.log = (message) ->
  #   window.console.log message  if window.console and window.console.log

  $list = $('.m-achivement-list')
  pusher = new Pusher("7075132451181dcab88f")
  channel = pusher.subscribe("yak")

  channel.bind "new_achievement", (data) ->
    $item = $list.children().first().clone()
    $item.find(".m-achivement--headline").text(data.headline)
    $item.find(".m-achivement--text").text(data.text)
    # $item.find(".m-achivement--icon").attr('src,', "/assets/#{data.type}.png")
    $list.prepend($item)

  drinks = $(".chart-container").data('drinks')
  console.log drinks
  $(".chart-container").highcharts
    chart:
      type: "column"

    title:
      text: "Lebensmittel"

    yAxis:
      title:
        text: "Anzahl Checkins"

    series: [
      name: "Kaffee"
      data: drinks
    ]
