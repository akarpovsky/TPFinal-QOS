<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container">

		<div class="row-fluid">
			<div class="span12" style="padding-bottom: 30px">
				<div class="span6">
				
					<img src="<c:url value='/img/pawbook_logo.png'/>" class="img-rounded" style="height: 70px;">

				</div>
				<span class="span6 lead">La red social de la que habla toda la facultad!</span>
			</div>
		</div>
		<c:if test="${!empty errorDescription}">
			<div class="error-header">${errorDescription}</div>
		</c:if>
		
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>