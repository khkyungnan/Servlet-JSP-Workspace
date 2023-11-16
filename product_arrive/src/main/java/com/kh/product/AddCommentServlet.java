package com.kh.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=EUC-KR");
       

        // 사용자 세션 가져오기
        HttpSession session = request.getSession();

       
            // 세션이 있고 사용자가 로그인한 상태인 경우에만 댓글 추가
            int productID = Integer.parseInt(request.getParameter("productID"));
            String userID = request.getParameter("userID");
            String commentName = request.getParameter("commentName");
            String commentText = request.getParameter("commentText");

            // 여기에서 댓글을 데이터베이스에 저장하는 등의 작업을 수행할 수 있습니다.
            ProductDAO.addComment(productID,userID, commentName, commentText);

            System.out.println("댓글추가");
       
    }
}
