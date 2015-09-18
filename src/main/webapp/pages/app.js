function addAxesAndLegend (svg, xAxis, yAxis, margin, chartWidth, chartHeight) {
    var legendWidth  = 200,
        legendHeight = 100;
    var data = [];



    // clipping to make sure nothing appears behind legend
    svg.append('clipPath')
        .attr('id', 'axes-clip')
        .append('polygon')
        .attr('points', (-margin.left)                 + ',' + (-margin.top)                 + ' ' +
        (chartWidth - legendWidth - 1) + ',' + (-margin.top)                 + ' ' +
        (chartWidth - legendWidth - 1) + ',' + legendHeight                  + ' ' +
        (chartWidth + margin.right)    + ',' + legendHeight                  + ' ' +
        (chartWidth + margin.right)    + ',' + (chartHeight + margin.bottom) + ' ' +
        (-margin.left)                 + ',' + (chartHeight + margin.bottom));

    var axes = svg.append('g')
        .attr('clip-path', 'url(#axes-clip)');

    axes.append('g')
        .attr('class', 'x axis')
        .attr('transform', 'translate(0,' + chartHeight + ')')
        .call(xAxis);

    axes.append('g')
        .attr('class', 'y axis')
        .call(yAxis)
        .append('text')
        .attr('transform', 'rotate(-90)')
        .attr('y', 6)
        .attr('dy', '.71em')
        .style('text-anchor', 'end')
        .text('Count');

    var legend = svg.append('g')
        .attr('class', 'legend')
        .attr('transform', 'translate(' + (chartWidth - legendWidth) + ', 0)');

    legend.append('rect')
        .attr('class', 'legend-bg')
        .attr('width',  legendWidth)
        .attr('height', legendHeight);

    legend.append('rect')
        .attr('class', 'outer')
        .attr('width',  75)
        .attr('height', 20)
        .attr('x', 10)
        .attr('y', 10);

    legend.append('text')
        .attr('x', 115)
        .attr('y', 25)
        .text('5% - 95%');

    legend.append('rect')
        .attr('class', 'inner')
        .attr('width',  75)
        .attr('height', 20)
        .attr('x', 10)
        .attr('y', 40);

    legend.append('text')
        .attr('x', 115)
        .attr('y', 55)
        .text('25% - 75%');

    legend.append('path')
        .attr('class', 'median-line')
        .attr('d', 'M10,80L85,80');

    legend.append('text')
        .attr('x', 115)
        .attr('y', 85)
        .text('Median');
}


//画图
function drawPaths (svg, data, x, y) {
    var upperOuterArea = d3.svg.area()
//        .interpolate('basis')    //生成插值函数
        .x (function (d) { return x(d.date) || 1; })
        .y0(function (d) { return y(d.count); })
        .y1(function (d) { return y(0); });



    svg.datum(data);  // 设置或获取单独元素的数据，不进行关联

    svg.append('path')
        .attr('class', 'area upper outer')
        .attr('d', upperOuterArea)
        .attr('clip-path', 'url(#rect-clip)');



}

//添加marker
function addMarker (marker, svg, chartHeight, x) {
    var radius = 32,
        xPos = x(marker.date) - radius - 3,
        yPosStart = chartHeight - radius - 3,
        yPosEnd = (marker.type === 'Client' ? 80 : 160) + radius - 3;

    var markerG = svg.append('g')
        .attr('class', 'marker '+marker.type.toLowerCase())
        .attr('transform', 'translate(' + xPos + ', ' + yPosStart + ')')
        .attr('opacity', 0);

    markerG.transition()
        .duration(1000)
        .attr('transform', 'translate(' + xPos + ', ' + yPosEnd + ')')
        .attr('opacity', 1);

    markerG.append('path')
        .attr('d', 'M' + radius + ',' + (chartHeight-yPosStart) + 'L' + radius + ',' + (chartHeight-yPosStart))
        .transition()
        .duration(1000)
        .attr('d', 'M' + radius + ',' + (chartHeight-yPosEnd) + 'L' + radius + ',' + (radius*2));

    markerG.append('circle')
        .attr('class', 'marker-bg')
        .attr('cx', radius)
        .attr('cy', radius)
        .attr('r', radius);

    markerG.append('text')
        .attr('x', radius)
        .attr('y', radius*0.9)
        .text(marker.type);

    markerG.append('text')
        .attr('x', radius)
        .attr('y', radius*1.5)
        .text(marker.version);
}

function startTransitions (svg, chartWidth, chartHeight, rectClip, markers, x) {

    rectClip.transition()
        .duration(1*markers.length)  //曲线图生成的duration
        .attr('width', chartWidth);

    markers.forEach(function (marker, i) {
        setTimeout(function () {
            addMarker(marker, svg, chartHeight, x);
        }, 1000 + 500*i);
    });
}

function makeChart (data, markers) {
    var svgWidth  = 1260,
        svgHeight = 500,
        margin = { top: 20, right: 20, bottom: 40, left: 40 },
        chartWidth  = svgWidth  - margin.left - margin.right,
        chartHeight = svgHeight - margin.top  - margin.bottom;

    var x = d3.time.scale().range([0, chartWidth])
            .domain(d3.extent(data, function (d) { return d.date;  })),
        y = d3.scale.linear().range([chartHeight, 0])
            .domain([0, d3.max(data, function (d) { return d.count; })]);

    var xAxis = d3.svg.axis().scale(x).orient('bottom')
            .innerTickSize(-chartHeight).outerTickSize(0).tickPadding(10),
        yAxis = d3.svg.axis().scale(y).orient('left')
            .innerTickSize(-chartWidth).outerTickSize(0).tickPadding(10);

    var svg = d3.select('body').append('svg')
        .attr('width',  svgWidth)
        .attr('height', svgHeight)
        .append('g')
        .attr('transform', 'translate(' + margin.left + ',' + margin.top + ')');

    // clipping to start chart hidden and slide it in later
    var rectClip = svg.append('clipPath')
        .attr('id', 'rect-clip')
        .append('rect')
        .attr('width', 0)
        .attr('height', chartHeight);

    addAxesAndLegend(svg, xAxis, yAxis, margin, chartWidth, chartHeight);
    drawPaths(svg, data, x, y);
    startTransitions(svg, chartWidth, chartHeight, rectClip, markers, x);
}


function CurentTime() {
    var now = new Date();
    var hh = now.getHours()+5;            //时
    var mm = now.getMinutes();          //分

    if(hh < 10)
        clock += "0";
    var clock = hh + ":";

    if (mm < 10) clock += '0';
    clock += mm;

    return(clock);
}



var parseDate  = d3.time.format('%M:%S').parse;
var data = [];
var markers = [];


d3.json('http://localhost:8080/demo/data', function (error, rawData) {
     data = rawData.map(function (d) {
        return {
            date: parseDate(d.date),
            count: d.count 
        };
    });

    d3.json('http://localhost:8080/demo/data', function (error, markerData) {
         markers = markerData.map(function (marker) {
            return {
                date: parseDate(marker.date),
                type: marker.type,
                version: marker.version
            };
        });

         
         makeChart(data, markers);
       
    });
});


//for(var i = 0; i < 20; i++){
//	var mode = {date:parseDate(CurentTime()),count:Math.round(Math.random()*1000)};
//	console.log(mode.count);
//	data.push(mode);
//}
//makeChart(data, markers);
//setInterval(function () {
//	var mode = {date:parseDate(CurentTime()),count:Math.round(Math.random()*1000)};
//	console.log(mode.count);
//	data.shift();
//	data.push(mode);
//	makeChart(data, markers);
//}, 1000);




