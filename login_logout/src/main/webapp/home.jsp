<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>홈페이지</title>
<script>
	function displayLoginFail(){
		alert("로그인에 실패하였습니다.");// 팝업으로 표시할 오류 메세지
	}
</script>
</head>
<body>
<h1>홈페이지에 오신걸 환영합니다.</h1>
<!-- 만약에 로그인인 상태일경우 로그인 버튼을 숨기고 싶고
	로그아웃 버튼이 보이게 하고 싶을 경우
 -->
 <%
 	if (session.getAttribute("mno") != null){
 %>
 	<a href="logout.jsp">로그아웃</a>
 <%
 	} else{
 %>
	<a href="login.jsp">로그인</a>
 <%
	}
 %>
 
 <%
   String loginError = (String) request.getAttribute("loginError");

 	if(loginError != null) {
 %>
 <script>
 	displayLoginFail();
 </script>

<%
 	}
%>
 
	<!-- % %자바코드로 변수정의, 반복문, 조건문 메서드 호출 등 
									행위를 표현하는 공간	-->
	<!-- %= %는 어떤 값에 대한 결과를 출력하는 공간    -->
	
	
</body>
</html>








