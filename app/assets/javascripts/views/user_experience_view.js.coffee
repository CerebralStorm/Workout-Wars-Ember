WorkoutWars.UserExperienceView = Ember.View.extend
  templateName: "highchart"

  modelChanged: (->
    @drawChart()
  ).observes('controller.model')

  didInsertElement: ->
    @drawChart()

  drawChart: ->
    keys = []
    values = []
    $.each @get('context.model.activityExperienceTotal'), (key, value) ->
      keys.push(key)
      values.push(value)

    @.$().highcharts
      chart:
        type: "column"
        margin: [
          50
          50
          100
          80
        ]

      title:
        text: "Experience Distribution"

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
          text: "Experience (All-Time)"

      legend:
        enabled: false

      tooltip:
        pointFormat: "Experience Total: <b>{point.y:.1f}</b>"

      series: [
        name: "Exercises"
        data: values
        dataLabels:
          enabled: true
          rotation: -90
          color: "#FFFFFF"
          align: "right"
          x: 4
          y: 10
          style:
            fontSize: "13px"
            fontFamily: "Verdana, sans-serif"
            textShadow: "0 0 3px black"
      ]



