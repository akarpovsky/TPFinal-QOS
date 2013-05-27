<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container">
		<div class="row-fluid">
			<div class="span12">
				<h1>Recuperar contrase&ntilde;a_</h1>
				<c:if test="${userDoesntExist eq 'true'}">
					<p class="error-name">El usuario no existe</p>
				</c:if>
				<form:form method="POST" action="recover"
					commandName="passwordRecoveryForm">
					<form:errors path="*" />
					<br />
					<label for="nickname">Email</label>
					<form:input type="text" path="nickname" />
					<br />
					<input class="btn btn-primary btn-large" type="submit" value="Enviar" name="Enviar" />
				</form:form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>