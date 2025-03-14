<%@page import="com.sun.xml.internal.bind.v2.runtime.output.Encoded"%>
<%@page import="common.JDBC"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	JDBC jdbc = new JDBC();
	try{
		String sql = "";
		jdbc.rs = jdbc.conn.prepareStatement(sql).executeQuery();
		jdbc.rs.next();
	%>
	<jsp:include page="header.jsp"></jsp:include>
</body>
</html>