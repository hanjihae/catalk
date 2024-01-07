<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to CATALK</title>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/styles.css" />
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
            <h1 class="welcome-header__title">환영합니다</h1>
            <p class="welcome-header__text">캣톡 계정이 없으시다면 아래 빈칸을 채워 회원가입해주세요!</p>
        </header>
        <form id="signup-form" method="post" onSubmit="return signUp();">
            <input type="text" placeholder="아이디" name="userId" id="userId" oninput="userValidation(this);" />
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


            function userValidation(e) { //id, 비번, 이름 글자수 체크
                var thisId = e.id;
                if( $('#'+thisId).val().length<3 || $('#'+thisId).val().length>20 ){
                    $('#'+thisId).attr('style','background-color:pink');
                    $('#'+thisId+"Msg").html('<b style="font-size: 10px; color: red">[3~20글자로 입력하세요.]</b>');
                }else{
                    $('#'+thisId).attr('style','background-color:white');
                    $('#'+thisId+"Msg").html('');
                }
            }

            function passConfirm(e) { // 비번 일치 확인
                var userPw = $('#userPw').val();
                var userPw2 = $('#userPw2').val();
                if(userPw == userPw2){
                    $('#userPw2').attr('style','background-color:white');
                    $('#userPw2Msg2').html('<b style="font-size: 10px; color: green">비밀번호가 일치합니다.</b>');
                }else{
                    $('#userPw2').attr('style','background-color:pink');
                    $('#userPw2Msg2').html('<b style="font-size: 10px; color: red">비밀번호가 일치하지 않습니다.</b>');
                }
            }

            function signUp(){ // 데이터 입력 확인
                var inputs = $('input');
                for(var i = 0; i <inputs.length; i++){
                    if(inputs[i].style.cssText=="background-color: pink;"){
                        alert("입력한 정보를 다시 확인해주세요.");
                        return false;
                    }
                }
                if($("#userId").val()==""||$("#userPw").val()==""||$("#userPw2").val()==""||$("#userName").val()==""||$("#userDate").val()==""||$("#userPhone").val()==""){
                    alert("입력한 정보를 다시 확인해주세요.");
                    return false;
                }
                return true;
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



        </script>
    </body>
</html>
