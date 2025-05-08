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

String sql = "insert into TBL_ITEM_01 values (?,?,?,?)";


PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.setString(1, request.getParameter("PCODE"));
pstmt.setString(2, request.getParameter("PNAME"));
pstmt.setString(3, request.getParameter("TYPE"));
pstmt.setString(4, request.getParameter("PRICE"));

pstmt.executeUpdate();
response.sendRedirect("Item_Insert.jsp");
%>
</body>
</html>