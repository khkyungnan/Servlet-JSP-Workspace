<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="com.kh.product.Product" %>
<%@ page import ="com.kh.product.ProductDAO" %>
<%@ page import = "com.kh.product.ProductReview" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>��ǰ �� ����</title>
</head>
<body>
    <h1>��ǰ �� ����</h1>

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

    <p>��ǰ ID: <%= product.getProductId() %></p>
    <p>��ǰ��: <%= product.getProductName() %></p>
    <p>ī�װ�: <%= product.getCategory() %></p>
    <p>����: <%= product.getPrice() %></p>
    <p>��� ����: <%= product.getStockQuantity() %></p>
    <a href="update_product.jsp?productId=<%= product.getProductId() %>">��ǰ �����ϱ�</a>

    <!-- ��� ��� ǥ�� -->
    <h3>��۸��</h3>
	<%
    	if (session.getAttribute("mno") != null) {
	%>
                <!-- ���� ��� �߰� �� �ۼ� -->
                <form action="AddCommentServlet" method="post">
                    <input type="hidden" name="productID" value="<%= product != null ? product.getProductId() : "" %>"><br>
					<input type="hidden" name="userID" value="<%= product != null ? product.getUserID() : "" %>"><br>

                    <label for="commentName"> �̸� : </label>
                    <input type="text" name="commentName" required><br>
                    <label for="commentText"> ��� ���� : </label>
                    <textarea name="commentText" required></textarea><br>
                    <input type="submit" value="����߰�">
                </form>
    <% 
            
        } else {
    %>
        <p>�α��� �� ����� �ۼ����ּ���.</p>
    <%
        }
    %>

<h3>��۸��</h3>
<% 
    // ���࿡ ����� �����Ѵٸ� if
    if (commentList != null) {
        for (ProductReview comment : commentList) {
%>
            <!-- <p> �ۼ����̸� (�ۼ��ѽð�) : ��۳��� </p> -->
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









