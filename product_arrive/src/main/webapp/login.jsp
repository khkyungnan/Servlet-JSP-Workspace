<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
<h1> 로그인 </h1>
<form action = "LoginServlet" method="post">
	<label for="meail"> 이메일 : </label>
	<input type="email" id="memail" name="memail" required><br>
	
	<label for = "mno">로그인할 비밀번호 넘버 : </label>
	<input type="password" id="mno" name="mno" required><br>
	
	<input type="submit" value="로그인">
</form>
</body>
</html>







