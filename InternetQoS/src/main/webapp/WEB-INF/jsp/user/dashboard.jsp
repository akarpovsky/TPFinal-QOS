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
<script>

$(document).ready(function() {
    var chart1 = new Highcharts.Chart({
        chart: {
            renderTo: 'container',
            type: 'bar'
        },
        title: {
            text: 'Uso de internet'
        },
        xAxis: {
            categories: ['Fibertel', 'Arnet', 'iPlan']
        },
        yAxis: {
            title: {
                text: 'Congestion'
            }
        },
        series: [{
            name: 'PC1',
            data: [1, 0, 4]
        }, {
            name: 'PC2',
            data: [5, 7, 3]
        }]
    });
});
</script>
</html>