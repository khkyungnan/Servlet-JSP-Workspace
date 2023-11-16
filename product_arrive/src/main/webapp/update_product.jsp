<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="com.kh.product.Product" %>
<%@ page import ="com.kh.product.ProductDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>제품 상세 정보</title>
      
</head>
<body>
    <h1>제품 상세 정보</h1>

    <%
        String productIdParam = request.getParameter("productId");
        if (productIdParam != null) {
            int productId = Integer.parseInt(productIdParam);
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProductById(productId);
            
    %>

    <p>제품 ID: <%= product.getProductId() %></p>
    <p>제품명: <%= product.getProductName() %></p>
    <p>카테고리: <%= product.getCategory() %></p>
    <p>가격: <%= product.getPrice() %></p>
    <p>재고 수량: <%= product.getStockQuantity() %></p>
    <!-- 제품 수정 버튼 추가 -->
    <a href="update_product.jsp?productId=<%= product.getProductId() %>">제품 수정하기</a>

  
    <%
        } else {
    %>
    <p>상품을 찾을 수 없습니다..</p>
    <%
        }
    %>
</body>
 <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
             text-align: center;
        }

        h1 {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e0e0e0;
        }
    </style>
</html>
