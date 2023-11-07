<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<h1>회원가입</h1>
<form action="RegisterServlet" method="post">
	    <label for="mno">회원 번호:</label>
        <input type="text" id="mno" name="mno" required><br>

        <label for="mname">이름:</label>
        <input type="text" id="mname" name="mname" required><br>

        <label for="memail">이메일:</label>
        <input type="email" id="memail" name="memail" required><br>

        <label for="mbirth">생년월일:</label>
        <input type="date" id="mbirth" name="mbirth" required><br>

        <input type="submit" value="가입">
    </form>
</body>
</html>




