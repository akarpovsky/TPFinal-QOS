<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%-- <c:set var="req" value="${pageContext.request}" /> --%>
<%-- <c:set var="uri" value="${req.requestURI}" /> --%>
<%-- <c:set var="url">${req.requestURL}</c:set> --%>
<%-- <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" /> --%>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="icon" type="image/ico" href="<c:url value='/img/favicon.ico2'/>">

<title>TiX - Internet QoS</title>

<!-- CSS bootstrap styles -->
<link href="<c:url value='/css/bootstrap.css'/>" rel="stylesheet">
<!-- CSS Datepicker styles -->
<link href="<c:url value='/css/datepicker.css'/>" rel="stylesheet">
<link href="<c:url value='/css/tix.css'/>" rel="stylesheet">


<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]
-->

<!-- Javascript -->
<script type="text/javascript" src="<c:url value='/js/jquery-1.10.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/bootstrap.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/bootstrap-datepicker.js'/>"></script>
<script src="http://code.highcharts.com/stock/highstock.js"></script>
<script src="http://code.highcharts.com/stock/modules/exporting.js"></script>
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="<c:url value='/js/tix.js'/>"></script>
