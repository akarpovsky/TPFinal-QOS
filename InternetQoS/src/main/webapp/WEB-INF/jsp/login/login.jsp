<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container">

		<div class="row-fluid">
			<div class="span6" style="padding-top:150px">
				<img src="<c:url value='/img/internetqos_logo.jpg'/>" class="img-rounded" style="height: 90px;">
				<p class="lead">Por una internet m&aacute;s transparente y justa!</p>
			</div>
			<div class="span6">
				<h1>Iniciar sesi&oacute;n_</h1>
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
			<div class="span12 offset4" style="">
				<a class="btn btn-primary btn-large" href="../account/register">Crear nueva cuenta_</a>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>