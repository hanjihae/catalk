<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>마이페이지 - CATALK</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" type="text/css" href="/css/styles.css"/>
    </head>
    <body>
        <div class="status-bar status-bar__profile">
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

        <header class="my-page__header">
            <div class="my-page__wallpaper">
                <div class="my-page__my-profile">
                    <img src="/img/haeil1.jpeg" class="my-page__avatar" />
                    <div class="my-page__text">
                        <h2 class="my-page__title">해일이</h2>
                        <h4 class="my-page__subtitle">해일이의 마이페이지이자 블로그입니다 어솨세용</h4>
                    </div>
                </div>
                <i class="fas fa-cog fa-lg"></i>
            </div>
        </header>

        <div class="main-screen">
            <div class="my-page__category">
                <ul>
                    <li>일기</li>
                    <li>지옥도거부할인간데스노트</li>
                </ul>
            </div>
            <div class="my-page__board">
                <div class="my-page__board-list">
                    <ul>
                        <li>게시글1</li>
                        <li>게시글2</li>
                        <!-- 페이징-->
                    </ul>
                </div>
                <div class="my-page__board-component">
                    <h1 class="my-page__board-title">게시글 제목</h1>
                    <h3 class="my-page__board-text">게시글 내용</h3>
                    <div class="my-page__board-comment">
                        <span class="my-page__board-comment__number">댓글 2</span>
                        <div class="my-page__board-comment-input">
                            <input type="text" placeholder="댓글을 입력하세요..." />
                            <button>등록</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <nav class="nav">
            <ul class="nav__list">
                <li class="nav__btn"><a class="nav__link" href="#"><i class="fas fa-user fa-2x"></i></a></li>
                <li class="nav__btn">
                    <a class="nav__link" href="#">
                        <!-- new message 세자리수 되면 동그라미 넘침 해결필요함 -->
                        <span class="nav__notification badge">3</span>
                        <i class="fas fa-comment fa-2x"></i>
                    </a>
                </li>
                <li class="nav__btn"><a class="nav__link" href="#"><img src="/img/haeil2.jpeg" /></a></li>
            </ul>
        </nav>

        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
    </body>
</html>
