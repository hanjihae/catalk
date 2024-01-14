<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>아이디/비밀번호 찾기</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="/css/styles.css" />
        <script>
            var findId = true;
            function changeIdPasswd(){ // 아이디<>비밀번호 찾기 화면 바꾸기
                if(findId==true){
                    document.getElementsByClassName('welcome-header__title')[0].innerText = "Find Your Password";
                    document.getElementById('find_btn').value="비밀번호 찾기";
                    document.getElementById('change_btn').innerText="아이디 찾으러 가기";
                    document.getElementById('findVal1').placeholder="아이디";
                }else{
                    document.getElementsByClassName('welcome-header__title')[0].innerText = "Find Your ID";
                    document.getElementById('find_btn').value="아이디 찾기";
                    document.getElementById('change_btn').innerText="비밀번호 찾으러 가기";
                    document.getElementById('findVal1').placeholder="이름";
                }
                findId = !findId;
            }

            function findUserData(){ // 비동기 데이터 찾기, 화면에 찾은 데이터 띄우기, 못찾으면 에러 메세지
                // 1. 데이터 두 가지 다 입력 되었는지 확인
                var userData1 = document.getElementById('findVal1').value;
                var userData2 = document.getElementById('findVal2').value;
                if(userData1==""){
                    document.getElementById('findVal1').focus();
                    return false;
                }else if(userData2==""){
                    document.getElementById('findVal2').focus();
                    return false;
                }

                // 2. fetch로 정보 찾아오기
                fetch("/user/findUser", {
                  method: "POST",
                  headers: {
                    "Content-Type": "application/json",
                  },
                  body: JSON.stringify({
                    userData1 : userData1,
                    userData2 : userData2,
                    findIdOrNot : findId
                  }),
                }).then(response => response.json()) // JSON 형태로 파싱
                    .then(data => {
                      alert("Received data: " + data);
                      // 여기서 받아온 데이터(data)를 원하는 방식으로 처리할 수 있습니다.
                    })
                    .catch(error => {
                      console.error("Error:", error);
                    });
                return false;
                // 3. 데이터 보여주는 화면으로 바꾸기(데이터 찾기 성공시)

                // 4. 유저 찾기 실패시 실패메세지 띄우기
            }

            function closePopup(){ // 닫기 클릭 시 창 닫기
                window.close();
            }

        </script>
    </head>
    <body class="height-100vh">
        <header class="welcome-header">
            <img src="/img/logo.png" class="welcome-header__logo" />
            <h1 class="welcome-header__title">Find Your ID</h1>
            <p class="welcome-header__text">캣톡 계정을 찾아보라옹</p>
        </header>
        <form id="login-form" onSubmit="return findUserData();" >
            <input type="text" placeholder="이름" name="findVal1" id="findVal1" />
            <input type="text" placeholder="핸드폰 번호" name="findVal2" id="findVal2" />
            <input type="submit" id="find_btn" value="아이디 찾기" />
            <input type="submit" id="close_btn" value="닫기" onClick="closePopup();" style="display:none" />
            <a href="#" id="change_btn" onClick="changeIdPasswd();" >비밀번호 찾으러 가기</a>
        </form>
        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
    </body>
</html>
