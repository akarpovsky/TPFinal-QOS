<!-- This file contains the header HTML of the site.
	Here we include the top navbar, logo, etc -->

<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> 
				<spanclass="icon-bar"></span> 
				<span class="icon-bar"></span>
			</a>
			<a class="brand" href="${pageContext.servletContext.contextPath}/bin/user/home">TiX</a>
			
			<div class="nav-collapse">
					<c:choose>
						<c:when test="${isLogged}">
							<ul class="nav">
								<li class=""><a href="../static/about">Sobre el proyecto</a></li>
							</ul>
							<p class="navbar-text pull-right">
								<a href="../login/logout" class="navbar-link">Cerrar sesi&oacute;n (${currUser.nickname})</a>
							</p>
						</c:when>
						<c:otherwise>
							<ul class="nav">
								<li class=""><a href="../static/about">Sobre el proyecto</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
			</div>
		</div>
	</div>
	<div class="beta-banner">Versi&oacute;n Beta</div>
</div>

