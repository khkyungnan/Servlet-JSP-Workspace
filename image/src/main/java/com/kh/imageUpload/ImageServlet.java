package com.kh.imageUpload;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String jdbcUser = "khmember";
		String jdbcPW = "kh1234";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPW);
			
			//sql
			String sql = "SELECT image FROM Board";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				//Result image 해당하는 데이터를 가지고와서 blob 저장
				//blob 을 쓴 이유는 우리가 image 데이터를 sql에서 blob에 저장해준다고
				//지정 해줬기 때문에 blob 객체를 가지고 온 것
				Blob blob = rs.getBlob("image");
				//blob 같은 경우 파일이기 때문에 파일을 쪼개고 쪼개서
				//byte 타입으로 읽은 다음 배열에 읽은 byte들을 모두 저장
				//getBytes(1, (int) blob.length()) : 1부터 끝까지 가지고 온다는 것
				//getBytes(시작,종료) 
				byte[] imageData = blob.getBytes(1, (int) blob.length());
				//setContentType("image/jpeg") : 파일 형식이 image 임을 나타냄
				response.setContentType("image/jpeg");
				response.getOutputStream().write(imageData);
			}
		
		
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	
}



