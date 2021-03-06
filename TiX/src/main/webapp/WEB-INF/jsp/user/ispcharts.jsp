<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>

<title>Histograms</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript" src="http://code.highcharts.com/highcharts.js"></script>
<!-- required for boxplots -->
<script src="http://code.highcharts.com/highcharts-more.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

</head>
<body>

<h2 style="margin: 50px 180px 50px 180px;">Histogramas por ISP</h1>
<c:forEach items="${disp_list}" var="entry">
    <div class="isp-container row-fluid" style="margin: 50px 180px 100px 180px; height:600px;">
        <h3 class="isp-name">${entry.isp_name}</h3>
            <!-- calidad -->
            <div class="row-fluid span12">
                <div id="congestionup${entry.isp_id}" class="pull-left" style="height: 300px; width: 465px"></div>
                <div id="congestiondown${entry.isp_id}" class="pull-right" style="height: 300px; width: 465px"></div>
            </div>

            <!-- Utilizacion -->
            <div class="row-fluid span12">
                <div id="utilizacionup${entry.isp_id}" class="pull-left" style="height: 300px; width: 465px"></div>
                <div id="utilizaciondown${entry.isp_id}" class="pull-right" style="height: 300px; width: 465px"></div>
            </div>
    </div>
    <hr/>
</c:forEach>

<h2 style="margin: 50px 180px 50px 180px;">Boxplots por ISP</h1>
<c:forEach items="${boxplot_list}" var="entry">
    <h3 class="isp-name" style="margin-left:180px;">${entry.isp_name}</h3>
    <div id="container${entry.isp_id}" style="height: 400px; margin: auto; min-width: 310px; max-width: 600px"></div>
    <br/>
</c:forEach>




<!-- Data de los histogramas -->
<c:forEach items="${disp_list}" var="entry">
    <script type="text/javascript">
        var chart = new Highcharts.Chart({
            chart: {
                renderTo: 'congestionup${entry.isp_id}',
                type: 'column'
            },
            title: {
                text: 'Histograma Calidad Subida',
                x: -20 //center
            },

            xAxis: {
                categories: ['0-10%', '10-20%', '20-30%', '30-40%', '40-50%', '50-60%', '60-70%', '70-80%', '80-90%', '90-100%']
            },

            yAxis:{
            title:{text:'Ocurrencias'},

            },

            plotOptions: {
                column: {
                    groupPadding: 0,
                    pointPadding: 0,
                    borderWidth: 0
                }
            },

            series: [{
                name:'Calidad Subida',
                data: [${entry.congestionUpChart[0]}, ${entry.congestionUpChart[1]}, ${entry.congestionUpChart[2]}, ${entry.congestionUpChart[3]}, ${entry.congestionUpChart[4]}, ${entry.congestionUpChart[5]}, ${entry.congestionUpChart[6]}, ${entry.congestionUpChart[7]}, ${entry.congestionUpChart[8]}, ${entry.congestionUpChart[9]}]
            }]

        });
    var chart = new Highcharts.Chart({

        chart: {
            renderTo: 'congestiondown${entry.isp_id}',
            type: 'column'
        },
        title: {
            text: 'Histograma Calidad Bajada',
            x: -20 //center
        },

        xAxis: {
            categories: ['0-10%', '10-20%', '20-30%', '30-40%', '40-50%', '50-60%', '60-70%', '70-80%', '80-90%', '90-100%']
        },

        yAxis:{
            title:{text:'Ocurrencias'},
        },

        plotOptions: {
            column: {
                groupPadding: 0,
                pointPadding: 0,
                borderWidth: 0,
                color: '#E36262'

            }
        },

        series: [{
            name:'Calidad Bajada',
            data: [${entry.congestionDownChart[0]}, ${entry.congestionDownChart[1]}, ${entry.congestionDownChart[2]}, ${entry.congestionDownChart[3]}, ${entry.congestionDownChart[4]}, ${entry.congestionDownChart[5]}, ${entry.congestionDownChart[6]}, ${entry.congestionDownChart[7]}, ${entry.congestionDownChart[8]}, ${entry.congestionDownChart[9]}]
        }]

    });

    var chart = new Highcharts.Chart({

        chart: {
            renderTo: 'utilizacionup${entry.isp_id}',
            type: 'column'
        },
        title: {
            text: 'Histograma Utilizacion Subida',
            x: -20 //center
        },

        xAxis: {
            categories: ['0-10%', '10-20%', '20-30%', '30-40%', '40-50%', '50-60%', '60-70%', '70-80%', '80-90%', '90-100%']
        },

        yAxis:{
            title:{text:'Ocurrencias'},
        },

        plotOptions: {
            column: {
                groupPadding: 0,
                pointPadding: 0,
                borderWidth: 0
            }
        },

        series: [{
            name:'Utilizacion Subida',
            data: [${entry.utilizacionUpChart[0]}, ${entry.utilizacionUpChart[1]}, ${entry.utilizacionUpChart[2]}, ${entry.utilizacionUpChart[3]}, ${entry.utilizacionUpChart[4]}, ${entry.utilizacionUpChart[5]}, ${entry.utilizacionUpChart[6]}, ${entry.utilizacionUpChart[7]}, ${entry.utilizacionUpChart[8]}, ${entry.utilizacionUpChart[9]}]
        }]

    });

    var chart = new Highcharts.Chart({

        chart: {
            renderTo: 'utilizaciondown${entry.isp_id}',
            type: 'column'
        },
        title: {
            text: 'Histograma Utilizacion Bajada',
            x: -20 //center
        },

        xAxis: {
            categories: ['0-10%', '10-20%', '20-30%', '30-40%', '40-50%', '50-60%', '60-70%', '70-80%', '80-90%', '90-100%']
        },

        yAxis:{
            title:{text:'Ocurrencias'},
        },

        plotOptions: {
            column: {
                groupPadding: 0,
                pointPadding: 0,
                borderWidth: 0,
                color: '#E36262'
            }
        },

        series: [{
            name:'Utilizacion Bajada',
            data: [${entry.utilizacionDownChart[0]}, ${entry.utilizacionDownChart[1]}, ${entry.utilizacionDownChart[2]}, ${entry.utilizacionDownChart[3]}, ${entry.utilizacionDownChart[4]}, ${entry.utilizacionDownChart[5]}, ${entry.utilizacionDownChart[6]}, ${entry.utilizacionDownChart[7]}, ${entry.utilizacionDownChart[8]}, ${entry.utilizacionDownChart[9]}]
        }]

    });
    </script>

</c:forEach>


<!-- Data de los boxplots -->
<c:forEach items="${boxplot_list}" var="entry">
    <script>
    var chart = new Highcharts.Chart({

        chart: {
            renderTo: 'container${entry.isp_id}',
            type: 'boxplot'
        },

        title: {
            text: 'Highcharts box plot ${entry.isp_name}'
        },

        plotOptions: {
            series: {
                shadow:false,
                borderWidth:0,
                dataLabels:{
                    enabled:true,
                    formatter:function() {
                        return this.y + '%';
                    }
                }
            }
        },

        xAxis: {
            minTickInterval: 1,
            categories: ['Calidad Subida', 'Calidad Bajada', 'Utilizacion Subida', 'Utilizacion Bajada']
        },

        yAxis:{
            title:{text:'Porcentaje'},
            max: 100,
            min:0,
            labels: {
                formatter:function() {
                    // var pcnt = (this.value / dataSum) * 100;
                    return Highcharts.numberFormat(this.value ,0,',') + '%';
                }
            }
        },

        series: [{
            name: '${entry.isp_name}',
            data: [
                [${entry.congestionUpChart[0]}, ${entry.congestionUpChart[1]}, ${entry.congestionUpChart[2]}, ${entry.congestionUpChart[3]}, ${entry.congestionUpChart[4]}],
                [${entry.congestionDownChart[0]}, ${entry.congestionDownChart[1]}, ${entry.congestionDownChart[2]}, ${entry.congestionDownChart[3]}, ${entry.congestionDownChart[4]}],
                [${entry.utilizacionUpChart[0]}, ${entry.utilizacionUpChart[1]}, ${entry.utilizacionUpChart[2]}, ${entry.utilizacionUpChart[3]}, ${entry.utilizacionUpChart[4]}],
                [${entry.utilizacionDownChart[0]}, ${entry.utilizacionDownChart[1]}, ${entry.utilizacionDownChart[2]}, ${entry.utilizacionDownChart[3]}, ${entry.utilizacionDownChart[4]}]
            ]
        }]

    });
    </script>
</c:forEach>


</body>
</html>
