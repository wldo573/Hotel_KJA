<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.pixabay.com/photo/2017/08/22/22/11/monogram-2670684_960_720.ico" rel="shortcut icon" type="image/x-icon">
<title>회원가입</title>
</head>
<style>
header {
	text-align:left;
	position: fixed;
	top: 0; 
	left: 0;
	height: 100px;
	width: 100%;
	background-color:#4f556e;
}

body{
	margin-top:100px;
    background-image:url('https://cdn.pixabay.com/photo/2016/11/17/09/28/hotel-1831072_960_720.jpg');
	background-repeat:no-repeat;
	width: 100%;
	height: 100vh;
	background-size: cover;
	background-position: center;
}
h1{
	margin-left:20px;
}
h2{
	margin: 120px 0px 0px 0px;
	text-align:center;
}
h3{
	margin-top: 80px;
	text-align:center;
	color:black;
}
.loginlist{
	border:1px solid ;
	border-radius:0px;
	height:30px;
	width:300px;
	border: none;
	background: transparent;
	border-bottom: white 1px solid;
}
p{
	text-align:center;
	margin: 100px 0px 0px 0px;
} 

input{
	border:1px solid #ffffff;
	border-radius:0px;
	height:30px;
	width:300px;
}

.btn{
    padding: 1em 2em;
    color: white;
    margin-top: 2rem;
    font-weight: bold;
    font-size: 0.678rem;
    letter-spacing: 2px;
    text-transform: uppercase;
    background-color:rgba(79, 85, 110, 0.5);
    background: linear-gradient(to right, rgba(#b2876f, 0) 25%, rgba(#b2876f, .8) 75%);
    background-position: 1% 50%;
    background-size: 400% 300%;
    border: 3px solid #ffffff;
    cursor: pointer;
}


td{
	border:1px solid #ffffff;
	background-color:rgba(255,255,255, 0.5);
	width:10%;
	height:200%;
}
</style>
<header>
<h1 style="color:white">Hotel</h1>
</header>
<table>
	<tr>
		<td>
			<h2 style="color:black">회  원  등  록</h2>
			<form method=POST action="/a/signin" id='frmSignin'>
				<h3>이름:&nbsp<input type=text name=realname class="loginlist"></h3><br>
				<h3>아이디:&nbsp<input type=text name=userid class="loginlist"></h3><br>
				<h3>비밀번호:&nbsp<input type=password name=passcode1 class="loginlist"></h3><br>
				<h3>비밀번호 확인:&nbsp<input type=password name=passcode2 class="loginlist"></h3><br>
				<p><input type="submit" calss ="btn" value="회원가입">
				<a href='/a/'><input type="button" calss ="btn" value="홈페이지로(취소)"></a></p>
			</form>
		</td>
	</tr>
</table>

</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('submit','#frmSignin',function(){
	if($('input[name=realname]').val() == ''){
		alert("이름을 입력하시오.");
		return false;
	}
	if($('input[name=userid]').val() == ''){
		alert("로그인 아이디를 입력하시오.");
		return false;
	}
	if($('input[name=passcode1]').val() == ''){
		alert("비밀번호를 입력하시오.");
		return false;
	}
	if($('input[name=passcode1]').val()!=$('input[name=passcode2]').val()){
		alert("비밀번호가 일치하지 않습니다");
		return false;
	}
		return true;
});
</script>
</html>