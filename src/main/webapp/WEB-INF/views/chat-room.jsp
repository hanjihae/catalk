<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>채팅방 - CATALK</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" type="text/css" href="/css/styles.css"/>
    </head>
    <body class="chat-body">
        <header class="screen-header screen-header__chat">
            <div class="screen-header__chat-title">
                <i class="fas fa-arrow-left fa-2x"></i>
                <img src="/img/haeil1.jpeg" class="screen-header__chat-img" />
                <h1 class="screen-header__title">해일2</h1>
            </div>
            <div class="screen-header__icons">
                <span><i class="fas fa-search fa-lg"></i></span>
                <span><i class="fas fa-bars fa-lg"></i></span>
            </div>
        </header>
        <div class="notice-bar">
            <div class="notice-bar__horn">
                <i class="fas fa-bullhorn"></i>
                <span>공지사항이니라 펴면 작성자와 다시열지않음/접어두기가 나와야하느니라</span>
            </div>
            <i class="fas fa-chevron-down"></i>
        </div>
        <main class="chat-screen">
            <div class="date-line">
                <time datetime="2021-03-29">2024년 1월 15일 월요일</time>
            </div>
            <div class="wrap">
                <div class="chat friend-chat">
                    <div><img src="/img/haeil1.jpeg" class="chat__avatar"/></div>
                    <div class="chat-text">
                        <span class="chat-text__name">해일2</span>
                        <span class="chat-text__textbox">안녕하세요. 반갑습니다.</span>
                        <span class="chat-text__textbox">프로젝트 캣톡입니다~~알아 넌 나보다 흘러나오는 이 노래를 듣겠지 이렇게 날 듣겠지 어쩌면 너무 늦었겠지만 어쩌면 너무 늦었겠지만 말도안돼 자신 없단 말은 하지마 어떡해</span>
                    </div>
                </div>
                <div class="chat my-chat">
                    <div class="chat-text-me">
                        <span class="chat-text__textbox-me">안녕하세요. 그동안 잘 지내셨어요?</span>
                    </div>
                </div>
                <div class="chat friend-chat">
                    <div><img src="/img/haeil1.jpeg" class="chat__avatar" /></div>
                    <div class="chat-text">
                        <span class="chat-text__name">해일2</span>
                        <span class="chat-text__textbox">어휴 손시려워 죽겠어요ㅠㅠ</span>
                    </div>
                </div>
                <div class="chat my-chat">
                    <div class="chat-text-me">
                        <span class="chat-text__textbox-me">왜 벌써 2024년인지 모르겠어요~~~</span>
                        <span class="chat-text__textbox-me">위에 거 글자수에 맞게 크기 줄어들었음 좋겠는데 왜 아깐 되고 지금은 안되냔 말이냐~이 말만 벌써 오백번 한 것 같아요. 진짜 테스트용으로 쓸말 더럽게 없다. 길면 텍스트가 이렇게 됩니다. </span>
                    </div>
                </div>
            </div>
            <div class="insert-content">
                <form name="chatform" action="#" method="post">
                    <textarea name="chat-insert" required></textarea>
                    <input type="submit" class="chat-submit" value="전송">
                </form>
                <!-- 채팅 입력 관련 기능(파일 첨부, 캡쳐 등) -->
                <div class="insert-menu">
                    <i class="far fa-smile"></i>
                    <i class="fas fa-paperclip"></i>
                    <i class="fas fa-phone-alt"></i>
                    <i class="far fa-calendar"></i>
                    <i class="fas fa-camera"></i>
                </div>
            </div>
        </main>

        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
    </body>
</html>
