<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>친구 - CATALK</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" type="text/css" href="/css/styles.css"/>
    </head>
    <body>
        <div class="status-bar">
            <div class="status-bar__column">
                <span>No Service</span>
                <i class="fas fa-wifi"></i>

            </div>
            <div class="status-bar__column">
                <span>18:43</span>
            </div>
            <div class="status-bar__column">
                <span>100%</span>
                <i class="fas fa-battery-full fa-lg"></i>
                <i class="fas fa-bolt"></i>
            </div>
        </div>

        <header class="screen-header">
            <div>
                <div class="screen-header__catalk">
                    <img src="/img/logo.png" class="screen-header__logo" />
                    <h1 class="screen-header__catalk-title">CATALK</h1>
                </div>
                <h1 class="screen-header__title">친구</h1>
            </div>
            <div class="screen-header__icons">
                <span class="friend-search"><i class="fas fa-search fa-lg"></i></span>
                <span><i class="fas fa-user-plus fa-lg"></i></span>
                <span><i class="fas fa-cog fa-lg"></i></span>
            </div>
        </header>
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="이름으로 검색">
        </div>
        <div id="searchResults">
            <div class="user-component__column">
                <img src="/img/haeil2.jpeg" class="user-component__avatar"/>
                <div class="user-component__text">
                    <h4 class="user-component__title user-component__title--not-bold">Monkey</h4>
                    <h6 class="user-component__subtitle">catalk account2</h6>
                </div>
            </div>
        </div>
        <main class="friends-screen">
            <div class="user-component">
                <div class="user-component__column">
                    <img src="/img/haeil1.jpeg" class="user-component__avatar user-component__avatar--xl"/>
                    <div class="user-component__text">
                        <h4 class="user-component__title">해일</h4>
                        <h6 class="user-component__subtitle">Sorry, try again.</h6>
                    </div>
                </div>
                <div class="user-component__column"></div>
            </div>
            <div class="friends-screen__friends">
                <div class="friends-screen__friends-header">
                    <span>친구 106</span>
                    <i class="fas fa-chevron-up fa-xs"></i>
                    <!-- chevron down icon <i class="fas fa-chevron-down fa-xs"></i> -->
                </div>
                <div class="user-component">
                    <div class="user-component__column">
                        <img src="/img/haeil2.jpeg" class="user-component__avatar"/>
                        <div class="user-component__text">
                            <h4 class="user-component__title user-component__title--not-bold">Monkey</h4>
                            <h6 class="user-component__subtitle">catalk account2</h6>
                        </div>
                    </div>
                    <div class="user-component__column">
                        <div>
                            <span class="user-component__column-music">(여자)아이들 - 퀸카(QueenCard)</span>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <nav class="nav">
            <ul class="nav__list">
                <li class="nav__btn"><a class="nav__link" href="#"><i class="fas fa-user fa-2x"></i></a></li>
                <li class="nav__btn">
                    <a class="nav__link" href="#">
                        <!-- new message 세자리수 되면 동그라미 넘침 해결필요함 -->
                        <span class="nav__notification badge">3</span>
                        <i class="far fa-comment fa-2x"></i>
                    </a>
                </li>
                <li class="nav__btn"><a class="nav__link" href="#"><img src="/img/haeil2.jpeg" /></a></li>
            </ul>
        </nav>

        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
        <script src="script.js"></script>
        <script>
            // 클래스명이 'friend-search'인 엘리먼트를 모두 선택
            var friendSearchIcons = document.getElementsByClassName('friend-search');

            // 각각의 아이콘에 대해 이벤트 리스너 추가
            for (var i = 0; i < friendSearchIcons.length; i++) {
                friendSearchIcons[i].addEventListener('click', function() {
                    // friendSearchIcon 클릭 시 검색창을 토글하여 나타나거나 숨김
                    var searchContainer = document.querySelector('.search-container');
                    if (searchContainer.style.display === 'none') {
                        searchContainer.style.display = 'block';
                    } else {
                        searchContainer.style.display = 'none';
                    }
                });
            }

            document.getElementById('searchButton').addEventListener('click', function() {
                var searchTerm = document.getElementById('searchInput').value;
                displaySearchResults(searchTerm);
            });

            function displaySearchResults(searchTerm) {
                var searchResultsContainer = document.getElementById('searchResults');
                var searchResultHTML = '<p>검색 결과: ' + searchTerm + '</p>';
                searchResultsContainer.innerHTML = searchResultHTML;
            }
        </script>
    </body>
</html>
