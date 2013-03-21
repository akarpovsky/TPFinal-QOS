		<div class="profile_pic_container span2">
			<div class="profile_pic"><img alt="${friendEntry.key.firstName} ${friendEntry.key.lastName}" src="../account/getProfilePicture?nickname=${friendEntry.key.nickname}"/></div>
			<c:if test="${friendEntry.value == 'FRIENDS'}"><span class="label label-info">Amigos</span></c:if>
		</div>
		<div class="span6 friendDataContainer">
			<a href="profile?nickname=${friendEntry.key.nickname}"><h4 style="margin: 0px;">${friendEntry.key.firstName} ${friendEntry.key.lastName}</h4></a>
			<h5 class="userfriendNickname">${friendEntry.key.nickname}</h5>
			<c:choose>
				<c:when test="${isLogged}">
					<c:choose>
						<c:when test="${friendEntry.value == 'MYSELF'}">
							<span style="breadcrumb">
								<a href="<c:url value='/bin/account/edit'/>" class="btn btn-primary btn-mini"><i class="icon-wrench icon-white"></i> Editar perfil</a>
							</span>
						</c:when>
						<c:when test="${friendEntry.value == 'FRIENDS'}">
							<span style="breadcrumb">
								<strong>Email:</strong> ${friendEntry.key.email}<br/>
								<strong>Cumplea&ntilde;os:</strong> ${friendEntry.key.birthdate.dayOfMonth}/${friendEntry.key.birthdate.monthOfYear}/${friendEntry.key.birthdate.year}<br/>
							</span>
						</c:when>
						<c:when test="${friendEntry.value == 'NOT_FRIENDS'}">
							<%@ include file="/WEB-INF/jsp/user/addFriendButton.jsp"%>
						</c:when>
						<c:when test="${friendEntry.value == 'FRIENDSHIP_REQUEST_PENDING'}">
							<span style="breadcrumb">
								<span class="label label-info">Solicitud de amistad enviada</span>
							</span>
						</c:when>
						<c:when test="${friendEntry.value == 'REVERSE_FRIENDSHIP_REQUEST_PENDING'}">
							<span style="breadcrumb">
								<span class="label label-info">Esperando respuesta de solicitud</span>
							</span>
						</c:when>
					</c:choose>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</div>
