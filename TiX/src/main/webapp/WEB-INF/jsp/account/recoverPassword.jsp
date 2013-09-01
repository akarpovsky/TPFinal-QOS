<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container">
		<div class="row-fluid">
			<div class="span12">
				<h1>Crear nueva cuenta_</h1>
				<c:if test="${passwordsDontMatch eq 'true'}">
					<p class="error-name">Las contrase&ntilde;as no matchean</p>
				</c:if>
				<c:if test="${changePasswordFailed eq 'true'}">
					<p class="error-name">El proceso de recuperaci&nacute;n de la
						contrase&ntilde;a ha fallado</p>
				</c:if>
				<form:form method="POST" action="recoverPassword"
					commandName="passwordRecoveryForm">
					<form:errors path="*" />
					<label for="password1">Ingrese la nueva contrase&ntilde;a</label>
					<form:input type="password" path="password1" />
					<br />
					<label for="password2">Repita la nueva contrase&ntilde;a</label>
					<form:input type="password" path="password2" />
					<br />
					<input type="hidden" name="cod" value="${cod}" />
					<input type="submit" name="Enviar">
				</form:form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>