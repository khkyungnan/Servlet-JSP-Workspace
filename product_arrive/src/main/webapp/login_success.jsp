<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인성공</title>
<script>
	//3초 후 홈페이지로 이동하는 javascript
	setTimeout(function() {
		//이동할 페이지 경로 설정
		window.location.href="home.jsp";
	}, 3000); //3000 = 3초
</script>
</head>
<body>
<!--  로그인 성공할 경우 세션에 저장된 사용자 이름 가져오기 -->
<% String memail = (String) session.getAttribute("memail"); %>

	<p> 환영합니다. <%=memail %> 님!</p>
	<p> 3초 후 홈페이지로 이동합니다.</p>
	<p><a href="logout">로그아웃</a>
</body>
</html>





