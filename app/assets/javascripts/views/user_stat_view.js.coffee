WorkoutWars.UserStatView = Ember.View.extend
  templateName: "highchart"

  modelChanged: (->
    @drawChart()
  ).observes('controller.model')

  didInsertElement: ->
    @drawChart()

  drawChart: ->
    keys = []
    values = []
    @get('context.model.activityStatsTotal').then (stats) =>
      $.each stats, (key, value) ->
        keys.push(key)
        values.push(value)

      @.$().highcharts
        chart:
          type: "column"
          margin: [
            50
            50
            50
            80
          ]
          backgroundColor: "#282828"
          height: 300

        title:
          text: "Total activities logged for #{@get('context.model.handle')}"
          style:
            color: '#2a9fd6'
            fontSize: '16px'

        xAxis:
          categories: keys
          labels:
            rotation: -45
            align: "right"
            style:
              fontSize: "13px"
              fontFamily: "Verdana, sans-serif"

        yAxis:
          min: 0
          title:
            text: "Total (All-Time)"
            style:
              color: '#2a9fd6'
              fontSize: '13px'

        legend:
          enabled: false

        tooltip:
          pointFormat: "Total: <b>{point.y:.1f}</b>"

        series: [
          name: "Exercises"
          data: values
          color: "#77b300"
          dataLabels:
            enabled: true
            color: "#FFFFFF"
            align: "center"
            verticalAlign: "top"
            x: 4
            y: -20
            style:
              fontSize: "13px"
              fontFamily: "Verdana, sans-serif"
              textShadow: "0 0 3px black"
        ]



