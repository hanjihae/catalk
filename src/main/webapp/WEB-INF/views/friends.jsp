<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Friends - CATALK</title>
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
            <h1 class="screen-header__title">Friends</h1>
            <div class="screen-header__icons">
                <span><i class="fas fa-search fa-lg"></i></span>
                <span><i class="fas fa-user-plus fa-lg"></i></span>
                <span><i class="fas fa-cog fa-lg"></i></span>
            </div>
        </header>
        <a id="friends-display-link">
            <i class="fas fa-info-circle"></i>
            Information For CATALK
            <i class="fas fa-chevron-right fa-xs"></i>
        </a>
        <main class="friends-screen">
            <div class="user-component">
                <div class="user-component__column">
                    <img src="/img/haeil1.jpeg" class="user-component__avatar user-component__avatar--xl"/>
                    <div class="user-component__text">
                        <h4 class="user-component__title">Haeil</h4>
                        <h6 class="user-component__subtitle">Sorry, try again.</h6>
                    </div>
                </div>
                <div class="user-component__column"></div>
            </div>
            <div class="friends-screen__friends">
                <div class="friends-screen__friends-header">
                    <span>Friends 1</span>
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
                    <div class="user-component__column"></div>
                </div>
            </div>
        </main>

        <nav class="nav">
            <ul class="nav__list">
                <li class="nav__btn"><a class="nav__link" href="#"><i class="fas fa-user fa-2x"></i></a></li>
                <li class="nav__btn">
                    <a class="nav__link" href="#">
                        <!-- new message -->
                        <span class="nav__notification">1</span>
                        <i class="far fa-comment fa-2x"></i>
                    </a>
                </li>
                <li class="nav__btn"><a class="nav__link" href="#"><i class="fas fa-paw fa-2x"></i></a></li>
            </ul>
        </nav>

        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
    </body>
</html>
