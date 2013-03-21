<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<c:if test="${itsMyProfile}">
	<script type="text/javascript">
		$(document).ready(function() {
			var baseUrl = "/" + location.pathname.split('/')[1] + "/" ;
			$("#birthdayModal").hide();
			$.get(baseUrl + 'bin/user/numberOfUpcomingBirthdays', function(data){ 
			     //If data has results (it's not 0)
			     if(data == 1) {
			    	 $("#birthdayModal").html('<p>Tiene <strong>'+ data +'</strong> amigo que cumple a&ntilde;os pronto!</p>');
			    	 $("#birthdayModal").show();
			     }else if(data > 1){
			    	 $("#birthdayModal").html('<p>Tiene <strong>'+ data +'</strong> amigos que cumplen a&ntilde;os pronto!</p>');
			    	 $("#birthdayModal").show();
			     }else{
			    	 $("#birthdayModal").hide();
			     }
			});
		});
	</script>
</c:if>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container"></div>
	<div class="hero-unit" style="z-index: 1; position: relative;">
		<div class="row-fluid" style="margin-bottom: 8px;">
			<div class="span3">
				<div style="text-align: center;">
					<img src="<c:url value='/img/pawbook_logo.png'/>" class="img-rounded" style="height: 60px;">
				</div>
				<div class="profile_pic_container">
					<img alt="${user.firstName} ${user.lastName}" class="profile_image img-circle"
						src="../account/getProfilePicture?nickname=${user.nickname}" />
				</div>
				<div style="margin-left: 0;" class="user-actions-container breadcrumb">
					<div class="user-actions clearfix">	
							<div id="birthdayModal"></div>
							<a href="./birthdays"><button type="submit" class="btn btn-primary">Pr&oacute;ximos cumplea&ntilde;os</button></a>
					</div>
				</div>
				<c:if test="${isLogged && !itsMyProfile}">
					<div style="margin-left: 0;" class="user-actions-container breadcrumb">
						<div class="user-actions clearfix">
							<c:choose>
								<c:when test="${areFriends}">
									<span class="label label-info">Usted es amigo de esta persona</span>
								</c:when>
								<c:otherwise>
									<c:if test="${!pending}">
										<%@ include file="/WEB-INF/jsp/user/addFriendButton.jsp"%>
									</c:if>
									<c:if test="${pending}">
										<span class="label label-info">Esperando respuesta de solicitud</span>
									</c:if>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:if>
			</div>
			<div class="span9">
				<div class="row-fluid">
					<span class="span12" style="margin-bottom: 5px;">
						<h3>${user.firstName} ${user.lastName}</h3>
					</span> <br /> 
					<c:if test="${itsMyProfile || areFriends}">
						<span style="margin-left: 0;" class="span12 breadcrumb">
							<form:form method="POST" action="../publication/add" commandName="publicationForm"  _lpchecked="1" >
								<div class="errors-container">
									<form:errors path="*"/>
								</div>
								<c:choose>
									<c:when test="${itsMyProfile}">
										<form:input type="text" path="publicationData" class="search-query publicationInput span8" placeholder="Que estas pensando?" value="${publicationData}" rows="3" />
									</c:when>
									<c:when test="${areFriends}">
										<form:input type="text" path="publicationData" class="search-query publicationInput span8" placeholder="Comparte algo a tu amigo!" value="${publicationData}" rows="3" />
									</c:when>
								</c:choose>
								<form:input type="hidden" path="userNickname" value="${user.nickname}"/>
							</form:form>
						</span>
						<br />
					</c:if>
					 <span style="margin-left: 0;" class="span12 breadcrumb">
						<strong>Amigos: </strong> <span class="label label-info">${fn:length(friendshipStatusMap)} </span>
					</span>
					<c:if test="${itsMyProfile || areFriends}">  
						<span style="margin-left: 0;" class="span12 breadcrumb"> <strong>Email:</strong>
							${user.email} <br /> <strong>Cumplea&ntilde;os: </strong>
							${user.birthdate.dayOfMonth}/${user.birthdate.monthOfYear}/${user.birthdate.year} <br />
						</span>
						<div style="margin-left: 0;" class="span12 breadcrumb">
							<h3>Publicaciones:</h3>
							<div class="publications-container clearfix">
								<c:choose>
									<c:when test="${empty publications}">
										<span class="label label-important">El usuario
											a&uacute;n no tiene publicaciones</span>
									</c:when>
									<c:otherwise>
										<div class="row-fluid">
											<c:forEach var="publication" items="${publications}">
												<%@ include file="/WEB-INF/jsp/user/publicationRow.jsp"%>
											</c:forEach>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:if>
					<div style="margin-left: 0;" class="span12 breadcrumb">
						<h3>Amigos:</h3>
						<div class="friends-container clearfix">
							<c:choose>
								<c:when test="${empty friendshipStatusMap}">
									<span class="label label-important">El usuario
										a&uacute;n no tiene amigos</span>
								</c:when>
								<c:otherwise>
										<%@ include file="/WEB-INF/jsp/user/outputFriendsData.jsp"%>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<c:if test="${itsMyProfile eq true}"> 
						<div style="margin-left: 0;" class="span12 breadcrumb">
							<h3>Amigos sugeridos:</h3>
							<div class="friends-container clearfix">
								<c:choose>
									<c:when test="${empty sugFriendshipStatusMap}">
										<span class="label label-important">No hay amigos para
											sugerir</span>
									</c:when>
									<c:otherwise>
										<%@ include file="/WEB-INF/jsp/user/outputSugFriendsData.jsp"%>
									</c:otherwise>
								</c:choose>
							</div>
							
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>