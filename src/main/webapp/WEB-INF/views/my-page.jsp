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
        <header class="my-page__header">
            <div class="my-page__wallpaper">
                <div class="my-page__my-profile">
                    <img src="/img/haeil1.jpeg" class="my-page__avatar" />
                    <div class="my-page__text">
                        <h2 class="my-page__title">해일이</h2>
                        <h4 class="my-page__subtitle">해일이의 마이페이지이자 블로그입니다 어솨세용</h4>
                    </div>
                </div>
                <div class="my-page__header-icons">
                    <i class="fas fa-edit fa-lg"></i>
                    <i class="fas fa-cog fa-lg"></i>
                </div>
                <button>글쓰기</button>
            </div>
        </header>

        <div class="my-page-screen">
            <div class="my-page__category">
                <ul class="my-page__category-ul">
                    <h2 class="my-page__category__title">Category</h2>
                    <li class="my-page__category__subtitle">일기</li>
                    <ul class="my-page__category-sub">
                        <li class="my-page__category-sub__title">적용 안되면 빼고 되면 넣고 서브카테고리일상일기냐</li>
                        <li class="my-page__category-sub__title">개발일기</li>
                    </ul>
                    <li class="my-page__category__subtitle">지옥도거부할인간데스노트</li>
                </ul>
            </div>
            <div class="my-page__board">
                <div class="my-page__board-list">
                    <ul>
                        <div class="my-page__board-category">
                            <span class="my-page__board-categroy__name">개발일기 2개의 글</span>
                            <span class="my-page__board-categroy__oc">목록 닫기</span>
                            <!-- 목록 열고 닫고 기능 넣기!! 닫히면 목록 열기로 바뀜-->
                        </div>
                        <li class="my-page__board-list__title-fixed">
                            <span class="my-page__board-list__name">글 제목</span>
                            <div class="my-page__board-list__cd">
                                <span class="my-page__board-list__cnt">조회수</span>
                                <span class="my-page__board-list__date">작성일</span>
                            </div>
                        </li>
                        <li class="my-page__board-list__title">
                            <span class="my-page__board-list__name">게시글제목</span>
                            <div class="my-page__board-list__cd">
                                <span class="my-page__board-list__cnt">2</span>
                                <span class="my-page__board-list__date">2024.01.27.</span>
                            </div>
                        </li>
                        <li class="my-page__board-list__title">
                            <span class="my-page__board-list__name">게시글제목2222</span>
                            <div class="my-page__board-list__cd">
                                <span class="my-page__board-list__cnt">22</span>
                                <span class="my-page__board-list__date">2024.01.27.</span>
                            </div>
                        </li>
                    </ul>
                    <div class="my-page__board-list__paging">
                        <i class="fas fa-angle-double-left"></i>
                        <i class="fas fa-angle-left"></i>
                        <span>1</span>
                        <span>2</span>
                        <span>3</span>
                        <i class="fas fa-angle-right"></i>
                        <i class="fas fa-angle-double-right"></i>
                    </div>
                </div>
                <div class="my-page__board-component">
                    <div class="my-page__board-component__category">
                        <span>개발일기</span>
                        <span>2024.01.28.</span>
                    </div>
                    <h1 class="my-page__board-title">나는 오늘도 플젝을 한다... 느낀점: 디자이너는 괜히 있는 게 아니다</h1>
                    <h3 class="my-page__board-text">
                        kingdom come Baby we're GA-GA-GA-GA-GA-GODS Yeah we're GA-GA-GA-GA-GA-GODS Welcome to th
                    </h3>
                    <div class="my-page__board-btns">
                        <div class="my-page__board-comment__number">댓글 2</div>
                        <div class="my-page__board-ed">
                            <button>수정</button>
                            <button>삭제</button>
                        </div>
                    </div>
                    <div class="my-page__board-comment">
                        <div class="my-page__board-comment-written">
                            <img src="/img/haeil1.jpeg" class="my-page__board-comment__avatar"/>
                            <div class="my-page__board-comment-written__component">
                                <span class="my-page__board-comment-written__component-name">놀러옴</span>
                                <span class="my-page__board-comment-written__component-text">블로그 귀엽네여~</span>
                            </div>
                        </div>
                        <div class="my-page__board-comment-input">
                            <img src="/img/haeil1.jpeg" class="my-page__board-comment__avatar "/>
                            <div class="my-page__board-comment-written__component my-page__board-comment-input__component">
                                <span class="my-page__board-comment-written__component-name">놀러옴</span>
                                <div class="my-page__board-comment-written__component-input">
                                    <input type="text" placeholder="댓글을 입력하세요..." />
                                    <button>등록</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="my-page__board-component">
                    <div class="my-page__board-component__category">
                        <span>개발일기</span>
                        <span>2024.01.28.</span>
                    </div>
                    <h1 class="my-page__board-title">22나는 오늘도 플젝을 한다... 느낀점: 디자이너는 괜히 있는 게 아니다</h1>
                    <h3 class="my-page__board-text">
                        Yeah we're GA-GA-GA-GA-GA-GODS Welcome to th
                    </h3>
                    <div class="my-page__board-btns">
                        <div class="my-page__board-comment__number">댓글 2</div>
                        <div class="my-page__board-ed">
                            <button>수정</button>
                            <button>삭제</button>
                        </div>
                    </div>
                    <div class="my-page__board-comment">
                        <div class="my-page__board-comment-written">
                            <img src="/img/haeil1.jpeg" class="my-page__board-comment__avatar"/>
                            <div class="my-page__board-comment-written__component">
                                <span class="my-page__board-comment-written__component-name">놀러옴</span>
                                <span class="my-page__board-comment-written__component-text">블로그 귀엽네여~</span>
                            </div>
                        </div>
                        <div class="my-page__board-comment-input">
                            <img src="/img/haeil1.jpeg" class="my-page__board-comment__avatar "/>
                            <div class="my-page__board-comment-written__component my-page__board-comment-input__component">
                                <span class="my-page__board-comment-written__component-name">놀러옴</span>
                                <div class="my-page__board-comment-written__component-input">
                                    <input type="text" placeholder="댓글을 입력하세요..." />
                                    <button>등록</button>
                                </div>
                            </div>
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
        <script>
            // 페이징 버튼 클릭시 색상 변환
            document.addEventListener("DOMContentLoaded", function () {
                var pagingElements = document.querySelectorAll(".my-page__board-list__paging span, .my-page__board-list__paging i");

                pagingElements.forEach(function (element) {
                    element.addEventListener("click", function () {
                        // 클릭 시 색상 변경
                        this.style.color = "var(--yellow)";

                        // 일정 시간 후에 원래 색상으로 복원
                        setTimeout(function () {
                            element.style.color = ""; // 빈 문자열로 설정하여 원래 색상으로 복원
                        }, 500); // 500 밀리초 후에 실행 (조절 가능)
                    });
                });
            });

            // 카테고리 삭제 혹은 추가에 따른 리사이징
            document.addEventListener("DOMContentLoaded", function () {
                adjustCategoryHeight();

                window.addEventListener("resize", function () {
                    adjustCategoryHeight();
                });

                function adjustCategoryHeight() {
                    var category = document.querySelector(".my-page__category");
                    var categoryContent = category.querySelector(".my-page__category-ul");
                    var paddingTop = parseInt(window.getComputedStyle(categoryContent).paddingTop, 10);
                    var paddingBottom = parseInt(window.getComputedStyle(categoryContent).paddingBottom, 10);
                    var minHeight = 0;

                    var categoryHeight = categoryContent.clientHeight + paddingTop + paddingBottom;
                    var newHeight = Math.max(minHeight, categoryHeight);

                    category.style.height = newHeight + "px";
                }
            });


        </script>

    </body>
</html>
