<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Histograms</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript" src="http://code.highcharts.com/highcharts.js"></script>


</head>
<body>

    <h1></h1>
    <div id="container" style="height: 400px; width: 800px"></div>

<script type="text/javascript">
var chart = new Highcharts.Chart({

    chart: {
        renderTo: 'container',
        type: 'column'
    },
    title: {
        text: 'Histigrama congestion subida',
        x: -20 //center
    },

    xAxis: {
        categories: ['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
    },

    plotOptions: {
        column: {
            groupPadding: 0,
            pointPadding: 0,
            borderWidth: 0
        }
    },

    series: [{
        data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1]
    }]

});
</script>
</body>
</html>
