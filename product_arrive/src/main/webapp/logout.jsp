<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// 세션을 없애서 로그아웃 처리
	session.invalidate();
	response.sendRedirect("home.jsp");
%>