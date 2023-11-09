<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>제품 상세 페이지</title>
</head>
<body>
<h1>제품 상세 정보</h1>
<%
	//String = id 값을 가지고 오겠다.
	String productIdValue = request.getParameter("productId");
	int productId = Integer.parseInt(productIdValue);
	//DAO 작업
	Product product = productDAO.get(productId);
%>
<p>제품 ID : <%= product.getProductId() %>
</body>
</html>





