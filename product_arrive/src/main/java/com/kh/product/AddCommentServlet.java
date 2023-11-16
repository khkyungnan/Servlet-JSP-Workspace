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
       

        // ����� ���� ��������
        HttpSession session = request.getSession();

       
            // ������ �ְ� ����ڰ� �α����� ������ ��쿡�� ��� �߰�
            int productID = Integer.parseInt(request.getParameter("productID"));
            String userID = request.getParameter("userID");
            String commentName = request.getParameter("commentName");
            String commentText = request.getParameter("commentText");

            // ���⿡�� ����� �����ͺ��̽��� �����ϴ� ���� �۾��� ������ �� �ֽ��ϴ�.
            ProductDAO.addComment(productID,userID, commentName, commentText);

            System.out.println("����߰�");
       
    }
}
