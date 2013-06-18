$ ->
  coffee = $(".chart-container").data('coffee')
  meat = $(".chart-container").data('meat')
  veggie = $(".chart-container").data('veggie')
  drink = $(".chart-container").data('drink')

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
        name: "Meat"
        data: meat
        color: '#FF4800'
      },
      {
        name: "Veggie"
        data: veggie
        color: '#6ED500'
      },
      {
        name: "Drinks"
        data: drink
        color: '#4e56ff'
      },
    ]
