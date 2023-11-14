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
	
</body>
</html>







