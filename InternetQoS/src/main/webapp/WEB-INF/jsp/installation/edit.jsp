<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container">
		<div class="row-fluid">
			<div class="span12">
				<h1>Editar instalaci&oacute;n_</h1>
					<div class="hero-unit">
					<form:form method="POST" action="./edit" commandName="installationEditForm">
						<form:errors path="*" cssClass="label label-important"/>
						<label for="nickname">Nombre de la instalaci&oacute;n:</label> 
							<form:input type="text" path="name" value="${name}" />
							<form:input type="hidden" path="id" value="${id}" />
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