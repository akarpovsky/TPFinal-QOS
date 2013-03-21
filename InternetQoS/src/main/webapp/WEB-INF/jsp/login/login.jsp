<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container">

		<div class="row-fluid">
			<div class="span6" style="padding-top:150px">
				<img src="<c:url value='/img/internetqos_logo.jpg'/>" class="img-rounded" style="height: 90px;">
				<p class="lead">Por un internet m&aacute;s transparente y justo!</p>
			</div>
			<div class="span6">
				<h2>Iniciar sesi&oacute;n</h2>
				<div class="hero-unit">
					<form:form action="../login/login" method="POST" commandName="userLoginForm">
						<form:errors path="*" cssClass="label label-important"/>
						<br/>
						<label for="nickname">Nickname:</label> 
						<form:input type="text" path="nickname" />
						<br /> 
						<label for="password">Contrase&ntilde;a:</label>
						<form:input type="password" path="password" />
						<br /> 
						<a href="<c:url value='/bin/account/recover'/>">
							&iquest;Olvid&oacute; su contrase&ntilde;a?
						</a>
						<input type="submit" value="Enviar" />
					</form:form>
				</div>
			</div>
		</div>
		<h2>Registrese</h2>
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
			<label for="birthdate">Fecha de nacimiento: (dd/mm/yyyy)</label> 
			<form:input type="text" path="birthdate" value="${birthdate}" />
			<br /> 
			<label for="password1">Contrase&ntilde;a:</label>
			<form:input type="password" path="password1" />
			<br/> 
			<label for="password2">Repetir contrase&ntilde;a:</label> 
			<form:input type="password" path="password2" />
			<br/> 
			<input type="submit" value="Enviar">
		</form:form>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>