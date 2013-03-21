<html>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<body>

	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<div class="container"></div>

	<div class="hero-unit" style="z-index: 1; position: relative;">
		<div class="row-fluid" style="margin-bottom: 8px;">
			<div class="span3">
				<div style="text-align: center;">
					<img src="<c:url value='/img/pawbook_logo.png'/>" class="img-rounded" style="height: 60px;">
				</div>
				<div class="event_pic_container">
					<img src="<c:url value='/img/birthday-default.jpg'/>" class="img-circle" style="margin-top:10px;height: 230px;">
				</div>
				<div style="margin-left: 0;" class="user-actions-container breadcrumb">
					<div class="user-actions clearfix">
						<c:choose>
							<c:when test="${currUser.daysAheadToShowBDays == 0}">
								<span class="label label-warning">Alertas de cumplea&ntilde;os desactivadas</span>
							</c:when>
							<c:otherwise>
								<span>Actualmente mostrando cumplea&ntilde;os para los pr&oacute;ximos <strong><c:out value="${currUser.daysAheadToShowBDays}" /></strong> d&iacute;as</span>
							</c:otherwise>
						</c:choose>
						<br /><br />
						<form:form method="POST" commandName="birthdayConfigForm">
							<form:errors path="*" cssClass="label label-important"/>
							<select name="daysAhead">
								<c:forEach var="number" items="${daysAheadList}">
									<c:choose>
										<c:when test="${currUser.daysAheadToShowBDays == number}">
											<c:if test="${number == 0 }">
												<option selected value="${number}" >Desactivado</option>
											</c:if>
											<c:if test="${number != 0 }">
												<option selected value="${number}" >${number}</option>
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${number == 0 }">
												<option value="${number}" >Desactivado</option>
											</c:if>
											<c:if test="${number != 0 }">
												<option value="${number}" >${number}</option>
											</c:if>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
							<button type="submit" class="btn btn-primary">Cambiar</button>
						</form:form>
					</div>
				</div>

			</div>
			<div class="span9">
				<div class="row-fluid">
					<span class="span12" style="margin-bottom: 5px;">
					</span> <br /> <span style="margin-left: 0;" class="span12 breadcrumb">
						<h4>Pr&oacute;ximos cumplea&ntilde;os</h4>
						<c:choose>
							<c:when test="${empty birthdays}">
								<span class="label label-important">No hay cumplea&ntilde;os pronto!</span>
							</c:when>
							<c:otherwise>
								<c:set var="itNum" value="0" />	
								<c:forEach var="birthday" items="${birthdays}">
									<%@ include file="birthdayRow.jsp"%>
									<c:set var="itNum" value="${itNum +1 }" />
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</span>

				</div>
			</div>
		</div>
	</div>


	<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>