# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
(->
  
  ###
  draw the fancy line chart
  
  @param {String} elementId elementId
  @param {Array}  data      data
  ###
  
  
  ###
  draw the fancy pie chart
  
  @param {String} elementId elementId
  @param {Array}  data      data
  ###
  drawPieChart = (elementId, data) ->
    
    # TODO code duplication check how you can avoid that
    drawChartCenter = ->
      centerContainer = pie.append("g").attr("class", "pieChart--center")
      centerContainer.append("circle").attr("class", "pieChart--center--outerCircle").attr("r", 0).attr("filter", "url(#pieChartDropShadow)").transition().duration(DURATION).delay(DELAY).attr "r", radius - 60
      centerContainer.append("circle").attr("id", "pieChart-clippy").attr("class", "pieChart--center--innerCircle").attr("r", 0).transition().delay(DELAY).duration(DURATION).attr("r", radius - 55).attr "fill", "#fff"
      return
    drawDetailedInformation = (data, element) ->
      bBox = element.getBBox()
      infoWidth = width * 0.3
      if (bBox.x + bBox.width / 2) > 0
        infoContainer = detailedInfo.append("g").attr("width", infoWidth).attr("transform", "translate(" + (width - infoWidth) + "," + (bBox.height + bBox.y) + ")")
        anchor = "end"
        position = "right"
      else
        infoContainer = detailedInfo.append("g").attr("width", infoWidth).attr("transform", "translate(" + 0 + "," + (bBox.height + bBox.y) + ")")
        anchor = "start"
        position = "left"
      infoContainer.data([data.value]).append("text").text("0 %").attr("class", "pieChart--detail--percentage").attr("x", ((if position is "left" then 0 else infoWidth))).attr("y", -10).attr("text-anchor", anchor).transition().duration(DURATION).tween "text", (d) ->
        i = d3.interpolateRound(+@textContent.replace(/\s%/g, ""), d)
        (t) ->
          @textContent = i(t)
          return

      infoContainer.append("line").attr("class", "pieChart--detail--divider").attr("x1", 0).attr("x2", 0).attr("y1", 0).attr("y2", 0).transition().duration(DURATION).attr "x2", infoWidth
      infoContainer.data([data.description]).append("foreignObject").attr("width", infoWidth).attr("height", 150).append("xhtml:body").attr("class", "pieChart--detail--textContainer " + "pieChart--detail__" + position).html data.description
      return
    containerEl = document.getElementById(elementId)
    width = containerEl.clientWidth
    height = width * 0.4
    radius = Math.min(width, height) / 2
    container = d3.select(containerEl)
    svg = container.select("svg").attr("width", width).attr("height", height)
    pie = svg.append("g").attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")
    detailedInfo = svg.append("g").attr("class", "pieChart--detailedInformation")
    twoPi = 2 * Math.PI
    pieData = d3.layout.pie().value((d) ->
      d.value
    )
    arc = d3.svg.arc().outerRadius(radius - 20).innerRadius(0)
    pieChartPieces = pie.datum(data).selectAll("path").data(pieData).enter().append("path").attr("class", (d) ->
      "pieChart__" + d.data.color
    ).attr("filter", "url(#pieChartInsetShadow)").attr("d", arc).each(->
      @_current =
        startAngle: 0
        endAngle: 0

      return
    ).transition().duration(DURATION).attrTween("d", (d) ->
      interpolate = d3.interpolate(@_current, d)
      @_current = interpolate(0)
      (t) ->
        arc interpolate(t)
    ).each("end", handleAnimationEnd = (d) ->
      drawDetailedInformation d.data, this
      return
    )
    drawChartCenter()
    return
  ready2 = ->
  	d3.json murl, (error, json) ->
		  data = 
		  	pieChart: [
		    	{
			      color: "red"
			      description: "Total Likes Received By User"
			      title: "Likes"
			      value: json.total
		    	}
		    	{
			      color: "blue"
			      description: "Total Posts By User"
			      title: "Posts"
			      value: json.post_total
		    	}
		  	]
		  drawPieChart "pieChart", data.pieChart
	  	return
    return

  murl = document.URL + "/values_for_js.json"
  DURATION = 1500
  DELAY = 500

  
  # yeah, let's kick things off!!!
  $(document).ready ready2
  $(document).on "page:load", ready2
  return
)()