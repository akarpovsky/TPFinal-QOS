<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container">
		<p>Lo sentimos pero se ha producido un error inesperado en el sistema.</p>
		
		<p>Puede que la p&aacute;gina a la que intenta acceder no est&eacute; disponible, no exista o que no tenga los permisos suficientes para acceder a ella.</p><br />
		<c:if test="${!empty errorDescription}">
			<div class="error-header">Descripci&oacute;n del error: <span class="label label-important" style="margin-left:5px;">${errorDescription}</span>.</div>
		</c:if>
		<br />
		<p>Ante cualquier duda visite nuestra <a href="#">secci&oacute;n de contacto</a>.</p>
		
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>