<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.pixabay.com/photo/2017/08/22/22/11/monogram-2670684_960_720.ico" rel="shortcut icon" type="image/x-icon">
<title>HOTEL</title>
</head>
<style>
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
text-align:center;
font-color:white;
}
h2{
margin: 110px 0px 0px 0px;
text-align:center;
color: white;
}
h3{
margin: 80px 0px 0px 0px;
text-align:center;
color: white;
}

p{
text-align:center;
margin: 0px px 100px 100px;
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
.form{
text-align:center;
}
.btn {
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
    border: 3px solid #dadada;
    cursor: pointer;
}
td{
	width:100%;
	height:150px;
	margin:auto;
	text-align:center;
}
table{
	border:1px solid #4f556e;
	background-color:rgba(79, 85, 110, 0.9);
	width: 50%;
	height: 50%;
	overflow: auto;
	margin: auto;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;

}
</style>
<body>
<table>
	<tr>	
		<td>
			<h2>로    그    인 </h2>
			<form method=POST action="/a/check_user" id='frmLogin' class=form>
				<h3>아이디:&nbsp<input type=text name=userid class=loginlist></h3><br>
				<h3>비밀번호:&nbsp<input type=password name=passcode1 class=loginlist></h3><br><br>
				<p><input type=submit class=btn value="로그인">
				<input type=reset class=btn value="취소">
				<a href='/a/newbie'><input type="button" class=btn value="회원가입"></a></p>
			</form>
		</td>
	</tr>
</table>
</body>
<script src='https:code.jquery.com/jQuery-3.5.0.js'></script>
<script>
$(document)
	.on('submit','#frmLogin',function(){
		let pstr=$.trim($('input[name=userid]').val());
		$('input[name=userid]').val(pstr);
		pstr=$.trim($('input[name=passcode1]').val());
		$('input[name=passcode1]').val(pstr);
		if($('input[name=userid]').val()==''){
			alert("로그인 아이디를 입력하시오.");
			return false;
		}
		if($('input[name=passcode]').val()==''){
			alert("비밀번호를 입력하시오.");
			return false;
		}
		return true;
	})
</script>

</html>