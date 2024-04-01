<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>채팅 - CATALK</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" type="text/css" href="/css/styles.css"/>
    </head>
    <body>
        <header class="screen-header">
            <div>
                <div class="screen-header__catalk">
                    <img src="/img/logo.png" class="screen-header__logo" />
                    <h1 class="screen-header__catalk-title">CATALK</h1>
                </div>
                <h1 class="screen-header__title">채팅</h1>
            </div>
            <div class="screen-header__icons">
                <span><i class="fas fa-search fa-lg"></i></span>
                <span class="create-chat"><i class="fas fa-comments fa-lg"></i></span>
                <span><i class="fas fa-cog fa-lg"></i></span>
            </div>
        </header>
        <main class="main-screen">
            <c:forEach var="chat" items="${chatList}" >
            <div class="user-component" data-no="${chat.chatNum}">
                <div class="user-component__column">
                    <img src="/img/haeil2.jpeg" class="user-component__avatar"/>
                    <div class="user-component__text">
                        <h4 class="user-component__title user-component__title--not-bold">${chat.chatName}</h4>
                <c:forEach var="lastMessage" items="${lastMessages}">
                    <c:if test="${lastMessage.chatNum eq chat.chatNum}">
                        <h6 class="user-component__subtitle">${lastMessage.messageContent}</h6>
                    </div>
                </div>
                <div class="user-component__column">
                    <span class="user-component__time">${lastMessage.formattedDate}</span>
                    <div class="badge">1</div>
                </div>
                    </c:if>
                </c:forEach>
            </div>
            </c:forEach>
        </main>

        <nav class="nav">
            <ul class="nav__list">
                <li class="nav__btn"><a class="nav__link" href="#"><i class="far fa-user fa-2x"></i></i></a></li>
                <li class="nav__btn">
                    <a class="nav__link" href="#">
                        <!-- new message -->
                        <!-- new message 세자리수 되면 동그라미 넘침 해결 필요함-->
                        <span class="nav__notification">1</span>
                        <i class="fas fa-comment fa-2x"></i>
                    </a>
                </li>
                <li class="nav__btn"><a class="nav__link" href="#"><img src="/img/haeil2.jpeg" /></i></a></li>
            </ul>
        </nav>

        <div id="create-chatroom__modal" class="modal">
            <div class="modal-content">
                <i class="fas fa-circle fa-lg close"></i>
                <div class="modal-title">New Chatting</div>
                <div class="modal-buttons">
                    <a id="normalChatBtn" class="modal-button">
                        <i class="far fa-comment fa-lg"></i>
                        <span>일반채팅</span>
                    </a>
                    <a id="teamChatBtn" class="modal-button">
                        <i class="far fa-flag fa-lg"></i>
                        <span>팀채팅</span>
                    </a>
                </div>
            </div>
        </div>

        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
        <script type="text/javascript">
            document.addEventListener('DOMContentLoaded', function () {
                // 채팅방 클릭시 해당 채팅방으로 이동
                var chatRooms = document.querySelectorAll('.user-component');
                var userNum = <%= request.getAttribute("userNum") %>;
                chatRooms.forEach(function (chatRoom) {
                    chatRoom.addEventListener('click', function(event) {
                        event.preventDefault();
                        var chatNum = chatRoom.getAttribute('data-no');
                        var url = 'chat-room?userNum=' + userNum + '&chatNum=' + chatNum;
                        // 새 탭에서 채팅방 열기
                        window.open(url, '_blank');
                    });
                });

                // 채팅방 만들기 - 모달 열기
                var createChatModal = document.getElementById('create-chatroom__modal');
                var createChatBtn = document.querySelector('.create-chat');
                var closeModalSpan = document.querySelector('.close');

                createChatBtn.onclick = function() {
                    createChatModal.style.display = 'block';
                }

                // 채팅방 만들기 - 모달 닫기
                closeModalSpan.onclick = function() {
                    createChatModal.style.display = 'none';
                }

                // 채팅방 만들기 - 모달 바깥 영역 클릭 시 닫기
                window.onclick = function(event) {
                    if (event.target == createChatModal) {
                        createChatModal.style.display = 'none';
                    }
                }

                var normalChat = document.getElementById('normalChatBtn');
                var teamChat = document.getElementById('teamChatBtn');

                normalChat.onclick = function () {
                    window.open('/chats/selectFriendPopup');
                }

                teamChat.onclick = function () {
                    window.open('/chats/selectTeamPopup');
                }
            });
        </script>
    </body>
</html>
