<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="row">
		<div class="text-center" >
			<a class="btn btn-info btn-large" href="./dashboard?nickname=${user.nickname}&graphtype=GENERAL_GRAPH">General</a>
			<a class="btn btn-info btn-large" href="./dashboard?nickname=${user.nickname}&graphtype=UPSTREAM_GRAPH">Upstream</a>
			<a class="btn btn-info btn-large" href="./dashboard?nickname=${user.nickname}&graphtype=DOWNSTREAM_GRAPH">Downstream</a>
		</div>
	</div>
	<div class="row">
		<div id="graphcontainer" class="span12 offset2" style="padding: 10px"></div><br/>
		<div id="container" class="span12 offset2" style="padding: 10px"></div>
	</div>
	<div class="hero-unit" style="z-index: 1; position: relative;">
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
      <script type="text/javascript">                        
            $(function () {
           	 var datos =  [{"marker":{"symbol":"circle"},"name":"Upstream","data":[66,44,68,77,60,99,48,78,55,66,44,68,77,60,99,48,78,55]},{"marker":{"symbol":"diamond"},"name":"CongesitónUp","data":[22,41,33,12,12,45,65,87,22,22,41,33,12,12,45,65,87,22]},{"marker":{"symbol":"circle"},"name":"Downstream","data":[29,25,30,10,22,16,22,30,20,29,25,30,10,22,16,22,30,20]},{"marker":{"symbol":"diamond"},"name":"CongestiónDown","data":[12,25,14,18,28,44,22,11,21,12,25,14,18,28,44,22,11,21]}];

			var fechas = [1366053612345, 1365967212345, 1365880812345, 1365794412345, 1365794412345, 1365708012345, 1365621612345, 1365448812345, 1098192234000,1098192234000,1098192234000,1098192234000,1098192234000,1098192234000,1098192234000,1098192234000,1098192234000,1098192234000];
                var title = "${javaChart.title}";
                var subtitle = "${javaChart.subtitle}";
                for (var i=0;i<fechas.length;i++){
                	fechas[i] = new Date(fechas[i]);
                }
                var chart;
                $(document).ready(function() {
                    chart = new Highcharts.Chart({
                        chart: {
                            renderTo: 'graphcontainer',
                          	marginRight: 130,
                           	marginBottom: 25
                        },
                        title: {
                            text: title,
                            x: -20 //center
                        },
                        subtitle: {
                            text: subtitle,
                            x: -20
                        },
                        xAxis: {        
                            type: 'datetime',
                            max: 8,
                            categories: fechas,
                            labels: {
                                formatter: function() {
                                    return Highcharts.dateFormat('%d/%m/%Y<br/>', this.value);
                                },
                            },
                        },
                        yAxis: {
                            title: {
                                text: '% de utilizacion'
                            },
                            plotLines: [{
                                    value: 0,
                                    width: 1,
                                    color: '#808080'
                                }],
                           	min: 0, max: 100    
                        },
                        tooltip: {
                           
                            shared: true,
                            crosshairs: true
                        },
                        legend: {
                            layout: 'vertical',
                            align: 'right',
                            verticalAlign: 'top',
                            x: -10,
                            y: 100,
                            borderWidth: 0
                        },
                        scrollbar: {
                            enabled: true
                        },
                        series: datos
                    });
                });
            });
        
        </script>
        <script type="text/javascript">
        $(function() {
        
        	 var datos =  ${javaChart.JSONString};
             var fechas = ${javaChart.timestamps};
             var title = "${javaChart.title}";
             var subtitle = "${javaChart.subtitle}";
             for (var i=0;i<fechas.length;i++){
             	fechas[i] = new Date(fechas[i]);
             }
        	
             // create the chart when all data is loaded
        	function createChart() {

        		$('#container').highcharts('StockChart', {
        			chart: {
                        renderTo: 'container',
                      	marginRight: 130,
                       	marginBottom: 25
                    },
                    title: {
                        text: title,
                        x: -20 //center
                    },
                    subtitle: {
                        text: subtitle,
                        x: -20
                    },
                    xAxis: {
                    	type: 'datetime',
                    	dateTimeLabelFormats: {
            				second: '%Y-%m-%d<br/>%H:%M:%S',
            				minute: '%Y-%m-%d<br/>%H:%M',
            				hour: '%Y-%m-%d<br/>%H:%M',
            				day: '%Y<br/>%m-%d',
            				week: '%Y<br/>%m-%d',
            				month: '%Y-%m',
            				year: '%Y'
            			}
                	},
                    yAxis: {
                        title: {
                            text: '% de utilizacion'
                        },
                        plotLines: [{
                                value: 0,
                                width: 1,
                                color: '#808080'
                            }],
                       	min: 0, max: 100    
                    },
                    tooltip: {
                       
                        shared: true,
                        crosshairs: true
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'top',
                        x: -10,
                        y: 100,
                        borderWidth: 0
                    },
        		    rangeSelector: {
        		        selected: 0
        		    },
        		    series: [{
//         		        data: [[1146441600000, 21], [1365967212345,11]]  
//         		    	data: [[1365880812345,33.0], [1365794412345,12.0],[1365794412345,87.0]]
						data: [
						       [1366053612345, 22], [1365967212345, 41], [1365880812345, 33]
						       ]
        		    }
        		    		]

        		});
        	}
        		createChart();

        });
        </script>
</html>