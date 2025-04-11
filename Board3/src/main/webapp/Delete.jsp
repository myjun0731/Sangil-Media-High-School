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
	
	String sql = "Delete from board_tbl where bid = "+id;
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.executeUpdate();
	
	response.sendRedirect("Board.jsp");
%>
</body>
</html>