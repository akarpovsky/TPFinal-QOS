
	<div class="profile_pic_container span2">
		<div class="profile_pic"><img alt="${sugFriendEntry.key.firstName} ${sugFriendEntry.key.lastName}" src="../account/getProfilePicture?nickname=${sugFriendEntry.key.nickname}"/></div>
	</div>
	<div class="span6 friendDataContainer">
		<a href="profile?nickname=${sugFriendEntry.key.nickname}"><h4 style="margin: 0px;">${sugFriendEntry.key.firstName} ${sugFriendEntry.key.lastName}</h4></a>
		<h5 class="userfriendNickname">${sugFriendEntry.key.nickname}</h5>
		<c:choose>
			<c:when test="${sugFriendEntry.value == 'NOT_FRIENDS'}">
				<span style="breadcrumb">
					<a href="../friend/add?nickname=${sugFriendEntry.key.nickname}" class="btn btn-primary btn-mini">
						<i class="icon-user icon-white"></i> Agregar como amigo
					</a>
				</span>
			</c:when>
			<c:when test="${sugFriendEntry.value == 'FRIENDSHIP_REQUEST_PENDING'}">
				<span style="breadcrumb">
					<span class="label label-info">Solicitud de amistad enviada</span>
				</span>
			</c:when>
			<c:when test="${sugFriendEntry.value == 'REVERSE_FRIENDSHIP_REQUEST_PENDING'}">
				<span style="breadcrumb">
					<span class="label label-info">Esperando respuesta de solicitud</span>
				</span>
			</c:when>		
		</c:choose>
	</div>
