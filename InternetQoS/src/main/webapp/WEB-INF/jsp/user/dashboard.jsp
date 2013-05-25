<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">Instalaciones</li>
              	<c:forEach var="installation" items="${user.installations}">
	              <li class='<c:if test="${installation.id == currentInstallation.id}">active</c:if>'><a href="./dashboard?nickname=${user.nickname}&graphtype=${currentGraphType}&ins=${installation.id}">${installation.name}</a></li>
              	</c:forEach>
	          <li class="divider"></li>
	          <li><a href="#">Ayuda</a></li>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">
			<c:choose>
	        	<c:when test="${noRecords}">
	        		<div class="span12">
				        <div class="alert alert-block">
				          <a class="close">×</a>
				          <h4 class="alert-heading">No hay registros</h4>
				          <p>Lo sentimos pero no hemos encontrado registros para la instalaci&oacute;n seleccionada.</p>
				        </div>
				    </div>
	        	</c:when>
	        	<c:otherwise>
		   			<div id="graphcontainer"></div><!-- Here the graph will be rendered -->
					<hr>
			        <div class="row" style="margin: 10 0 20 0;">
						<div class="text-center"><p><img src="../../img/congestiondown.png"/> Congestion Upstream <img src="../../img/congestionup.png"/> Congestion Downstream</div></p>
					</div>
					<div class="hero-unit" style="z-index: 1;height: 53px;margin: 0px;padding: 0px;">
			        <div class="row" style="margin-top: 10px; margin-bottom:20px;">
						<div class="text-center">
									<a class="btn btn-primary"
										href="./dashboard?nickname=${user.nickname}&graphtype=GENERAL_GRAPH&ins=${currentInstallation.id}">General</a>
									<a class="btn btn-primary"
										href="./dashboard?nickname=${user.nickname}&graphtype=UPSTREAM_GRAPH&ins=${currentInstallation.id}">Upstream</a>
									<a class="btn btn-primary"
										href="./dashboard?nickname=${user.nickname}&graphtype=DOWNSTREAM_GRAPH&ins=${currentInstallation.id}">Downstream</a>
								</div><!-- Graph buttons -->
					</div>
					</div>
        		</c:otherwise>
	        </c:choose>	
		
        </div><!--/span-->
      </div><!--/row-->
    
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
<script type="text/javascript">                        
            $(function () {
            	 var datos =  ${javaChart.JSONString};
            	 
                 var fechas = ${javaChart.timestamps};
                 var title = "${javaChart.title}";
                 var redmarker = ${javaChart.redmarker};
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
                            max: 6,
                            plotBands: redmarker, 
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
                        scrollbar: {
                            enabled: true
                        },
                        series: datos
                    });
                });
            });
        
        </script>
</html>