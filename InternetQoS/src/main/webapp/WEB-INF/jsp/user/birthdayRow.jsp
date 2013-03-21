<div class="row-fluid span11 event-preview-row" style="<c:if test='${itNum % 2 == 0}'>background: #E6E6E6;</c:if>">
	<div class="row-fluid">
		<div class="span3">
			<strong>Cumplea&ntilde;ero: </strong><br />
		</div>
		<div class="span4">
		<a
			href="<spring:url value='/bin/user/profile?nickname=${birthday.nickname}'/>">${birthday.firstName} ${birthday.lastName}</a>			<br />
		</div>
	</div>

	<div class="row-fluid">
		<div class="span3">
			<strong>Fecha: </strong><br />
		</div>
		<div class="span4">
			<span class="label notice">${birthday.birthdate.dayOfMonth}/${birthday.birthdate.monthOfYear}/${birthday.birthdate.year}</span>
			<br />
		</div>
	</div>
</div>