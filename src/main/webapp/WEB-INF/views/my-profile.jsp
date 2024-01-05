<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>My Profile - CATALK</title>
        <link rel="stylesheet" type="text/css" href="/css/styles.css"/>
    </head>
    <body>
        <div class="profile-background__img">
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
                <h1 class="screen-header__title"><i class="fas fa-times fa-sm"></i></h1>
                <div class="screen-header__icons">
                    <span><i class="fas fa-cog fa-lg"></i></span>
                </div>
            </header>

            <div class="user-profile">
                <div class="user-profile__list">
                    <img src="/img/haeil1.jpeg" class="user-profile__avatar" />
                    <h4 class="user-profile__title">Haeil</h4>
                    <%-- 친구 프로필에서 친구 이름 편집 아이콘--%>
                    <%-- <i class="fas fa-pen fa-lg"></i>--%>
                    <h6 class="user-profile__subtitle">해일이프로필~~</h6>
                </div>
            </div>

            <nav class="nav-profile">
                <ul class="nav-profile__list">
                    <li class="nav-profile__btn">
                        <a class="nav-profile__link" href="#">
                            <i class="fas fa-comment fa-lg"></i>
                            <h6 class="nav-profile__link-title">1:1채팅</h6>
                        </a>
                    </li>
                    <li class="nav-profile__btn">
                        <a class="nav-profile__link" href="#">
                            <i class="fas fa-pen fa-lg"></i>
                            <h6 class="nav-profile__link-title">프로필 편집</h6>
                        </a>
                    </li>
                    <li class="nav-profile__btn">
                        <a class="nav-profile__link" href="#">
                            <i class="fas fa-blog fa-lg"></i>
                            <h6 class="nav-profile__link-title">마이블로그</h6>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
    </body>
</html>
