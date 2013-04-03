<!-- This file contains the header HTML of the site.
	Here we include the top navbar, logo, etc -->

<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> 
				<spanclass="icon-bar"></span> 
				<span class="icon-bar"></span>
			</a>
			<a class="brand" href="../user/profile">TiX</a>
			
			<div class="nav-collapse">
					<c:choose>
						<c:when test="${isLogged}">
							<ul class="nav">
								<li class=""><a href="../event/">Estad&iacute;sticas</a></li>
								<li class=""><a href="../account/edit">Configuraci&oacute;n</a></li>
							</ul>
							<p class="navbar-text pull-right">
								<a href="../login/logout" class="navbar-link">Cerrar sesi&oacute;n (${currUser.nickname})</a>
							</p>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
			</div>
		</div>
	</div>
</div>

