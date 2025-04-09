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
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
String sql = "DELETE FROM tbl_vaccresv_202109 WHERE resvno = ?";


PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, request.getParameter("resvno"));


pstmt.executeUpdate();
response.sendRedirect("2Insert_List.jsp");

%>
</body>
</html>