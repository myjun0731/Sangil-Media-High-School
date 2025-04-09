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

String sql = "update tbl_vaccresv_202109 set jumin = ?, vcode = ?, hospcode = ?, resvdate = ?, resvtime = ? where resvno = ?";
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, request.getParameter("jumin"));
pstmt.setString(2, request.getParameter("vcode"));
pstmt.setString(3, request.getParameter("hospcode"));
pstmt.setString(4, request.getParameter("resvdate"));
pstmt.setString(5, request.getParameter("resvtime"));
pstmt.setString(6, request.getParameter("resvno"));


pstmt.executeUpdate();
response.sendRedirect("2Insert_List.jsp");

%>
</body>
</html>