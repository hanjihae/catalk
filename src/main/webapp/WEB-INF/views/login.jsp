<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to CATALK</title>
        <link rel="stylesheet" type="text/css" href="/css/styles.css" />
        <script>

        </script>
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
        <header class="welcome-header">
            <h1 class="welcome-header__title">Welcome to CATALK</h1>
            <p class="welcome-header__text">If you have a CATALK account, log in with your email or phone number.</p>
        </header>
        <form id="login-form" method="post">
            <input type="text" placeholder="Email or phone number" />
            <input type="password" placeholder="Password" />
            <input type="submit" value="Log In" formaction="/user/logIn"  />
            <input type="submit"  value="Sign Up" formaction="/user/showSignUp" />
            <a href="#">Find CATALK account or Password</a>
        </form>
        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
    </body>
</html>
