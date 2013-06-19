$ ->
  coffee = $(".chart-container").data('coffee')
  meat = $(".chart-container").data('meat')
  drink = $(".chart-container").data('drink')
  soccer = $(".chart-container").data('soccer')

  $(".chart-container").highcharts
    chart:
      type: "column"

    title:
      text: "Food and Drinks"

    yAxis:
      allowDecimals: false
      title:
        text: "Checkins"
      labels:
        format: "{value}x"

    xAxis:
      allowDecimals: false
      labels:
        format: "{value}:00 Uhr"

    series: [
      {
      name: "Coffee"
      data: coffee
      color: '#785200'
      },
      {
        name: "Food"
        data: meat
        color: '#FF4800'
      },
      {
        name: "Drinks"
        data: drink
        color: '#4e56ff'
      },
      {
        name: "Tablesoccer"
        data: soccer
        color: '#000'
      },
    ]
