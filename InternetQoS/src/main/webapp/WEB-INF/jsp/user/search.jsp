
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container"></div>
	<div class="hero-unit" style="z-index: 1; position: relative;">
		<div class="row-fluid" style="margin-bottom: 8px;">
		<div style="margin-left: 0;" class="span12 breadcrumb">
				<c:choose>
					<c:when test="${empty searchResultMap}">
						<span class="label label-important">La b&uacute;squeda no produjo resultados</span>
					</c:when>
					<c:otherwise>

						<c:forEach var="searchEntry" items="${searchResultMap}">
							<div class="span12 userResultContainer"
								style="margin-left:0px;<c:if test='${itNum % 2 == 0}'>background: #E6E6E6;</c:if>">
								<%@ include file="/WEB-INF/jsp/user/searchResultRow.jsp"%>
							</div>
							<c:set var="itNum" value="${itNum +1 }" />
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>