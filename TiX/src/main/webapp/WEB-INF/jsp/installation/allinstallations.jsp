<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>

	<div class="hero-unit" style="z-index: 1; position: relative;">
		<section id="tables">
			<div class="page-header">
				<h2>Mis instalaciones_</h2>
			</div>
			<c:if test="${not empty param.userFeedbackLabel}">
				<div class="alert alert-success">
			        <c:out value="${param.userFeedbackLabel}"></c:out>
		     	</div>
			</c:if>
			<c:choose>
				<c:when test="${empty installationsList}">
					<span class="label label-important">No hay instalaciones registradas en el sistema.</span>
				</c:when>
				<c:otherwise>
					<table class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
								<th>Nombre</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${installationsList}" var="installation">
								<tr>
									<td>${installation.name}</td>
									<td><a class="btn btn-info" href="./edit?id=${installation.id}">Editar</a> <a href="#publicKeyModal" role="button" class="btn btn-danger publicKeyDialog" data-toggle="modal" data-id="${installation.encryptionKey}">Ver Clave P&uacute;blica</a>  <a href="#myModal" role="button" class="btn btn-danger deleteInstallationDialog" data-toggle="modal" data-id="${installation.id }">Eliminar</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</section>
		<a class="btn btn-primary" href="../user/dashboard?nickname=${user.nickname}&graphtype=GENERAL_GRAPH">Volver</a>
	
		</div>
	
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>

<!--Delete Modal -->
			<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			    <h3 id="myModalLabel">Atenci&oacute;n</h3>
			  </div>
			  <div class="modal-body">
			    <p>Si continua con esta acci&oacute;n se borrar&aacute;n tambi&eacute;n todos los datos almacenados para esta instalaci&oacute;n.</p>
			  </div>
			  <div class="modal-footer">
			    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
			    <a id="deleteLink" href="#"><button class="btn btn-primary" href="aaa">Continuar</button></a>
			  </div>
			</div>	
			
<!--Public Key Modal -->
			<div id="publicKeyModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			    <h3 id="myModalLabel">Clave p&uacute;blica</h3>
			  </div>
			  <div class="modal-body">
			    <div id="publicKeyDiv">aaa</div>
			  </div>
			  <div class="modal-footer">
			    <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Aceptar</button>
			  </div>
			</div>	
<script type="text/javascript">
$(document).on("click", ".deleteInstallationDialog", function () {
    var installationId = $(this).data('id');
    document.getElementById("deleteLink").href="./delete?id=" + installationId; 
   // Not necessary to call the modal
   // $('#addBookDialog').modal('show');
});

$(document).on("click", ".publicKeyDialog", function () {
    var installationPublicKey = $(this).data('id');
    $("#publicKeyDiv").html(installationPublicKey);
});
</script>
</html>