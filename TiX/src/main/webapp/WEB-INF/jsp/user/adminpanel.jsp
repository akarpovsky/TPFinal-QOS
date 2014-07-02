<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="hero-unit" style="z-index: 1; position: relative;">
		<section id="charts">
				<div class="page-header">
					<h2>Gráficos generales</h2>
				</div>
				<a class="btn btn-large" href="./ispcharts">Ver graficos de utilizaci&oacute;n y calidad</a>
				<a class="btn btn-large" href="./getcsv">Generar csv de utilizaci&oacute;n y calidad</a>
		</section>

		<hr/>


		<section id="tables">
			<div class="page-header">
				<h2>Usuarios del sistema</h2>
			</div>

			<c:choose>
				<c:when test="${empty userList}">
					<span class="label label-important">No hay usuarios registrados en el sistema.</span>
				</c:when>
				<c:otherwise>
					<table class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>Nickname</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userList}" var="user">
								<tr>
									<td>${user.id}</td>
									<td>${user.nickname}</td>
									<td><a class="btn btn-info" href="./dashboard?nickname=${user.nickname}">Estad&iacute;sticas</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</section>




	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>
