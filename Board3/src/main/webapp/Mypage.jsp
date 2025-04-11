<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
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
	
	String id = request.getParameter("id");
	
	String sql = "select * from member_tbl";
	String sql2 = "select * from member_tbl where mid = '"+id+"'";
	
	boolean tt = false;
	
	ResultSet rs = con.prepareStatement(sql).executeQuery();
	ResultSet rs2 = con.prepareStatement(sql2).executeQuery();
	
	rs2.next();
	while(rs.next()){
		if(rs.getString(4).equals("1")){
			%>
			<h1><%=rs.getString(2) %>님 정보</h1>
			<p>아이디 : <%=rs.getString(1) %></p>
			<p>비밀번호 : <%=rs.getString(3) %></p>
			<input type="button" value="뒤로가기" onclick="location.href='Board.jsp'">
			<input type="button" value="로그아웃" onclick="location.href='logout.jsp?mid=<%=rs.getString(1)%>'">
			<%
			tt = true;
		}
	}
		if(tt == false){
			%>
			<input type="button" value="회원가입" onclick="location.href='Insert.jsp'">
			<input type="button" value="로그인" onclick="location.href='loginhe.jsp'">
			<%
		}
%>
</body>
</html>