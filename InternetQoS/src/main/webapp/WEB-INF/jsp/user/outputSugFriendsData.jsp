<%-- <c:if test="${ (itsMyProfile eq true) || (areFriends eq true)}"> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:forEach var="sugFriendEntry" items="${sugFriendshipStatusMap}">
	<div class="span12 userResultContainer"
		style="margin-left:0px;<c:if test='${itNum % 2 == 0}'>background: #E6E6E6;</c:if>">
		<%@ include file="/WEB-INF/jsp/user/suggestedFriendsRow.jsp"%>
	</div>
	<c:set var="itNum" value="${itNum +1 }" />
</c:forEach>