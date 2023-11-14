package com.kh.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
        
        Product updateProduct = new Product(productId,productName,category,price,stockQuantity);
        
        ProductDAO pDAO = new ProductDAO();
       pDAO.updateProduct(updateProduct);
        
        //수정 후에 제품을 상세페이지로 다시 전달해주기
        response.sendRedirect("product_detail.jsp?productId=" + productId);
	}

}







