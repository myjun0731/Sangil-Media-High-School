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
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

String sql = "insert into tbl_sample_01 values(?,?,?,?,?,?)";

String Y = "Y";

PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.setString(1, request.getParameter("saleno"));
pstmt.setString(2, request.getParameter("pcode"));
pstmt.setString(3, request.getParameter("saledate"));
pstmt.setString(4, request.getParameter("amount"));
pstmt.setString(5, request.getParameter("scode"));
pstmt.setString(6, Y);

pstmt.executeUpdate();
response.sendRedirect("Price_Insert.jsp");

%>
</body>
</html>