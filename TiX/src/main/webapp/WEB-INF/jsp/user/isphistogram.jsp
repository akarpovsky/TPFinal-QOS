<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Histograms</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript" src="http://code.highcharts.com/highcharts.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">


</head>
<body>

    <h1>Fibertel</h1>
    <div>
        <!-- Congestion -->
        <div class="row-fluid">
            <div id="congestionup" class="pull-left" style="height: 400px; width: 620px"></div>
            <div id="congestiondown" class="pull-right" style="height: 400px; width: 620px"></div>
        </div>

        <!-- Utilizacion -->
        <div class="row-fluid">
            <div id="utilizacionup" class="pull-left" style="height: 400px; width: 620px"></div>
            <div id="utilizaciondown" class="pull-right" style="height: 400px; width: 620px"></div>
        </div>
    </div>





<script type="text/javascript">
var chart = new Highcharts.Chart({

    chart: {
        renderTo: 'congestionup',
        type: 'column'
    },
    title: {
        text: 'Histograma congestion subida',
        x: -20 //center
    },

    xAxis: {
        categories: ['0-10', '10-20', '20-30', '30-40', '40-50', '50-60', '60-70', '70-80', '80-90', '90-100']
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

var chart = new Highcharts.Chart({

    chart: {
        renderTo: 'congestiondown',
        type: 'column'
    },
    title: {
        text: 'Histograma congestion bajada',
        x: -20 //center
    },

    xAxis: {
        categories: ['0-10', '10-20', '20-30', '30-40', '40-50', '50-60', '60-70', '70-80', '80-90', '90-100']
    },

    plotOptions: {
        column: {
            groupPadding: 0,
            pointPadding: 0,
            borderWidth: 0
        }
    },

    series: [{
        data: [${congestionDownChart[0]}, ${congestionDownChart[1]}, ${congestionDownChart[2]}, ${congestionDownChart[3]}, ${congestionDownChart[4]}, ${congestionDownChart[5]}, ${congestionDownChart[6]}, ${congestionDownChart[7]}, ${congestionDownChart[8]}, ${congestionDownChart[9]}]
    }]

});

var chart = new Highcharts.Chart({

    chart: {
        renderTo: 'utilizacionup',
        type: 'column'
    },
    title: {
        text: 'Histograma utilización subida',
        x: -20 //center
    },

    xAxis: {
        categories: ['0-10', '10-20', '20-30', '30-40', '40-50', '50-60', '60-70', '70-80', '80-90', '90-100']
    },

    plotOptions: {
        column: {
            groupPadding: 0,
            pointPadding: 0,
            borderWidth: 0
        }
    },

    series: [{
        data: [${utilizacionUpChart[0]}, ${utilizacionUpChart[1]}, ${utilizacionUpChart[2]}, ${utilizacionUpChart[3]}, ${utilizacionUpChart[4]}, ${utilizacionUpChart[5]}, ${utilizacionUpChart[6]}, ${utilizacionUpChart[7]}, ${utilizacionUpChart[8]}, ${utilizacionUpChart[9]}]
    }]

});

var chart = new Highcharts.Chart({

    chart: {
        renderTo: 'utilizaciondown',
        type: 'column'
    },
    title: {
        text: 'Histograma utilización bajada',
        x: -20 //center
    },

    xAxis: {
        categories: ['0-10', '10-20', '20-30', '30-40', '40-50', '50-60', '60-70', '70-80', '80-90', '90-100']
    },

    plotOptions: {
        column: {
            groupPadding: 0,
            pointPadding: 0,
            borderWidth: 0
        }
    },

    series: [{
        data: [${utilizacionDownChart[0]}, ${utilizacionDownChart[1]}, ${utilizacionDownChart[2]}, ${utilizacionDownChart[3]}, ${utilizacionDownChart[4]}, ${utilizacionDownChart[5]}, ${utilizacionDownChart[6]}, ${utilizacionDownChart[7]}, ${utilizacionDownChart[8]}, ${utilizacionDownChart[9]}]
    }]

});
</script>
</body>
</html>
