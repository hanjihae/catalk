<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>회원가입 - Welcome to CATALK</title>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/styles.css" />
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
        <header class="welcome-header welcome-header__signup">
            <img src="/img/logo.png" class="welcome-header__logo" />
            <h1 class="welcome-header__title">Welcome to CATALK</h1>
            <p class="welcome-header__text welcome-header__text-signup">캣톡 계정이 없다면 빈칸을 채워 회원가입하라옹</p>
        </header>
        <form id="signup-form" method="post">
            <input type="text" placeholder="아이디" name="userId" id="userId" oninput="userValidation(this);" />
            <span id="userIdMsg"></span>
            <input type="password" placeholder="비밀번호" name="userPw" id="userPw" oninput="userValidation(this);" />
            <span id="userPwMsg"></span>
            <input type="password" placeholder="비밀번호 확인" id="userPw2" oninput="passConfirm();" />
            <span id="userPw2Msg"></span>
            <input type="text" placeholder="이름" name="userName" id="userName" oninput="userValidation(this);" />
            <span id="userNameMsg"></span>
            <input type="text" id="datepicker" placeholder="생년월일" name="userDate"
                   required pattern="(?:19|20)\d{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|[12]\d|3[01])|(?!02)(?:0[1-9]|1[0-2])-(?:30)|(?:0[13578]|1[02])-31)" />
            <input type="text" placeholder="핸드폰 번호" name="userPhone" id="userPhone" />
            <span id="userPhoneMsg"></span>
            <input type="submit" value="회원가입" formaction="/user/doSignUp" onClick="signUp();" />
        </form>
        <script src="https://kit.fontawesome.com/3aeedf8ddf.js" crossorigin="anonymous"></script>
        <script>
            function changeTextOnWidth() {
                var welcomeText = document.querySelector('.welcome-header__text-signup');

                // 가로 크기가 556px 이하일 때
                if (window.innerWidth <= 556) {
                    welcomeText.innerHTML = "캣톡 계정이 없다면<br>빈칸을 채워 회원가입하라옹"; // HTML 태그를 사용한 내용으로 변경
                } else {
                    welcomeText.textContent = "캣톡 계정이 없다면 빈칸을 채워 회원가입하라옹"; // 가로 크기가 556px 초과일 때의 내용
                }
            }

            // 화면 크기 변화 감지 시 내용 변경
            window.addEventListener('resize', function () {
                changeTextOnWidth();
            });

            // 페이지 로드 시 초기 내용 설정
            window.addEventListener('load', function () {
                changeTextOnWidth();
            });

            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd',
                prevText: '이전 달',
                nextText: '다음 달',
                monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                dayNames: ['일', '월', '화', '수', '목', '금', '토'],
                dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                showMonthAfterYear: true,
                yearSuffix: '년'
            });

            $(function() {
                $( "#datepicker").datepicker();
            });

            function userValidation(e) {
                if(e.value == '') {
                var thisId = e.id;
                    $('#'+thisId).attr('style','background-color:pink');
                    console.log(thisId);
                    if(thisId=='userName'){
                        $('#'+thisId+"Msg").html('<b style="font-size: 10px; color: red">[3~10글자로 입력하세요.]</b>');
                    }else{
                        $('#'+thisId+"Msg").html('<b style="font-size: 10px; color: red">[영문자, 숫자조합 3~20글자로 입력하세요.]</b>');
                    }
                    chk1 = false;
                }
            }
            /* 입력없이 가입버튼 클릭시 */
            function signUp(){
                if($("#userId").val()==""){
                    alert("아이디를 입력해주세요.");
                    $("#userId").focus();
                    return false;
                }
                if($("#userPw").val()==""){
                    alert("비밀번호를 입력해주세요.");
                    $("#userPw").focus();
                    return false;
                }
                if($("#userPw2").val()==""){
                    alert("비밀번호 확인을 입력해주세요.");
                    $("#userPw2").focus();
                    return false;
                }
                if($("#userName").val()==""){
                    alert("성명을 입력해주세요.");
                    $("#userName").focus();
                    return false;
                }
                if($("#userDate").val()==""){
                    alert("생년월일을 입력해주세요.");
                    $("#userDate").focus();
                    return false;
                }
                if($("#userPhone").val()==""){
                    alert("연락처를 입력해주세요.");
                    $("#userPhone").focus();
                    return false;
                }
            }

            function memberIdOverlap(){
                const formData = $('#registerform').serialize();
                $.ajax({
                    method :"post",
                    url :"memberIdOverlap",
                    data : formData,
                    success : function(data,status,xhr){
                        if(data == "1"){
                             $('#memberId').css('background-color', '#c2d9a4');
                             $('#memberIdMsg').html('<b style="font-size: 10px; color: #000">[사용가능한 아이디 입니다.]</b>');
                             chk1 = true;
                            alert("이 아이디는 사용 가능합니다.");
                        }else{	//
                            alert("이 아이디는 사용 불가능합니다.");
                        }
                    },
                    error : function(data,status,xhr){
                        alert("아이디 중복확인 실패");
                    }
                });
            }

            function passConfirm(e) {
                var password = document.getElementById('passwd');
                var passwordConfirm = document.getElementById('confirm');
                var confrimMsg = document.getElementById('confirmMsg');
                var correctColor = "#00ff00";	//맞았을 때 출력되는 색깔.
                var wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔

                if(password.value == passwordConfirm.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
                    confirmMsg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
                    confirmMsg.innerHTML ="비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
                }else{
                    confirmMsg.style.color = wrongColor;
                    confirmMsg.innerHTML ="비밀번호 불일치";
                }
            }
        </script>
    </body>
</html>
