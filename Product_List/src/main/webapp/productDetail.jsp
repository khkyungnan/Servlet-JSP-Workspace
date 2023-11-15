<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="com.kh.product.Product" %>
<%@ page import ="com.kh.product.ProductDAO" %>
<%@ page import = "com.kh.product.ProductComment" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>제품 상세 정보</title>

    
</head>
<body>
    <h1>제품 상세 정보</h1>

    <%
     	//String ProductIdParam = request.getParameter("productId");
     	Product product = null;
     	ArrayList<ProductComment> commentList = null;
     
        String productIdParam = request.getParameter("productId");
        if (productIdParam != null) {
            int productId = Integer.parseInt(productIdParam);
            ProductDAO productDAO = new ProductDAO();
            product = productDAO.getProductById(productId);
            commentList = productDAO.getCommentsByProductId(product.getProductId());
            
    %>

    <p>제품 ID: <%= product.getProductId() %></p>
    <p>제품명: <%= product.getProductName() %></p>
    <p>카테고리: <%= product.getCategory() %></p>
    <p>가격: <%= product.getPrice() %></p>
    <p>재고 수량: <%= product.getStockQuantity() %></p>
    <a href="update_product.jsp?productId=<%= product.getProductId() %>">제품 수정하기</a>
    <%
        } else {
    %>
    <p>상품을 찾을 수 없습니다..</p>
    <%
        }
    %>
    <!--  댓글 목록 표시 -->
    <h3>댓글목록</h3>
    <%
    	//만약에 댓글이 존재한다면 if
    	if (commentList != null) {
    		for (ProductComment comment : commentList){
    %>
    <!-- <p> 작성자이름 (작성한시간) : 댓글내용 </p>-->
    <p>
    <%= comment.getCommenterName() %> (<%=comment.getCommentDate() %>) : 
    <%= comment.getCommentText() %>
    </p>
    <% 
    		}
    	}
    
    %>
    
    <!--  댓글 추가 폼 작성! -->
    <form action="AddCommentServlet" method="post">
    
    	<input type=text name="productID" value="<%= product != null ?product.getProductId() :"" %>"><br>
    	
    	<label for = "commentName"> 이름 : </label>
    	<input type="text" name="commentName" required>
    	<br>
    	
    	<label for="commentText"> 댓글 내용 : </label>
    	<textarea name="commentText" required></textarea>
    	<br>
    	
    	<input type="submit" value="댓글추가">
    </form>
    
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
</body>
</html>









