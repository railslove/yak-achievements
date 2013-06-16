$ ->
  coffee = $(".chart-container").data('coffee')
  meat = $(".chart-container").data('meat')
  veggie = $(".chart-container").data('veggie')

  $(".chart-container").highcharts
    chart:
      type: "column"

    title:
      text: "Food and Drinks"

    yAxis:
      title:
        text: "Anzahl Checkins"

    series: [
      {
      name: "Coffee"
      data: coffee
      },
      {
        name: "Meat"
        data: meat
      },
      {
        name: "Veggie"
        data: veggie
      },
    ]
