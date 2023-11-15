package com.kh.product;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//jsp 폼에서 전송한 데이터 가지고오기!
		int productId = Integer.parseInt(request.getParameter("productId"));
		String commenterName = request.getParameter("commenterName");
		String commentText = request.getParameter("commentText");
		Timestamp commentDate = new Timestamp(System.currentTimeMillis());
		
		//ProductComment 객체 생성
		ProductComment comment= new ProductComment(0, productId, commenterName, commentText, commentDate);
		

		//ProductDAO를 사용해서 댓글 추가 
		ProductDAO productDAO = new ProductDAO();
		productDAO.addComment(comment);
		
		//댓글 추가 한다음 상세페이지로 다시 전송하는 리다이렉트 작성해주기
		response.sendRedirect("productDetail.jsp?productId=" + productId);
	}

}





