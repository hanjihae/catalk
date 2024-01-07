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
            <h1 class="welcome-header__title">Welcome to CATALK</h1>
            <p class="welcome-header__text">If you don't have a CATALK account, fill in the blanks.</p>
        </header>
        <form id="signup-form" method="post">
            <input type="text" placeholder="Name" name="userName" id="userName" oninput="userValidation(this);" />
            <span id="userNameMsg"></span>
            <input type="text" placeholder="Id" name="userId" id="userId" oninput="userValidation(this);" />
            <span id="userIdMsg"></span>
            <input type="password" placeholder="Password" name="userPw" id="userPw" oninput="userValidation(this);" />
            <span id="userPwMsg"></span>
            <input type="password" placeholder="Password Check" id="userPw2" oninput="passConfirm();" />
            <span id="userPw2Msg"></span>
            <input type="text" placeholder="Phone number" name="userPhone" id="userPhone" />
            <span id="userPhoneMsg"></span>
            <input type="date" id="datepicker" placeholder="YYYY-MM-DD" name="userDate"
                   required pattern="(?:19|20)\d{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|[12]\d|3[01])|(?!02)(?:0[1-9]|1[0-2])-(?:30)|(?:0[13578]|1[02])-31)" />
            <input type="submit" value="Sign Up" formaction="/user/doSignUp" onClick="signUp();" />
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
