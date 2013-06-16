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

  $(".chart-container").highcharts
    chart:
      type: "column"

    title:
      text: "Lebensmittel"

    xAxis:
      categories: ["09:00Uhr", "10:00Uhr", "11:00Uhr"]

    yAxis:
      title:
        text: "Anzahl Checkins"

    series: [
      name: "Kaffee"
      data: [10, 12, 14, 18, 21]
    ,
      name: "vegetarisch"
      data: [0, 0, 0, 5, 10]
    ,
      name: "Fleisch"
      data: [0, 0, 2, 12, 25]
    ]
