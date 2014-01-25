<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container"></div>

	<div class="hero-unit" style="z-index: 1; position: relative;">
		<div class="row-fluid" style="margin-bottom: 8px;">
			<div class="span3">
				<div style="text-align: center;">
<%-- 					<img src="<c:url value='/img/TiX.png'/>" class="img-rounded" style="height: 60px;"> --%>
				</div>
				<div class="profile_pic_container">
<!-- 					<img alt="" class="profile_image img-circle" src="" /> -->
				</div>

				<div>
			</div>

			</div>
			<div class="span9">
				<div class="row-fluid">
					<span class="span12" style="margin-bottom: 5px;">
						<h3>${user}</h3>
					</span> 
					<br /> 
					<span style="margin-left: 0;" class="span12 breadcrumb">
						<h4>Editar informaci&oacute;n</h4>
						<div class="row-fluid">
							<form:form method="POST" action="edit" commandName="userUpdateForm">
								<form:errors path="*" cssClass="label label-important"/>
								<div class="row-fluid">
									<div class="span3">
										<strong>Nickname: </strong><br />
									</div>
									<div class="span4">
										<form:input type="text" path="nickname" /><br />
									</div>
								</div>
								
								<div class="row-fluid">
									<div class="span3">
										<strong>Contrase&ntilde;a: </strong><br />
									</div>
									<div class="span4">
										<form:input type="password" path="password1" value="" /> <br />
									</div>
								</div>
								<button type="submit" class="btn btn-primary btn-mini">
									<i class="icon-ok icon-white"></i> Guardar cambios
								</button>
							</form:form>
							<br />
							<h4>Editar contrase&ntilde;a</h4>
							<form:form method="POST" action="changePassword" commandName="passwordUpdateForm">
								<form:errors path="*" cssClass="label label-important"/>
								<br />
								<div class="row-fluid">
									<div class="span3">
										<strong>Original: </strong><br />
									</div>
									<div class="span4">
										<form:input type="password" path="originalPassword" /><br />
									</div>
								</div>
								<div class="row-fluid">
									<div class="span3">
										<strong>Nueva: </strong><br />
									</div>
									<div class="span4">
										<form:input type="password" path="newPassword" /><br />
									</div>
								</div>
								<button type="submit" class="btn btn-primary btn-mini">
									<i class="icon-ok icon-white"></i> Guardar cambios
								</button>
							</form:form>
						</div>
					</span>

				</div>
			</div>
		</div>
	</div>


	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>