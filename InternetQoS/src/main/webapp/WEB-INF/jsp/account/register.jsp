<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container">
		<div class="row-fluid">
			<div class="span12">
				<h1>Crear nueva cuenta_</h1>
					<div class="hero-unit">
					<form:form method="POST" action="../account/register" commandName="userCreationForm">
						<form:errors path="*" cssClass="label label-important"/>
						<label for="nickname">Nickname:</label> 
						<form:input type="text" path="nickname" value="${nickname}" />
						<br/>
						<label for="firstName">Nombre:</label> 
						<form:input type="text" path="firstName" value="${firstName}" />
						<br/> 
						<label for="lastName">Apellido:</label>
						<form:input type="text" path="lastName" value="${lastName}" />
						<br/>
						<label for="email">Email:</label> 
						<form:input type="text" path="email" value="${email}" />
						<br/> 
						<label for="password1">Contrase&ntilde;a:</label>
						<form:input type="password" path="password1" />
						<br/> 
						<label for="password2">Repetir contrase&ntilde;a:</label> 
						<form:input type="password" path="password2" />
						<br/> 
						<input type="submit"  class="btn btn-primary btn-large" value="Enviar">
					</form:form>
				</div>
			</div>
		</div>
		
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>