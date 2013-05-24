<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<style>
.caption {
    float:left;
    width: 270px;
}
.span8{
    width:350px;
}
.thumb_image {
    width:187x;
    height:187px;
    float: left;
}
.clear {
    clear:both;
}
</style>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container">

		<div class="row-fluid">
			<div class="span6">
				<h3>Proyecto TiX_</h3>
				<div class="thumb_image">
					<img alt="Logo Tix" src="<c:url value='/img/logo_TiX.png'/>">
				</div>
           		<div class="caption pull-left">
           			<p>Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
					<p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Donec sed odio dui.</p>
  			  	</div>
         	   	<div class="clear"></div>
         	   	
				<p>Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				<p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Donec sed odio dui.</p>
				<a class="btn btn-info btn-large" href="../account/register">Crear nueva cuenta_</a>
		    </div>
			<div class="span6">
				<h1>Iniciar sesi&oacute;n_</h1>
				<div class="form-horizontal well">
					<form:form action="../login/login" method="POST" commandName="userLoginForm">
						<fieldset>
							<div class="control-group">
					            <div class="controls">
									<form:errors path="*" cssClass="label label-important"/>
					            </div>
	          				</div>
	          				
							<div class="control-group">
	            				<label class="control-label" for="nickname">Email</label>
					            <div class="controls">
	         						<form:input type="text" id="nickname" class="" path="nickname" />
					            </div>
	          				</div>	          				
	
							<div class="control-group">
	            				<label class="control-label" for="password">Contrase&ntilde;a</label>
					            <div class="controls">
	         						<form:input type="password" id="password" class="" path="password" />
									<br />
									<a href="<c:url value='/bin/account/recover'/>">
										&iquest;Olvid&oacute; su contrase&ntilde;a?
									</a>
					            </div>
	          				</div>
							<div class="control-group">
					            <div class="controls">
									<input class="btn btn-primary btn-large" type="submit" value="Enviar" />
					            </div>
	          				</div>
						</fieldset>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>