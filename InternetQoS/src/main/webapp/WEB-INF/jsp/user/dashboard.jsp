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
		<div id="graphcontainer" class="span12 offset2" style="padding: 10px"></div>
	</div>
	<div class="hero-unit" style="z-index: 1; position: relative;">
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
      <script type="text/javascript">                        
            $(function () {
                var datos =  ${javaChart.JSONString};
                var fechas = ${javaChart.timestamps};
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
                            categories: fechas,
                            labels: {
                                formatter: function() {
                                    return Highcharts.dateFormat('%d/%m/%Y', this.value);
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
                        series: datos
                    });
                });
            });
        
        </script>
</html>