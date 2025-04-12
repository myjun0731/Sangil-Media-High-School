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
	
	String mid = request.getParameter("mid");
	String mname = request.getParameter("mname");
	String mpw = request.getParameter("mpw");
	
	String sql = "select * from member_tbl";
	String sql2 = "select * from member_tbl where mid = '"+mid+"'";
	
	boolean tt = false;
	
	ResultSet rs = con.prepareStatement(sql).executeQuery();
	ResultSet rs2 = con.prepareStatement(sql2).executeQuery();
	
	rs2.next();
	while(rs.next()){
		if(rs.getString(4).equals("1")){
			%>
			<h1><%=rs.getString(2) %>님 정보 업데이트</h1>
			<form action="UserUpdateDetail.jsp">
			<input type="hidden" value="<%=mid%>" name = mid1>
			아이디 : <input type="text" value="<%=mid %>" name="mid">
			비밀번호 : <input type="text" value="<%=mpw %>" name="mpw">
			<input type="submit" value="수정하기" onclick="">
			<input type="button" value="뒤로가기" onclick="location.href='Board.jsp'">
			</form>
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