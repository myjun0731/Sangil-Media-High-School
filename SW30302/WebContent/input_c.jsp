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

	String sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";

	JDBC jdbc = new JDBC();
	jdbc.pstmt = jdbc.conn.prepareStatement(sql);

	jdbc.pstmt.setString(1, custno);
	jdbc.pstmt.setString(2, custname);
	jdbc.pstmt.setString(3, phone);
	jdbc.pstmt.setString(4, address);
	jdbc.pstmt.setString(5, joindate);
	jdbc.pstmt.setString(6, grade);
	jdbc.pstmt.setString(7, city);
	jdbc.pstmt.executeQuery();
	jdbc.close();

	response.sendRedirect("input.jsp");
	%>
</body>
</html>