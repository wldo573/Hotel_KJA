<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new info</title>
</head>
<style>
body{
    background-color: #dcdedc;
}
</style>
<body>
<form method="get" action="/a/info2">
	이름:${realname}
	로긴아이디:${userid}
	비밀번호:${passcode1}
	비밀번호 확인:${passcode2}
	모바일:${moblie}
	<a href="home"><input type=button value="돌아가기"></a>
</form>
</body>
</html>