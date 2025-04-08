<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	PreparedStatement pstmt;
	ResultSet rs;
	String id = request.getParameter("id");
	String korean = request.getParameter("korean");
	String math = request.getParameter("math");
	String english = request.getParameter("english");
	String history = request.getParameter("history");
	String sql = "insert into score_tbl values (?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, korean);
	pstmt.setString(3, english);
	pstmt.setString(4, math);
	pstmt.setString(5, history);
	pstmt.executeUpdate();
	response.sendRedirect("2St_Insert.jsp");
	%>
</body>
</html>