<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>아이디 찾기</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="/css/styles.css" />
        <script>
            function changeIdPasswd(){
                location.href="/user/findPwPopup";
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
                    userData3 : "id",
                  }),
                }).then(response => {
                        if (!response.ok) {
                          throw new Error("Network response was not ok");
                        }
                        return response.text();
                    })
                    .then(data => {
                        // 3. 데이터 보여주는 화면으로 바꾸기(데이터 찾기 성공시)
                        if(data!=null && data!=""){
                            // 회원님의 아이디는 '' 입니다.(readonly), 인풋한줄 숨기기, 찾기버튼 숨기고 닫기버튼 보이기,찾으러가기는 어떡하지??
                            document.getElementById('findVal1').value = "회원님의 아이디는 ["+data+"] 입니다.";
                            document.getElementById('findVal1').readOnly = true;
                            document.getElementById('findVal2').style.display = "none";
                            document.getElementById('find_btn').style.display = "none";
                            document.getElementById('close_btn').style.display = "block";

                        }else{ // 4. 유저 찾기 실패시 실패메세지 띄우기
                            // 등록된 회원이 없습니다. 다시찾기?(readonly), 인풋한줄 숨기기, 찾기버튼 숨기고 닫기버튼 보이기,찾으러가기는 어떡하지??다시찾기??
                            document.getElementById('findVal1').value = "등록된 회원이 없습니다.";
                            document.getElementById('findVal1').readOnly = true;
                            document.getElementById('findVal2').style.display = "none";
                            document.getElementById('find_btn').style.display = "none";
                            document.getElementById('close_btn').style.display = "block";
                            document.getElementById('change_btn').style.display = "none";

                        }
                      })
                    .catch(error => {
                      alert("[Error] 다시 시도해주세요");
                    });
                return false;
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
            <p class="welcome-header__text">캣톡 아이디를 찾아보라옹</p>
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
