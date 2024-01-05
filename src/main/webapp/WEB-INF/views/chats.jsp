<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Chats - CATALK</title>
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
            <h1 class="screen-header__title">Chats</h1>
            <div class="screen-header__icons">
                <span><i class="fas fa-search fa-lg"></i></span>
                <span><i class="fas fa-comments fa-lg"></i></span>
                <span><i class="fas fa-cog fa-lg"></i></span>
            </div>
        </header>

        <main class="main-screen">
            <div class="user-component">
                <div class="user-component__column">
                    <img src="/img/haeil2.jpeg" class="user-component__avatar"/>
                    <div class="user-component__text">
                        <h4 class="user-component__title user-component__title--not-bold">Monkey</h4>
                        <h6 class="user-component__subtitle">please check your message.</h6>
                    </div>
                </div>
                <div class="user-component__column">
                    <span class="user-component__time">16:30</span>
                    <div class="badge">1</div>
                </div>
            </div>
            <div class="user-component">
                <div class="user-component__column">
                    <img src="/img/haeil1.jpeg" class="user-component__avatar"/>
                    <div class="user-component__text">
                        <h4 class="user-component__title user-component__title--not-bold">Kitty</h4>
                        <h6 class="user-component__subtitle">이모티콘 엑박뜰 것 같다...</h6>
                    </div>
                </div>
                <div class="user-component__column">
                    <span class="user-component__time">16:30</span>
                    <div class="badge">1</div>
                </div>
            </div>
        </main>

        <nav class="nav">
            <ul class="nav__list">
                <li class="nav__btn"><a class="nav__link" href="#"><i class="far fa-user fa-2x"></i></i></a></li>
                <li class="nav__btn">
                    <a class="nav__link" href="#">
                        <!-- new message -->
                        <span class="nav__notification">1</span>
                        <i class="fas fa-comment fa-2x"></i>
                    </a>
                </li>
                <li class="nav__btn"><a class="nav__link" href="#"><i class="fas fa-paw fa-2x"></i></a></li>
            </ul>
        </nav>

        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
    </body>
</html>
