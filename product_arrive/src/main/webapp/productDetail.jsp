<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="com.kh.product.Product" %>
<%@ page import ="com.kh.product.ProductDAO" %>
<%@ page import = "com.kh.product.ProductReview" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>제품 상세 정보</title>
</head>
<body>
    <h1>제품 상세 정보</h1>

<%
    Product product = null;
	ProductReview productReview = null;
    List<ProductReview> commentList = null;
    String productIdParam = request.getParameter("productId");
    if (productIdParam != null) {
        int productId = Integer.parseInt(productIdParam);
      
        ProductDAO productDAO = new ProductDAO();
        product = productDAO.getProductById(productId);
        
        commentList = productDAO.getCommentsByProductId(product.getProductId());
    }
%>

    <p>제품 ID: <%= product.getProductId() %></p>
    <p>제품명: <%= product.getProductName() %></p>
    <p>카테고리: <%= product.getCategory() %></p>
    <p>가격: <%= product.getPrice() %></p>
    <p>재고 수량: <%= product.getStockQuantity() %></p>
    <a href="update_product.jsp?productId=<%= product.getProductId() %>">제품 수정하기</a>

    <!-- 댓글 목록 표시 -->
    <h3>댓글목록</h3>
	<%
    	if (session.getAttribute("mno") != null) {
	%>
                <!-- 임의 댓글 추가 폼 작성 -->
                <form action="AddCommentServlet" method="post">
                    <input type="hidden" name="productID" value="<%= product != null ? product.getProductId() : "" %>"><br>
					<input type="hidden" name="userID" value="<%= product != null ? product.getUserID() : "" %>"><br>

                    <label for="commentName"> 이름 : </label>
                    <input type="text" name="commentName" required><br>
                    <label for="commentText"> 댓글 내용 : </label>
                    <textarea name="commentText" required></textarea><br>
                    <input type="submit" value="댓글추가">
                </form>
    <% 
            
        } else {
    %>
        <p>로그인 후 댓글을 작성해주세요.</p>
    <%
        }
    %>

<h3>댓글목록</h3>
<% 
    // 만약에 댓글이 존재한다면 if
    if (commentList != null) {
        for (ProductReview comment : commentList) {
%>
            <!-- <p> 작성자이름 (작성한시간) : 댓글내용 </p> -->
            <p>
                <%= comment.getUserID() %> (<%= comment.getReviewTitle() %>) :
                <%= comment.getReviewComment() %>
            </p>
<%
        }
    }
%>

</body>
</html>









