<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

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
						<label for="nickname">Email:</label> 
						<form:input type="text" path="nickname" value="${nickname}" />
						<br/>
						
						<label for="password1">Contrase&ntilde;a:</label>
						<form:input type="password" path="password1" />
						<br/> 
						<label for="password2">Repetir contrase&ntilde;a:</label> 
						<form:input type="password" path="password2" />
						<br/> 
						<tags:captcha privateKey="6LdZe8QSAAAAAA8DQu_WXpuxQpTVaQM0EYPvO1M5" publicKey="6LdZe8QSAAAAANw5tJUftmtx1m45kYk3fw8aNd1N"></tags:captcha>
						<input type="submit"  class="btn btn-primary btn-large" value="Enviar">
					</form:form>
				</div>
			</div>
		</div>
		
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>