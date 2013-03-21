<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container">
	</div>
	<div class="hero-unit" style="z-index: 1; position: relative;">
		<div class="row-fluid" style="margin-bottom: 8px;">
			<c:choose>
				<c:when test="${empty notifications}">
					<span class="label label-important">No tiene notifiaciones pendientes</span>
				</c:when>
				<c:otherwise>
					<c:forEach var="notification" items="${notifications}">
						<%@ include file="/WEB-INF/jsp/notification/displayNotification.jsp"%>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>