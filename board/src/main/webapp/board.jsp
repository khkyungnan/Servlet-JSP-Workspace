<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.sql.DataSource, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시판</title>
</head>
<body>
    <h1>게시판</h1>

    <% 
        Connection conn = null;
        try {
            // 데이터베이스 연결
            DataSource dataSource = (DataSource) getServletContext().getAttribute("dataSource");
            conn = dataSource.getConnection();

            // 게시물 정보 가져오기
            String selectQuery = "SELECT * FROM Board ORDER BY created_at DESC";
            PreparedStatement selectStatement = conn.prepareStatement(selectQuery);
            ResultSet resultSet = selectStatement.executeQuery();

            while (resultSet.next()) {
                int boardId = resultSet.getInt("board_id");
                String title = resultSet.getString("title");
                String author = resultSet.getString("author");
                Timestamp created_at = resultSet.getTimestamp("created_at");

                // 이미지 표시를 위한 이미지 URL 생성
                String imageSrc = "DisplayImageServlet?boardId=" + boardId;

    %>
    <div>
        <img src="<%=imageSrc%>" alt="<%=title%> 이미지" width="100">
        <h2><%=title%></h2>
        <p>작성자: <%=author%></p>
        <p>작성일: <%=created_at%></p>
        <a href="view.jsp?boardId=<%=boardId%>">게시물 보기</a>
    </div>
    <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>

    <a href="upload.jsp">새 게시물 업로드</a>
</body>
</html>
