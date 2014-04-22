<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <spanclass="icon-bar">
					</span> <span class="icon-bar"></span></a>
				<a class="brand" href="${pageContext.servletContext.contextPath}/bin/user/home">TiX</a>
					

				<div class="nav-collapse"></div>
			</div>
		</div>
		<div class="beta-banner">Versi&oacute;n Beta</div>
	</div>

	<div class="container-fluid">
		<div class="row-fluid">
			<h3>
				Tabla de medianas mensuales
				</h2>
				<div id="meantable">
					<table class="table table-striped" width="647">
						<thead>
							<tr>
								<th>ISP</th>
								<th>Congestion Subida</th>
								<th>Congestion Bajada</th>
								<th>Utilizacion Subida</th>
								<th>Utilizacion Bajada</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ispNames}"  var="entry " varStatus="status">
								<tr>
										<td>${ispNames[status.index]}</td>
										<td>${medianList[status.index][0]}</td>
										<td>${medianList[status.index][1]}</td>
										<td>${medianList[status.index][2]}</td>
										<td>${medianList[status.index][3]}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
		</div>
	</div>


</body>
</html>