<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>�Խù� ���ε�</title>
</head>
<body>
    <h1>�Խù� ���ε�</h1>
    <form action="UploadServlet" method="post" enctype="multipart/form-data">
        <label for="title">����:</label>
        <input type="text" name="title" id="title"><br>

        <label for="content">����:</label>
        <textarea name="content" id="content"></textarea><br>

        <label for="image">�̹��� ���ε�:</label>
        <input type="file" name="image" id="image"><br>

        <input type="submit" value="���ε�">
    </form>
</body>
</html>
