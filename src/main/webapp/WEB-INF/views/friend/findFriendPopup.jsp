<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>친구 찾기</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="/css/styles.css" />
        <script>


            function findUserData(){
                var findFriendSearch = document.getElementById('findFriendSearch').value;
                location.href="/friend/findFriendPopupList?findFriendSearch="+findFriendSearch;
            }

            function closePopup(){ // 닫기 클릭 시 창 닫기
                window.close();
            }

            function addNewFriend(addFriendNo){
                // 2. fetch로 정보 찾아오기
                fetch("/friend/addNewFriend?newFriendNo="+addFriendNo, {
                  method: "POST",
                  headers: {
                    "Content-Type": "application/json",
                  },
                }).then(response => {
                        if (!response.ok) {
                          throw new Error("Network response was not ok");
                        }
                        return response.text();
                    })
                    .then(data => {
                        window.close();
                        window.opener.location.reload();

                      })
                    .catch(error => {
                      alert("[Error] 다시 시도해주세요");
                    });
            }

        </script>
    </head>
    <body class="friends-screen">
        <header class="welcome-header">
            <img src="/img/logo.png" class="welcome-header__logo" />
            <h1 class="welcome-header__title">Find Your Friends</h1>
            <p class="welcome-header__text">캣톡 친구를 찾아보라옹</p>
        </header>
        <div class="search-container">
            <input type="text" placeholder="친구 이름" id="findFriendSearch" />
            <input class="searchBtn" type="submit" value="친구찾기" onClick="findUserData();" />
            <input class="searchBtn" type="submit" value="닫기" onClick="closePopup();" />
        </div>
        <c:forEach var="userList" items="${userList}">
            <div class="user-component">
                <div class="user-component__column">
                    <img src="/img/smile_cat.png" class="user-component__avatar user-component__avatar--xl"/>
                    <div class="user-component__text">
                        <h4 class="user-component__title">${userList.userName}</h4>
                        <h6 class="user-component__subtitle">${userList.userPhone}</h6>
                    </div>
                </div>
                <div class="user-component__column">
                    <input class="friend-plusBtn" type="submit" value="친구추가" onClick="addNewFriend(${userList.userNum});" />
                </div>
            </div>
        </c:forEach>
        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
    </body>
</html>
