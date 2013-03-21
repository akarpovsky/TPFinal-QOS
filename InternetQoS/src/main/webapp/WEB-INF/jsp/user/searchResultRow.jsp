		<div class="profile_pic_container span1">
			<div class="profile_pic">
				<img alt="${searchEntry.key.firstName} ${searchEntry.key.lastName}" src="../account/getProfilePicture?nickname=${searchEntry.key.nickname}"/>
			</div>
			<c:if test="${searchEntry.value == 'FRIENDS'}"><span class="label label-info">Amigos</span></c:if>
		</div>
		<div class="span11">
			<a href="../user/profile?nickname=${searchEntry.key.nickname}">
				<h4 style="margin: 0px;">${searchEntry.key.firstName} ${searchEntry.key.lastName}</h4>
			</a>
			<h5 class="userfriendNickname">${searchEntry.key.nickname}</h5>

			<c:choose>
				<c:when test="${searchEntry.value == 'MYSELF'}">
					<span style="breadcrumb">
						<a href="<c:url value='/bin/account/edit'/>" class="btn btn-primary btn-mini">
						<i class="icon-wrench icon-white"></i> Editar perfil</a>
					</span>
				</c:when>
				<c:when test="${searchEntry.value == 'FRIENDS'}">
					<span style="breadcrumb">
						<strong>Email:</strong> ${searchEntry.key.email}<br/>
						<strong>Cumplea&ntilde;os:</strong> 
						${searchEntry.key.birthdate.dayOfMonth}/${searchEntry.key.birthdate.monthOfYear}/${searchEntry.key.birthdate.year}
						<br/>
					</span>
				</c:when>
				<c:when test="${searchEntry.value == 'NOT_FRIENDS'}">
					<span style="breadcrumb">
						<a href="../friend/add?nickname=${searchEntry.key.nickname}" class="btn btn-primary btn-mini">
							<i class="icon-user icon-white"></i> Agregar como amigo
						</a>
					</span>
				</c:when>
				<c:when test="${searchEntry.value == 'FRIENDSHIP_REQUEST_PENDING'}">
					<span style="breadcrumb">
						<span class="label label-info">Solicitud de amistad enviada</span>
					</span>
				</c:when>
				<c:when test="${searchEntry.value == 'REVERSE_FRIENDSHIP_REQUEST_PENDING'}">
					<span style="breadcrumb">
						<span class="label label-info">Esperando respuesta de solicitud</span>
					</span>
				</c:when>
			</c:choose>
		</div>
