<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>친구 - CATALK</title>
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
                <h1 class="screen-header__title">친구</h1>
            </div>
            <div class="screen-header__icons">
                <span class="friend-search"><i class="fas fa-search fa-lg" onClick="showSearchInput();"></i></span>
                <span><i class="fas fa-user-plus fa-lg" onClick="showFindInput();"></i></span>
                <span><i class="fas fa-cog fa-lg"></i></span>
            </div>
        </header>
        <div class="search-container">
            <div class="search-wrapper">
                <input type="text" id="searchInput" placeholder="이름으로 검색" onInput="searchInput();">
                <span class="search-icon"><i class="fas fa-search"></i></span>
            </div>
            </div>
        <div id="searchResults">
            <div class="user-component__column">
                <img src="/img/smile_cat.png" class="user-component__avatar"/>
                <div class="user-component__text">
                    <h4 class="user-component__title user-component__title--not-bold">Monkey</h4>
                    <h6 class="user-component__subtitle">catalk account2</h6>
                </div>
            </div>
        </div>
        <main class="friends-screen">
            <div class="user-component" onClick="moveToMyProfile(${loginUser.userNum});">
                <div class="user-component__column">
                    <img src="/img/smile_cat.png" class="user-component__avatar user-component__avatar--xl"/>
                    <div class="user-component__text">
                        <h4 class="user-component__title">${loginUser.userName}</h4>
                        <h6 class="user-component__subtitle">${profile.profileMessage}</h6>
                    </div>
                </div>
                <div class="user-component__column"></div>
            </div>
            <div class="friends-screen__friends" id="friend_list_inner">
                <jsp:include page="friend_list_inner.jsp" />
            </div>
        </main>

        <nav class="nav">
            <ul class="nav__list">
                <li class="nav__btn"><a class="nav__link" href="#"><i class="fas fa-user fa-2x"></i></a></li>
                <li class="nav__btn">
                    <a class="nav__link" href="/chats/chat-list?userNum=${loginUser.userNum}">
                        <!-- new message 세자리수 되면 동그라미 넘침 해결필요함 -->
                        <span class="nav__notification badge">3</span>
                        <i class="far fa-comment fa-2x"></i>
                    </a>
                </li>
                <li class="nav__btn"><a class="nav__link" href="#"><img src="/img/smile_cat.png" /></a></li>
            </ul>
        </nav>

        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
        <script src="script.js"></script>
        <script>
            // 클래스명이 'friend-search'인 엘리먼트를 모두 선택
            var friendSearchIcons = document.getElementsByClassName('friend-search');

            function showSearchInput(){
                var friendSearchIcon = document.getElementById('searchInput');
                var realSearchIcon = document.querySelector('.search-icon');
                if (friendSearchIcon.style.display === 'none') {
                    friendSearchIcon.style.display = 'block';
                    realSearchIcon.style.display = 'inline-block';
                } else {
                    friendSearchIcon.style.display = 'none';
                    realSearchIcon.style.display = 'none';
                }
            }



            function showFindInput(){
                var popup = window.open('/friend/findFriendPopup', '친구 찾기', 'width=700px,height=800px,scrollbars=no,resizable=no');
            }


            function searchInput(){ //검색어 입력되면 결과 화면에 보여주기
                var searchVal = document.getElementById('searchInput').value;
                fetch("/friend/friend_list_inner?searchVal=" + searchVal)
                .then(response => {
                    if (!response.ok) {
                        throw new Error("Network response was not ok");
                    }
                    return response.text();
                })
                .then(data => {
                    document.getElementById('friend_list_inner').innerHTML = data;
                })
                .catch(error => {
                    console.error('There has been a problem with your fetch operation:', error);
                });
            }
            function moveToMyProfile(userNum){ // 프로필 창으로 이동
                location.href="/profile/profileMine?userNum="+userNum;
            }

            function moveToProfile(userNum){ // 프로필 창으로 이동
                location.href="/profile/profileMain?userNum="+userNum;
            }

        </script>
    </body>
</html>
