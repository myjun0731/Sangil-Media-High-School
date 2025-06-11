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
String pcode = request.getParameter("pcode");

Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");


String sql = "delete from tbl_item_01 where pcode='"+ pcode +"'";

PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.executeUpdate();

response.sendRedirect("Item_List.jsp");
%>
</body>
</html>