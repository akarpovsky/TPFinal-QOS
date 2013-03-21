<div class="row-fluid">
	<div class="span2 publication-date" style="margin-left:0px;">
		<span class="label notice">${publication.date.dayOfMonth}/${publication.date.monthOfYear}/${publication.date.year}
			- ${publication.date.hourOfDay}:${publication.date.minuteOfHour}
		</span>
	</div>
	<div class="span10 publication-data">
		${publication.data}
		(
		<c:choose>
			<c:when test="${user eq publication.owner}">
				${publication.owner.firstName}
				${publication.owner.lastName}
			</c:when>
			<c:otherwise>
				<a href="
					<c:url value='/bin/user/profile?nickname=${publication.owner.nickname}' />
					">
					${publication.owner.firstName} ${publication.owner.lastName}
				</a>
			</c:otherwise>
		</c:choose>
		)
	</div>
	<c:set var="pub" value="${publication}" />
	<c:choose>
	
		<c:when test="${sharedPublicationMap[publication]}">
			<div class="span2 publication-actions">
				<form method="POST" action="../publication/share?id=${publication.id}">
					<button type="submit" class="btn btn-info" value="">
						<i class="icon-white icon-thumbs-up"></i>
						Share
					</button>
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<c:if test="${ !(publication.simpleClassName eq 'SharedPublication') && !(publication.owner eq currUser || publication.target eq currUser)}">
				<span class="label label-info">Ya compartido</span>
			</c:if>
		</c:otherwise>
	</c:choose>
	<c:if test="${itsMyProfile}">
		<form method="POST" action="../publication/delete?id=${publication.id}">
			<button type="submit" class="btn btn-mini btn-dange" value="">
				<i class="icon-trash"></i>
			</button>
		</form>
	</c:if>
	<c:if test="${(publication.simpleClassName eq 'SimplePublication') && !(empty publication.sharedByUserSet)}">
		<div class="span12 publication-shares" style="margin-left:0px;">
			<c:forEach var="sharedUser" items="${publication.sharedByUserSet}">
				<span class="publication-shares-user">
					<a
						href="<c:url value='/bin/user/profile?nickname=${sharedUser.nickname}'/>">${sharedUser.firstName} ${sharedUser.lastName}</a>
				</span>
			</c:forEach>
		</div>
		<br />
	</c:if>
	<div class="row-fluid">
		<div class="row-fluid offset0.5"><!-- No borrar este div, esta para alineacion de los comentarios --></div>
		<c:forEach var="comment" items="${publication.comments}">
			<%@ include
			file="/WEB-INF/jsp/user/commentRow.jsp"%>
		</c:forEach>
		<div class="row-fluid alert alert-error span8 offset0.5" style="background: #E6E6E6;">
			<form:form action="../publication/addComment" method="POST"
				commandName="commentCreationForm">
				<div class=errors-container>
					<form:errors path="*" />
				</div>
				<form:input type="text" class="span9" path="comment" />
				<form:input type="hidden" path="postedNickname" value="${user.nickname}" />
				<form:input type="hidden" path="publication" value="${publication.id}" />
				<input type="submit" class="btn btn-info" value="Comentar!" />
			</form:form>
		</div>
	</div>
</div>