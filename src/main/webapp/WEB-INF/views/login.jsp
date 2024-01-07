<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>로그인 - Welcome to CATALK</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="/css/styles.css" />
        <script>

        </script>
    </head>
    <body class="height-100vh">
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
        <header class="welcome-header">
            <img src="/img/logo.png" class="welcome-header__logo" />
            <h1 class="welcome-header__title">Welcome to CATALK</h1>
            <p class="welcome-header__text">캣톡 계정으로 로그인하라옹</p>
        </header>
        <form id="login-form" method="post">
            <input type="text" placeholder="아이디" name="userId" />
            <input type="password" placeholder="비밀번호" name="userPw" />
            <input type="submit" value="로그인" formaction="/user/doLogin"  />
            <input type="submit"  value="회원가입" formaction="/user/showSignUp" />
            <a href="#">아이디/비밀번호 찾기</a>
        </form>
        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
    </body>
</html>
