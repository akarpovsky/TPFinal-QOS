<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container">
		<div class="row-fluid">
			<div class="span12">
				<h1>Crear nueva instalaci&oacute;n_</h1>
					<div class="hero-unit">
					<c:if test="${noInstallations}">
						<div class="row-fluid">
		   				 	<div class="span12">
						      <div class="alert alert-info">
						        <strong>Informaci&oacute;n</strong> Para poder utilizar el sistema de mediciones TiX primero debe crear una instalaci&oacute;n utilizando el siguiente formulario.
						      </div>
						    </div>
						</div>
					</c:if>
					<form:form method="POST" action="./newinstallation" commandName="installationCreationForm">
						<form:errors path="*" cssClass="label label-important"/>
						<label for="nickname">Nombre de la instalaci&oacute;n:</label> 
						<form:input type="text" path="name" value="${name}" />
						<br/>
						<label for="location">Ubicaci&oacute;n: <br/><i>Elegir solo en caso de PC fija (no notebook)</i></label>
						<form:select path="location">
						     <form:options items="${installationLocations}" itemLabel="translationKey" />
						</form:select>
						<br/>
						<input type="submit"  class="btn btn-primary btn-large" value="Aceptar">
					</form:form>
				</div>
			</div>
		</div>
		
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>