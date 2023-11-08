import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

@WebServlet("/UploadServlet")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5) // 최대 파일 크기 (5MB)
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Part imagePart = request.getPart("image");
        String author = "사용자 이름"; // 사용자 이름을 설정하세요

        // 데이터베이스 연결 및 게시물 저장
        try {
            Connection conn = ((DataSource) getServletContext().getAttribute("dataSource")).getConnection();
            String sql = "INSERT INTO Board (title, content, image, created_at, author) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, title);
            pstmt.setString(2, content);

            // 이미지를 BLOB 형식으로 저장
            InputStream imageStream = imagePart.getInputStream();
            pstmt.setBinaryStream(3, imageStream, (int) imagePart.getSize());

            // 현재 날짜 및 시간 저장
            Timestamp timestamp = new Timestamp(new Date().getTime());
            pstmt.setTimestamp(4, timestamp);
            pstmt.setString(5, author);

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // 게시물 업로드 완료 후 게시판 홈페이지로 리다이렉트
        response.sendRedirect("board.jsp");
    }
}
