<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>

	<div class="hero-unit" style="z-index: 1; position: relative;">
		<section id="tables">
			<div class="page-header">
				<h2>Mis instalaciones_</h2>
			</div>

			<c:choose>
				<c:when test="${empty installationsList}">
					<span class="label label-important">No hay instalaciones registradas en el sistema.</span>
				</c:when>
				<c:otherwise>
					<table class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
								<th>Nombre</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${installationsList}" var="installation">
								<tr>
									<td>${installation.name}</td>
									<td><a class="btn btn-info" href="./edit?id=${installation.id}">Editar</a>  <a class="btn btn-danger" href="./delete?id=${installation.id}">Eliminar</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</section>
		<a class="btn btn-primary" href="../user/dashboard?nickname=${user.nickname}&graphtype=GENERAL_GRAPH">Volver</a>
	</div>
		
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>