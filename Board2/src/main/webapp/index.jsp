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
	
	String sql = "select * from member_tbl";
	
	boolean tt = false;
	
	ResultSet rs = con.prepareStatement(sql).executeQuery();
	
	while(rs.next()){
		if(rs.getString(4).equals("1")){
			%>
			<input type="button" value="내정보" onclick="">
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