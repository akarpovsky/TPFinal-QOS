<div class="row-fluid alert alert-error span8 offset0.5" style="background: #E6E6E6;">
	<div class="span4 comment-date" >
		<a href="<c:url value='/bin/user/profile?nickname=${comment.owner.nickname}'/>">${comment.owner.firstName} ${comment.owner.lastName}</a> dijo:
	</div>
	<div class="span4 comment-data">${comment.data}</div>
	<div class="span3 comment-date">(${comment.date.dayOfMonth}/${comment.date.monthOfYear}/${comment.date.year}  -  ${comment.date.hourOfDay}:${comment.date.minuteOfHour})</div>
	<!-- Solo pueden borrar comments el duenio del comment y el duenio del muro -->
	<c:if test="${comment.owner eq currUser || user eq currUser}">
		<form:form action="../publication/deleteComment" method="POST" commandName="commentDeletionForm">
	           <div class=errors-container>
	               <form:errors path="*" />
	           </div> 
	           <form:input type="hidden" path="profilesUser" value="${user}"/>
	           <form:input type="hidden" path="publication" value="${publication.id}"/>
	           <form:input type="hidden" path="comment" value="${comment.id}"/>
	           <button type="submit" class="btn btn-mini btn-dange" style="float:right" value=""><i class="icon-trash"></i></button>
	    </form:form> 
	</c:if>
</div>