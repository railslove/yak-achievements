$ ->
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
