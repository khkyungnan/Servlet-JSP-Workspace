<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.List" %>
<%@ page import="paginationDAO.ProductsDAO" %>
<%@ page import="paginationDAO.Products" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>제품목록</title>
</head>
<body>

	<%
		int pageNumber = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
    	int pageSize = 2;
    	//int pageNumber = Integer.parseInt(request.getParameter("page"));
		
		
		ProductsDAO productsDAO = new ProductsDAO();
        List<Products> productList = productsDAO.getAllProducts(pageNumber, pageSize);
	
	%>
	<table border = "1">
		<tr>
			<th>제품명</th>
			<th>제품이름</th>
			
		</tr>
	<%
		for(Products p : pl){
	%>
	<tr>
		<td> <%= p.getProductId() %></td>
		<td> <%= p.getProductName() %></td>
	</tr>
	
	</table>
	<%
		//1. 페이지네이션 링크를 생성해줄것이고, 링크는 page 값에 따라서 다르게 보일 것
        int totalProducts = productsDAO.getTotalProducts(); //전체 제품 가져오기
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

        for (int i = 1; i <= totalPages; i++) {
    %>
            <a href="<%= request.getRequestURI() %>?page=<%= i %>"><%= i %></a>
    <%
        }
    %>
</body>
</html>







