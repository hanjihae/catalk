<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>채팅방 - CATALK</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" type="text/css" href="/css/styles.css"/>
    </head>
    <body class="chat-body">
        <header class="screen-header screen-header__chat">
            <div class="screen-header__chat-title">
                <i class="fas fa-arrow-left fa-2x"></i>
                <img src="/img/haeil1.jpeg" class="screen-header__chat-img" />
                <h1 class="screen-header__title">${chatName}</h1>
            </div>
            <div class="screen-header__icons">
                <span><i class="fas fa-search fa-lg"></i></span>
                <span><i class="fas fa-bars fa-lg"></i></span>
            </div>
        </header>
        <div class="notice-bar">
            <div class="notice-bar__horn">
                <i class="fas fa-bullhorn"></i>
                <span>공지사항이니라 펴면 작성자와 다시열지않음/접어두기가 나와야하느니라</span>
            </div>
            <i class="fas fa-chevron-down"></i>
        </div>
        <main class="chat-screen">
            <c:forEach var="chat" items="${chatList}" varStatus="loop">
                <c:if test="${loop.index == 0 || !chat.chatDate.equals(chatList[loop.index - 1].chatDate)}">
                    <div class="date-line">
                        <time datetime="${chat.chatDate}">${chat.chatDate}</time>
                    </div>
                </c:if>
                <div class="wrap">
                    <c:choose>
                        <c:when test="${!chat.chatName.equals(loginUser.userName)}">
                            <div class="chat friend-chat">
                                <div><img src="/img/haeil1.jpeg" class="chat__avatar" /></div>
                                <div class="chat-text">
                                    <span class="chat-text__name">${chat.chatName}</span>
                                    <span class="chat-text__textbox">${chat.chatContent}</span>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="chat my-chat">
                                <div class="chat-text-me">
                                    <span class="chat-text__textbox-me">${chat.chatContent}</span>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:forEach>
            <div class="insert-content">
                <form name="chatform" action="sendChat" method="post">
                    <input type="hidden" name="chatNum" value="${chatNum}">
                    <input type="hidden" name="chatName" value="${chatName}">
                    <textarea name="chatContent" required></textarea>
                    <input type="submit" class="chat-submit" value="전송">
                </form>
                <!-- 채팅 입력 관련 기능(파일 첨부, 캡쳐 등) -->
                <div class="insert-menu">
                    <i class="far fa-smile"></i>
                    <i class="fas fa-paperclip"></i>
                    <i class="fas fa-phone-alt"></i>
                    <i class="far fa-calendar"></i>
                    <i class="fas fa-camera"></i>
                </div>
            </div>
        </main>

        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
    </body>
</html>