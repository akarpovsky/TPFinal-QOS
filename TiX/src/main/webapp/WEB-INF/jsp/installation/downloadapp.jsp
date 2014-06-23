<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container">
		<section id="typography">
			<div class="page-header">
				<h1>Nueva instalaci&oacute;n</h1>
			</div>

			<!-- Headings & Paragraph Copy -->
			<div class="row">

				<div class="span12">
					<!--<h3>Bienvenido ${currUser.nickname}</h3>-->
					<p>Aqu&iacute; vas a poder descargar la aplicaci&oacute;n seg&uacute;n tu sistema operativo.</p>
				</div>
			</div>

			<div class="row">
				<div class="span12">
					<h4>Elige tu sistema operativo</h4>

					<div class="row-fluid">
						<ul class="thumbnails">
							<li class="span3">
								<p style="text-align: center;">Linux AMD64</p>
								<a href="<c:url value='/download/tix_unix_amd64.deb'/>" class="thumbnail"> <img
									alt="Linux"
									style=""
									src="<c:url value='/img/linuxlogo.jpg'/>">
								</a>
							</li>
							<li class="span3">
								<p style="text-align: center;">OSX Mavericks (10.9)</p>
								<a href="<c:url value='/download/tix_osx_mavericks.dmg'/>" class="thumbnail"> <img
									alt="Apple Mavericks"
									style=""
									src="<c:url value='/img/applelogo.jpg'/>">
								</a>
							</li>
							<li class="span3">
								<p style="text-align: center;">OSX Mountain Lion (10.8)</p>
								<a href="<c:url value='/download/tix_osx_mountain.dmg'/>" class="thumbnail"> <img
									alt="Apple Mountain Lion"
									style=""
									src="<c:url value='/img/applelogo.jpg'/>">
								</a>
							</li>
							<!--<li class="span3">
								<p style="text-align: center;">Windows</p>
								<a href="<c:url value='/download/tix_windows.exe'/>" class="thumbnail"> <img
									alt="Windows"
									style=""
									src="<c:url value='/img/windowslogo.jpg'/>">
								</a>
							</li>-->
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="span12">
					<h3>Instrucciones de instalaci&oacute;n</h3>
					<h4>Linux</h4>
					<p>Para instalar tu aplicativo en linux debes seguir los siguientes pasos:</p>
					<ul>
						<li>Descargar el aplicativo haciendo click sobre el logo del sistema operativo elegido</li>
						<li>Ejecutar el archivo .deb haciendo doble click</li>
						<li>Esperar a que se lance la aplicaci&oacute;n</li>
						<li>Loguearse con su usuario y contrase&ntilde;a, dar un nombre a la instalaci&oacute;n y aguardar a que finalice el proceso y reciba el mensaje de "Instalaci&oacute;n Existosa"</li>
						<li>Correr el comando "ps -ax | egrep startupAppCaller" para verficar que el programa ya est&aacute; corriendo</li>
					</ul>
					<h4>Mac</h4>
					<p>Para instalar tu aplicativo en MAC debes seguir los siguientes pasos:</p>
					<ul>
						<li>Descargar el aplicativo haciendo click sobre el logo del sistema operativo elegido</li>
							<ul>
								<li>Notar que seg&uacute;n ud. tenga Mavericks o Mountain Lion debe descargar ejecutables ditintos</li>
							</ul>
						<li>Ejecutar el archivo .dmg haciendo doble click</li>
						<li>Esperar a que se lance la aplicaci&oacute;n</li>
						<li>Loguearse con su usuario y contrase&ntilde;a, dar un nombre a la instalaci&oacute;n y aguardar a que finalice el proceso y reciba el mensaje de "Instalaci&oacute;n Existosa"</li>
						<li>Correr el comando "ps -ax | egrep startupAppCaller" para verficar que el programa ya est&aacute; corriendo</li>
					</ul>
				</div>
			</div>

		</section>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>