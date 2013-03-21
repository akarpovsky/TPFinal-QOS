<!-- This file contains the header HTML of the site.
	Here we include the top navbar, logo, etc -->

<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> 
				<spanclass="icon-bar"></span> 
				<span class="icon-bar"></span>
			</a> 
			<a class="brand" href="../user/profile">${currUser.firstName}</a>
			<div class="nav-collapse">
				<ul class="nav">
					<c:choose>
						<c:when test="${isLogged}">
							<li class=""><a href="../user/profile">Mi Perfil</a></li>
							<li class=""><a href="../notification/unread">Notificaciones<span class="label label-warning" id="pendingNotifications"></span></a></li>
							<li class=""><a href="../user/history">Historial</a></li>
							<li class=""><a href="../account/edit">Configuraci&oacute;n</a></li>
							<li class=""><a href="../event/">Eventos</a></li>
							</ul>
							<form class="navbar-search pull-left" action="../user/search" _lpchecked="1">
								<input type="text" name="query" class="search-query span3" style="height: 30px;" placeholder="Buscar usuarios...">
							</form>
							<ul class="nav pull-right">
								<li class="divider-vertical"></li>
								<li><a href="../login/logout">Cerrar sesi&oacute;n</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<li class="active"><a href="../user/profile">Inicio</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
			</div>
		</div>
	</div>
</div>

