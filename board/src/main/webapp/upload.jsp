<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>게시물 업로드</title>
</head>
<body>
    <h1>게시물 업로드</h1>
    <form action="UploadServlet" method="post" enctype="multipart/form-data">
        <label for="title">제목:</label>
        <input type="text" name="title" id="title"><br>

        <label for="content">내용:</label>
        <textarea name="content" id="content"></textarea><br>

        <label for="image">이미지 업로드:</label>
        <input type="file" name="image" id="image"><br>

        <input type="submit" value="업로드">
    </form>
</body>
</html>
