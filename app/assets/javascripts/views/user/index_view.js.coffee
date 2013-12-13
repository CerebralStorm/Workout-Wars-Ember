WorkoutWars.UserIndexView = Ember.View.extend

  didInsertElement: ->
    $("#chartContainer").highcharts
      chart:
        type: "area"

      title:
        text: "Pushup Trends"

      xAxis:
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

      yAxis:
        title:
          text: "Reps per month"

        labels:
          formatter: ->
            @value

      tooltip:
        pointFormat: "{series.name} completed <b>{point.y:,.0f}</b><br/>pushups in {point.x}"

      plotOptions:
        area:
          marker:
            enabled: false
            symbol: "circle"
            radius: 2
            states:
              hover:
                enabled: true

      series: [
        name: "John Smith"
        data: [50, 65, 70, 85, 105, 135, 140, 145, 150, 145, 155, 155]
      ,
        name: "Top 10 Percent"
        data: [230, 260, 280, 250, 240, 230, 250, 260, 280, 290, 305, 285]
      ]