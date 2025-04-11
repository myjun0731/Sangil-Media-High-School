<%@page import="javax.websocket.Session"%>
<%@page import="java.sql.*"%>
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
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	String id = request.getParameter("id");
	
	String sql = "Update board_tbl set title = ?, contents = ?, tag = ? where bid = ?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("title"));
	pstmt.setString(2, request.getParameter("content"));
	pstmt.setString(3, request.getParameter("tag"));
	pstmt.setString(4, request.getParameter("id"));
	
	pstmt.executeUpdate();
	
	response.sendRedirect("Board.jsp");
%>
</body>
</html>