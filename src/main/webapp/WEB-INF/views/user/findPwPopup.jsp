<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>비밀번호 찾기</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="/css/styles.css" />
        <script>
            function changeIdPasswd(){
                location.href="/user/findIdPopup";
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
                    userData3 : "pw"
                  }),
                }).then(response => {
                        if (!response.ok) {
                          throw new Error("Network response was not ok");
                        }
                        return response.text();
                    })
                    .then(data => {
                        // 3. 회원정보 맞으면 비밀번호 바꾸기 / 정보 틀리면 다시 입력하게 하기
                        if(data!=null && data!=""){ // 비밀번호 바꾸기 > 새로운 비밀번호를 입력해주세요
                            document.getElementById('found_id').value= userData1;
                            document.getElementById('findVal1').value = "";
                            document.getElementById('findVal2').value = "";
                            document.getElementById('findVal1').placeholder = "새 비밀번호";
                            document.getElementById('findVal2').placeholder = "비밀번호 확인";
                            document.getElementById('find_btn').value="비밀번호 바꾸기";
                            document.getElementById('login-form').setAttribute('onSubmit','return changePw();');

                        }else{ // 4. 입력한 정보가 틀립니다. 다시 시도해주세요.
                            // 등록된 회원이 없습니다. 다시찾기?(readonly), 인풋한줄 숨기기, 찾기버튼 숨기고 닫기버튼 보이기,찾으러가기는 어떡하지??다시찾기??
                            alert("회원 정보가 틀립니다. 입력한 정보를 확인해주세요.");
                        }
                      })
                    .catch(error => {
                      alert("[Error] 다시 시도해주세요");
                    });
                return false;
            }

            function changePw(){
                // 1. 데이터 두 가지 다 입력 되었는지 확인
                var userId = document.getElementById('found_id').value;//아이디
                var userData1 = document.getElementById('findVal1').value;//새 비밀번호
                var userData2 = document.getElementById('findVal2').value;//새 비밀번호 확인
                if(userData1==""){
                    document.getElementById('findVal1').focus();
                    return false;
                }else if(userData2==""){
                    document.getElementById('findVal2').focus();
                    return false;
                }else if(userData1!=userData2){
                    alert("비밀번호와 비밀번호 확인 값이 일치하지 않습니다.");
                    document.getElementById('findVal2').focus();
                    return false;
                }
                // 2. fetch로 비번 수정
                fetch("/user/changePw", {
                  method: "POST",
                  headers: {
                    "Content-Type": "application/json",
                  },
                  body: JSON.stringify({
                    userId : userId,
                    userPw : userData1
                  }),
                }).then(response => {
                        if (!response.ok) {
                          throw new Error("Network response was not ok");
                        }
                        return response.text();
                    })
                    .then(data => {
                        // 3. 비밀번호 수정 성공 / 다시 로그인하세요
                        document.getElementById('findVal1').value = "비밀번호 바꾸기에 성공했습니다.";
                        document.getElementById('findVal1').readOnly = true;
                        document.getElementById('findVal2').style.display = "none";
                        document.getElementById('find_btn').style.display = "none";
                        document.getElementById('close_btn').style.display = "block";
                        document.getElementById('login-form').setAttribute('onSubmit','closePopup();');
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
            <h1 class="welcome-header__title">Find Your Password</h1>
            <p class="welcome-header__text">캣톡 비밀번호를 찾아보라옹</p>
        </header>
        <form id="login-form" onSubmit="return findUserData();" >
            <input type="text" placeholder="아이디" name="findVal1" id="findVal1" />
            <input type="hidden" id="found_id" />
            <input type="text" placeholder="핸드폰 번호" name="findVal2" id="findVal2" />
            <input type="submit" id="find_btn" value="비밀번호 바꾸기" />
            <input type="submit" id="close_btn" value="닫기" onClick="closePopup();" style="display:none" />
            <a href="#" id="change_btn" onClick="changeIdPasswd();" >아이디 찾으러 가기</a>
        </form>
        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
    </body>
</html>
