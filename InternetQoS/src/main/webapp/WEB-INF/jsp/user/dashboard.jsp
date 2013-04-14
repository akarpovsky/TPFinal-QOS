<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container"></div>
	<div id="container" style="width:100%; background-color:yellow; height:400px;"></div>
	<div class="hero-unit" style="z-index: 1; position: relative;">
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
      <script type="text/javascript">                        
            $(function () {
                var datos =  ${json};
                var fechas = ${timestamps};
                for (var i=0;i<fechas.length;i++){
                	fechas[i] = new Date(fechas[i]);
                }
                alert(fechas);
                var chart;
                $(document).ready(function() {
                    chart = new Highcharts.Chart({
                        chart: {
                            renderTo: 'container',
                            type: 'line',
                            marginRight: 130,
                            marginBottom: 25
                        },
                        title: {
                            text: 'Porcentaje de Utilizacion de Ancho de Banda',
                            x: -20 //center
                        },
                        subtitle: {
                            text: 'Grafico General',
                            x: -20
                        },
                        xAxis: {
                       		type: 'datetime',                       		
                       		categories: fechas
                 
        },
                            
                       
                        yAxis: {
                            title: {
                                text: '% de utilizacion'
                            },
                            plotLines: [{
                                    value: 0,
                                    width: 1,
                                    color: '#808080'
                                }]
                        },
                        tooltip: {
                            formatter: function() {
                                return '<b>'+ this.series.name +'</b><br/>'+
                                    this.x +': '+ this.y +'%';
                            }
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