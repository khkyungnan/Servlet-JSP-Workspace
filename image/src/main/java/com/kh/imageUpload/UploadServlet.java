package com.kh.imageUpload;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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


@WebServlet("/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String jdbcUser = "khmember";
		String jdbcPW = "kh1234";
		
		/*
    		사용자가 요청한 폼 데이터를 처리하는데 사용하는 문장
    		jsp title 파라미터를 가지고와서 title 문자열 변수에 저장
    		폼에서 입력된 제목을 나타냄
		 * String title = request.getParameter("title");
		 * */
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Part imagePart = request.getPart("image");
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPW);
			String sql = "INSERT INTO Board (board_id, title, content,image, created_at, author)"
						+ "VALUES (board_sequence.nextval,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,  title);
			ps.setString(2,  content);
			ps.setBinaryStream(3, imagePart.getInputStream(),(int) imagePart.getSize());
			ps.setTimestamp(4, new Timestamp(new Date().getTime()));
			ps.setString(5, "author name");
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("imageList.jsp");
	}

	
	
	
	
	
}
