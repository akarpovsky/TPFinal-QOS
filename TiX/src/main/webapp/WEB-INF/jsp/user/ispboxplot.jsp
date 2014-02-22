<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ISP Boxplot</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/highcharts-more.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
</head>
<body>
<div id="container" style="height: 400px; margin: auto; min-width: 310px; max-width: 600px"></div>

<script>
var chart = new Highcharts.Chart({

    chart: {
        renderTo: 'container',
        type: 'boxplot'
    },

    title: {
        text: 'Highcharts box plot'
    },

    xAxis: {
        minTickInterval: 1,
        categories: ['congestion subida', 'congestion bajada', 'utilizacion subida', 'utilizacion bajada'],
        title: {
            text: 'Fibertel'
        }
    },

    series: [{
        name: 'Box plot',
        data: [
            [0, 1, 2.5, 3, 6],
            [1, 2, 3, 4, 5],
            [1, 2, 3, 4, 5],
            [1, 2, 3, 4, 5]
        ]
    }]

});
</script>
</body>
</html>
