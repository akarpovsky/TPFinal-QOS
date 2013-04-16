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
									<td>1</td>
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