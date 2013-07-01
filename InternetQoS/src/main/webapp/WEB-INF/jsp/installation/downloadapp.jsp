<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container">
		<section id="typography">
			<div class="page-header">
				<h1>Nueva instalaci&oacute;n - ${installation.name}</h1>
			</div>

			<!-- Headings & Paragraph Copy -->
			<div class="row">

				<div class="span12">
					<h3>Bienvenido ${currUser.nickname}</h3>
					<p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus
						dolor auctor. Duis mollis, est non commodo luctus, nisi erat
						porttitor ligula, eget lacinia odio sem nec elit. Donec sed odio
						dui.</p>
				</div>
			</div>

			<div class="row">
				<div class="span12">
					<h4>Elige tu sistema operativo</h4>

					<div class="row-fluid">
						<ul class="thumbnails">
							<li class="span3"><a href="#" class="thumbnail"> <img
									alt="Apple"
									style="width: 260px; height: 180px;"
									src="<c:url value='/img/applelogo.jpg'/>">
							</a></li>
							<li class="span3"><a href="#" class="thumbnail"> <img
									alt="Linux"
									style="width: 260px; height: 180px;"
									src="<c:url value='/img/linuxlogo.jpg'/>">
							</a></li>
							<li class="span3"><a href="#" class="thumbnail"> <img
									alt="Windows"
									style="width: 260px; height: 180px;"
									src="<c:url value='/img/windowslogo.jpg'/>">
							</a></li>
						</ul>
					</div>
				</div>
			</div>

		</section>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>