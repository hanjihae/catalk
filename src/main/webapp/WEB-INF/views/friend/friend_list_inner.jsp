<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="friends-screen__friends-header">
    <span id="friendCount">친구 ${friendCount}</span>
    <i class="fas fa-chevron-up fa-xs"></i>
    <!-- chevron down icon <i class="fas fa-chevron-down fa-xs"></i> -->
</div>
<c:if test="${not empty friends}">
    <c:forEach var="friend" items="${friends}" >
    <div class="user-component" onClick="moveToProfile(${friend.friendNum});">
        <div class="user-component__column">
            <img src="/img/smile_cat.png" class="user-component__avatar"/>
            <div class="user-component__text">
                <h4 class="user-component__title user-component__title--not-bold">
                <c:choose>
                    <c:when test="${not empty friend.friendName}">${friend.friendName}</c:when>
                    <c:when test="${not empty friend.profileName}">${friend.profileName}</c:when>
                    <c:otherwise>${friend.userName}</c:otherwise>
                </c:choose>
                </h4>
                <h6 class="user-component__subtitle">${friend.profileMessage}</h6>
            </div>
        </div>
        <div class="user-component__column">
            <!--<div>
                <span class="user-component__column-music">(여자)아이들 - 퀸카(QueenCard)</span>
            </div>-->
        </div>
    </div>
    </c:forEach>
</c:if>
<c:if test="${empty friends}">
    <div class="user-component">
    <p>친구가 없습니다.</p>
    </div>
</c:if>