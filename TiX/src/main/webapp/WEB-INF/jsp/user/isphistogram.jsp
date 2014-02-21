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

<!-- xaxis       categories: ['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']-->
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
        // categories: ['${congestionUpChart[0]}', '${congestionUpChart[1]}', '${congestionUpChart[2]}', '${congestionUpChart[3]}', '${congestionUpChart[4]}', '${congestionUpChart[5]}', '${congestionUpChart[6]}', '${congestionUpChart[7]}', '${congestionUpChart[8]}', '${congestionUpChart[9]}']
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
        data: [${congestionUpChart[0]}, ${congestionUpChart[1]}, ${congestionUpChart[2]}, ${congestionUpChart[3]}, ${congestionUpChart[4]}, ${congestionUpChart[5]}, ${congestionUpChart[6]}, ${congestionUpChart[7]}, ${congestionUpChart[8]}, ${congestionUpChart[9]}]
    }]

});
</script>
</body>
</html>
