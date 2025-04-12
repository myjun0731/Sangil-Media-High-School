<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Lato', sans-serif;
}

body {
	background-color: #f5f6fa;
	color: #2c3e50;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.info-container {
	background-color: white;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.info-container p {
	text-align: left;
}

.info-container h1 {
	font-size: 24px;
	margin-bottom: 20px;
}

p {
	font-size: 16px;
	margin-bottom: 10px;
}

input[type="button"] {
	background-color: #1f2a40;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s ease;
	margin: 5px;
}

input[type="button"]:hover {
	background-color: #354563;
}
</style>
</head>
<body>
	<jsp:include page="Header.jsp" />
	<div class="info-container">
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");

	String id = request.getParameter("id");

	String sql = "select * from member_tbl";
	String sql2 = "select * from member_tbl where mid = '"+id+"'";

	boolean tt = false;

	ResultSet rs = con.prepareStatement(sql).executeQuery();
	ResultSet rs2 = con.prepareStatement(sql2).executeQuery();
	while(rs.next()){
	if (rs.getString(4).equals("1")) {
		%>
		<h1><%=rs.getString(2) %>님 정보</h1>
		<p>아이디 : <%=rs.getString(1) %></p>
		<p>비밀번호 : <%=rs.getString(3) %></p>
		<input type="button" value="뒤로가기" onclick="location.href='Board.jsp'">
		<input type="button" value="회원수정" onclick="location.href='UserUpdate.jsp?mid=<%=rs.getString(1)%>&mpw=<%=rs.getString(3)%>'">
		<input type="button" value="회원탈퇴" onclick="location.href='UserDelete.jsp?mid=<%=rs.getString(1)%>'">
		<input type="button" value="로그아웃" onclick="location.href='logout.jsp?mid=<%=rs.getString(1)%>'">
		<%
		tt = true;
	}
	}
	if(tt == false){
		%>
		<p>로그인 정보가 없습니다.</p>
		<input type="button" value="회원가입" onclick="location.href='Insert.jsp'">
		<input type="button" value="로그인" onclick="location.href='loginhe.jsp'">
		<%
	}

	if (rs != null) rs.close();
	if (rs2 != null) rs2.close();
	if (con != null) con.close();
%>
	</div>

<script type="text/javascript">

</script>
</body>
</html>