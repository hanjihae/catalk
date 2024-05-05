<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>나의 프로필 - CATALK</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" type="text/css" href="/css/styles.css"/>
    </head>
    <body class="profile-background__img">
        <header class="screen-header">
            <h1 class="screen-header__title"><i class="fas fa-times fa-sm"></i></h1>
            <div class="screen-header__icons">
                <span><i class="fas fa-cog fa-lg"></i></span>
            </div>
        </header>

            <div class="user-profile">
                <div class="user-profile__list">
                    <c:choose>
                    	<c:when test="${profile.profileFiles[0].profileMain=='Main'}">
                    		<img src="${filePath}${profile.profileFiles[0].profileFileName}" class="user-profile__avatar" />
                    	</c:when>
                        <c:when test="${profile.profileFiles[1].profileMain=='Main'}">
                            <img src="${filePath}${profile.profileFiles[1].profileFileName}" class="user-profile__avatar" />
                        </c:when>
                        <c:otherwise>
                            <img src="/img/haeil1.jpeg" class="user-profile__avatar" />
                        </c:otherwise>
                    </c:choose>
                    <a class="nav-profile__link" href="#" onclick="document.getElementById('mainFileInput').click(); return false;">
                        <i class="fas fa-pen fa-lg"></i>
                    </a>
                    <input type="file" id="mainFileInput" style="display:none;" onchange="uploadFile(this, 'Main')" />

                    <div class="user-profile__text">
                        <h4 class="user-profile__title">${profile.profileName}</h4>
                        <%-- 친구 프로필에서 친구 이름 편집 아이콘--%>
                        <%-- <i class="fas fa-pen fa-lg"></i>--%>
                        <h6 class="user-profile__subtitle">${profile.profileMessage}</h6>
                    </div>
                </div>
            </div>

            <nav class="nav-profile">
                <ul class="nav-profile__list">
                    <li class="nav-profile__btn">
                        <a class="nav-profile__link" href="#">
                            <i class="fas fa-comment fa-lg"></i>
                            <h6 class="nav-profile__link-title">나와의 채팅</h6>
                        </a>
                    </li>
                    <li class="nav-profile__btn">
                        <a class="nav-profile__link" href="#" onclick="document.getElementById('backFileInput').click(); return false;">
                            <i class="fas fa-pen fa-lg"></i>
                            <h6 class="nav-profile__link-title">프로필 편집</h6>
                        </a>
                        <input type="file" id="backFileInput" style="display:none;" onchange="uploadFile(this, 'Back')" />
                    </li>
                    <li class="nav-profile__btn">
                        <a class="nav-profile__link" href="#">
                            <i class="fas fa-blog fa-lg"></i>
                            <h6 class="nav-profile__link-title">마이블로그</h6>
                        </a>
                    </li>
                </ul>
            </nav>

        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
        <script>
            function uploadFile(input, profileMain) {
                if (input.files && input.files[0]) {
                    var formData = new FormData();
                    formData.append("file", input.files[0]);
                    formData.append("ProfileNum", ${profile.profileNum});
                    formData.append("profileMain", profileMain);

                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "/profile/uploadProfileFile", true);
                    xhr.send(formData);
                }
            }

        </script>
    </body>
</html>
