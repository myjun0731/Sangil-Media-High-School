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

	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");

	String sql = "UPDATE member_tbl_02 SET custname = ?, phone = ?, address = ?, joindate = ?, grade = ?, city = ? WHERE custno = ?";

	JDBC jdbc = new JDBC();
	jdbc.pstmt = jdbc.conn.prepareStatement(sql);

	jdbc.pstmt.setString(1, custname);
	jdbc.pstmt.setString(2, phone);
	jdbc.pstmt.setString(3, address);
	jdbc.pstmt.setString(4, joindate);
	jdbc.pstmt.setString(5, grade);
	jdbc.pstmt.setString(6, city);
	jdbc.pstmt.setString(7, custno);
	jdbc.pstmt.executeUpdate();
	response.sendRedirect("list.jsp");
	%>
</body>
</html>