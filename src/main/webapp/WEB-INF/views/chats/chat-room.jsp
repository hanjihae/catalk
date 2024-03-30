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
            <c:forEach var="message" items="${messageList}" varStatus="loop">
                <c:if test="${loop.index == 0 || !message.formattedDate2.equals(messageList[loop.index - 1].formattedDate2)}">
                    <div class="date-line">
                        <time datetime="${message.messageTime}">${message.formattedDate2}</time>
                    </div>
                </c:if>
                <div class="wrap">
                    <c:choose>
                        <c:when test="${message.userNum ne userNum}">
                            <div class="chat friend-chat">
                                <div><img src="/img/haeil1.jpeg" class="chat__avatar" /></div>
                                <div class="chat-text">
                                    <span class="chat-text__name">${chatName}</span>
                                    <div class="chat-text__textbox-friend">
                                        <span class="chat-text__textbox">${message.messageContent}</span>
                                        <span class="chat-text__textbox-ftime">오후 4:56</span>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="chat my-chat">
                                <div class="chat-text-me">
                                    <div class="chat-text__textbox-mine">
                                        <div class="chat-text__textbox-timeandcheck">
                                            <c:choose>
                                                <c:when test="${message.messageCheck}">
                                                    <span class="chat-text__textbox-checkornot">1</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span type="hidden" class="chat-text__textbox-checkornot"></span>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${loop.index + 1 == messageList.size() || !message.formattedTime.equals(messageList[loop.index + 1].formattedTime)}">
                                                <span class="chat-text__textbox-mtime">${message.formattedTime}</span>
                                            </c:if>
                                        </div>
                                        <span style="display: none" class="message-num">${message.messageNum}</span>
                                        <span class="chat-text__textbox-me">${message.messageContent}</span>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:forEach>
            <div class="insert-content">
                <form name="chatform" action="sendMessage" method="post">
                    <input type="hidden" name="userNum" value="${userNum}">
                    <input type="hidden" name="chatNum" value="${chatNum}">
                    <input type="hidden" name="chatName" value="${chatName}">
                    <textarea name="messageContent" required></textarea>
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
        <script type="text/javascript">

            function adjustInsertContentPosition() {
                var insertContent = document.querySelector('.insert-content');
                var chatScreen = document.querySelector('.chat-screen');

                // 수정 필요함~
                console.log(chatScreen.children.length);
                if (chatScreen.children.length <= 10 ) {
                    insertContent.style.position = 'fixed';
                } else {
                    insertContent.style.position = 'sticky';
                }
            }
            adjustInsertContentPosition();

            document.addEventListener("DOMContentLoaded", function() {
                // 최근 메시지로 스크롤 이동
                function scrollToRecentMessage() {
                    var chatScreen = document.querySelector('.chat-screen');
                    if (chatScreen) {
                        chatScreen.scrollTop = chatScreen.scrollHeight;
                    } else {
                        console.log("채팅방 요소를 찾을 수 없습니다.");
                    }
                }

                // 페이지 로드 후 최근 메시지로 스크롤 이동
                window.addEventListener('load', function() {
                    scrollToRecentMessage();
                });

                // 채팅방에 들어갈 때도 최근 메시지로 스크롤 이동
                // window.addEventListener('hashchange', function() {
                //     scrollToRecentMessage();
                // });

            });

        </script>
    </body>
</html>
