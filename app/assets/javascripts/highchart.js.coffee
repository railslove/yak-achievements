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
      title:
        text: "Checkins"
    xAxis:
      labels:
          format: '{value}Uhr'

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
