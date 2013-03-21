<html>
	<%@ include file="/WEB-INF/jsp/head.jsp"%>
	<body>
		<c:if test="${userDoesntExist eq 'true'}">
			<p class="error-name">El usuario no existe</p>
		</c:if>
		<%@ include file="/WEB-INF/jsp/header.jsp"%>
		<form:form method="POST" action="recover" commandName="passwordRecoveryForm">
			<form:errors path="*"/><br/>
			<label for="nickname">Nickname</label>
			<form:input type="text" path="nickname" /><br/>
			<input type="submit" name="Enviar">
		</form:form>
		<%@ include file="/WEB-INF/jsp/footer.jsp"%>
	</body>
</html>