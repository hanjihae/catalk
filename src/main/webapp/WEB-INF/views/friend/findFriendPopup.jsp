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
                console.log(addFriendNo);
            }

        </script>
    </head>
    <body class="height-100vh">
        <header class="welcome-header">
            <img src="/img/logo.png" class="welcome-header__logo" />
            <h1 class="welcome-header__title">Find Your Friends</h1>
            <p class="welcome-header__text">캣톡 친구를 찾아보라옹</p>
        </header>
            <input type="text" placeholder="친구 이름" id="findFriendSearch" />
            <input type="submit" value="친구 찾기" onClick="findUserData();" />
            <input type="submit" value="닫기" onClick="closePopup();" />
        <table>
        <c:forEach var="userList" items="${userList}">
            <tr>
                <td><img src="/img/smile_cat.png" class="user-component__avatar"/></td>
                <td>${userList.userName}</td>
                <td>${userList.userPhone}</td>
                <td><input type="submit" value="친구추가" onClick="addNewFriend(${userList.userNum});" /></td>
            </tr>
        </c:forEach>
        </table>
        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
    </body>
</html>
