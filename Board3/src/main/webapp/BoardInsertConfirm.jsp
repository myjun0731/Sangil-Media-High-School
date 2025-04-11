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
	
	String sql1 = "select * from board_tbl";	
	int bid = 1;
	ResultSet rs = con.prepareStatement(sql1).executeQuery();
	
	while(rs.next()){
		bid++;
	}
	
	
	String mid = (String)application.getAttribute("mid");
	
	String sql = "insert into board_tbl values(?,?,?,to_date(sysdate,'YYYY-MM-DD HH24:MI:SS'),?,?,?)";
	String sql2 = "select * from member_tbl where mid = '"+mid+"'";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs2 = con.prepareStatement(sql2).executeQuery();
	rs2.next();
	
	String mname = rs2.getString(2);
	
	pstmt.setString(1, Integer.toString(bid));
	pstmt.setString(2, rs2.getString(2));
	pstmt.setString(3, request.getParameter("title"));
	pstmt.setString(4, request.getParameter("content"));
	pstmt.setString(5, mid);
	pstmt.setString(6, request.getParameter("tag"));
	
	pstmt.executeUpdate();
	
	response.sendRedirect("Board.jsp");
%>
</body>
</html>