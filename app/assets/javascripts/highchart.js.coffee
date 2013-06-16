$ ->
  coffee = $(".chart-container").data('coffee')
  coffee = $(".chart-container").data('coffee')
  coffee = $(".chart-container").data('coffee')

  $(".chart-container").highcharts
    chart:
      type: "column"

    title:
      text: "Food and Drinks"

    yAxis:
      title:
        text: "Anzahl Checkins"

    series: [{
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
