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
	PreparedStatement pstmt;

	String saleno = request.getParameter("saleno");

	String UpdateSql = "UPDATE TBL_SAMPLE_01 SET ISBUY = ? where SALENO = " + saleno;
	String SelectSql = "select ISBUY from TBL_SAMPLE_01 where SALENO = " + saleno;
	ResultSet Selectrs = conn.prepareStatement(SelectSql).executeQuery();

	Selectrs.next();

	pstmt = conn.prepareStatement(UpdateSql);
	if (Selectrs.getString("ISBUY").equals("N")) {
		pstmt.setString(1, "Y");
	} else {
		pstmt.setString(1, "N");
	}
	pstmt.executeUpdate();
	response.sendRedirect("Amount_List.jsp");
	%>
</body>
</html>