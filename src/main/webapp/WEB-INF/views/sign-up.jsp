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
        <form id="signup-form" method="post" onSubmit="return signUp();">
            <div class="signup-form__id">
                <input type="text" placeholder="아이디" name="userId" id="userId" oninput="userValidation(this);" />
                <button id="idDuplication_btn" onClick="userIdCheck();">중복체크</button>
            </div>
            <span id="userIdMsg"></span>
            <input type="password" placeholder="비밀번호" name="userPw" id="userPw" oninput="userValidation(this);" />
            <span id="userPwMsg"></span>
            <input type="password" placeholder="비밀번호 확인" id="userPw2" oninput="passConfirm();" />
            <span id="userPw2Msg2"></span>
            <input type="text" placeholder="이름" name="userName" id="userName" oninput="userValidation(this);" />
            <span id="userNameMsg"></span>
            <input type="text" id="datepicker" placeholder="생년월일" name="userDate"
                   required pattern="(?:19|20)\d{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|[12]\d|3[01])|(?!02)(?:0[1-9]|1[0-2])-(?:30)|(?:0[13578]|1[02])-31)" />
            <input type="text" placeholder="핸드폰 번호" name="userPhone" id="userPhone" />
            <span id="userPhoneMsg"></span>
            <input type="submit" value="회원가입" formaction="/user/doSignUp"  />
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
                yearSuffix: '년',
                changeYear: true,
                maxDate:new Date(),
                yearRange: "-80:+00"
            });

            $(function() {
                $( "#datepicker").datepicker();
            });

            $(function() {
                $('.signup-form__id button').on('click', function(e) {
                    e.preventDefault();
                });
            });

            var IdChecked = false; // 아이디 중복체크 확인용
            function userValidation(e) { //id, 비번, 이름 글자수 체크
                var thisId = e.id;
                if( $('#'+thisId).val().length<3 || $('#'+thisId).val().length>20 ){
                    $('#'+thisId).css({'background-color':'rgba(0, 0, 0, 0.1)','margin-bottom':'10px'});
                    $('#'+thisId+"Msg").html('<b style="font-size: 10px; color: rgba(0, 0, 0, 0.3)">[3~20글자로 입력하세요.]</b>');
                    if(thisId=='userId'){
                        $('#idDuplication_btn').attr('style','display:none');
                        IdChecked = false;
                    }
                }else{
                    $('#'+thisId).css({'background-color':'white','margin-bottom':'25px'});
                    $('#'+thisId+"Msg").html('');
                    if(thisId=='userId'){
                        $('#idDuplication_btn').attr('style','display:block');
                        IdChecked = false;
                    }
                }
            }

            function passConfirm(e) { // 비번 일치 확인
                var userPw = $('#userPw').val();
                var userPw2 = $('#userPw2').val();
                if(userPw == userPw2){
                    $('#userPw2').attr('style','background-color:white');
                    $('#userPw2Msg2').html('<b style="font-size: 10px; color: green">비밀번호가 일치합니다.</b>');
                }else{
                    $('#userPw2').attr('style','background-color:rgba(0, 0, 0, 0.1)');
                    $('#userPw2Msg2').html('<b style="font-size: 10px; color: red">비밀번호가 일치하지 않습니다.</b>');
                }
            }

            function signUp(){ // 가입 클릭시 데이터 입력 확인
                var inputs = $('input');
                for(var i = 0; i <inputs.length; i++){
                    if(inputs[i].style.cssText=="background-color: rgba(0, 0, 0, 0.1);"){
                        alert("입력한 정보를 다시 확인해주세요.");
                        return false;
                    }
                }
                if($("#userId").val()==""||$("#userPw").val()==""||$("#userPw2").val()==""||$("#userName").val()==""||$("#userDate").val()==""||$("#userPhone").val()==""){
                    alert("입력한 정보를 다시 확인해주세요.");
                    return false;
                }
                if(IdChecked==false){
                    alert("아이디 중복 체크를 해주세요.");
                }
                return true;
            }

            function userIdCheck(){
                var userId = $('#userId').val();
                if(userId==""){
                    alert('아이디를 입력하세요.');
                    return false;
                }
                $.ajax({
                    method :"post",
                    url :"/user/userIdCheck",
                    data : { userId : userId },
                    success : function(data,status,xhr){
                        if(data == "1"){
                            $('#userIdMsg').html('<b style="font-size: 10px; color: rgba(0, 0, 0, 0.3)">[사용 가능한 아이디입니다.]</b>');
                            $('#userId').css({'margin-bottom':'10px'});
                            IdChecked = true;
                        }else{
                            $('#userIdMsg').html('<b style="font-size: 10px; color: red">[이미 사용 중인 아이디입니다.]</b>');
                            $('#userId').css({'margin-bottom':'10px'});
                            IdChecked = false;
                        }
                    },
                    error : function(data,status,xhr){
                        alert("아이디 중복확인 실패");
                    }
                });
            }



        </script>
    </body>
</html>
