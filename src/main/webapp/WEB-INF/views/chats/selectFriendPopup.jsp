<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>대화상대 초대 - CATALK</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" type="text/css" href="/css/styles.css"/>
    </head>
    <body>
    <header class="screen-header">
            <div>
                <div class="screen-header__catalk">
                    <i class="fas fa-arrow-left fa-lg select-friend__back" style="font-size: 39px;"></i>
                </div>
                <h1 class="screen-header__title">대화상대 초대</h1>
            </div>
            <div class="screen-header__icons">
                <span class="select-friend__ok">확인</span>
            </div>
        </header>
        <div class="search-container">
            <div class="search-wrapper">
                <input type="text" id="searchInput" placeholder="이름으로 검색" onInput="searchInput();" style="display: block;">
                <span class="search-icon" style="display: inline-block;"><i class="fas fa-search"></i></span>
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
            <div class="user-component">
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

        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
        <script src="script.js"></script>
        <script>

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

            // 체크박스 하나만 선택
            var checkboxes = document.querySelectorAll('.user-component__column-checkbox');

            checkboxes.forEach(function(checkbox) {
                checkbox.addEventListener('click', function() {
                    checkboxes.forEach(function(cb) {
                        if (cb !== checkbox) {
                            cb.checked = false;
                        }
                    });
                });
            });

        </script>
    </body>
</html>
