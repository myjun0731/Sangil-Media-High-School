<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
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

	form {
		background-color: #fff;
		padding: 40px;
		border-radius: 10px;
		box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
		width: 600px;
	}

	h1 {
		text-align: center;
		margin-bottom: 20px;
		color: #1f2a40;
	}

	.form-group {
		margin-bottom: 15px;
	}

	label {
		display: inline-block;
		width: 100px;
		font-weight: 600;
		color: #1f2a40;
		margin-bottom: 5px;
	}

	input[type="text"] {
		width: calc(100% - 110px);
		padding: 10px 15px;
		border: 1px solid #ccc;
		border-radius: 6px;
		font-size: 14px;
	}

	.button-row {
		text-align: center;
		padding-top: 20px;
	}

	input[type="submit"], input[type="button"] {
		padding: 10px 20px;
		background-color: #1f2a40;
		color: white;
		border: none;
		border-radius: 6px;
		cursor: pointer;
		font-size: 14px;
		transition: background-color 0.3s ease;
		margin: 0 10px;
	}

	input[type="submit"]:hover, input[type="button"]:hover {
		background-color: #34495e;
	}

	.link-buttons {
		text-align: center;
		margin-top: 20px;
	}

	.link-buttons input[type="button"] {
		margin: 0 5px;
	}
</style>
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

	if (rs2.next()){
		while(rs.next()){
			if(rs.getString(4).equals("1")){
				%>
				<form action="UserUpdateDetail.jsp">
					<h1><%=rs.getString(2) %>님 정보 업데이트</h1>
					<input type="hidden" value="<%=mid%>" name = mid1>
					<div class="form-group">
						<label for="mid">아이디:</label>
						<input type="text" id="mid" value="<%=mid %>" name="mid">
					</div>
					<div class="form-group">
						<label for="mpw">비밀번호:</label>
						<input type="text" id="mpw" value="<%=mpw %>" name="mpw">
					</div>
					<div class="button-row">
						<input type="submit" value="수정하기">
						<input type="button" value="뒤로가기" onclick="location.href='Board.jsp'">
					</div>
				</form>
				<%
				tt = true;
				break; // 찾았으면 더 이상 반복할 필요 없음
			}
		}
	}

	if(tt == false){
		%>
		<div class="link-buttons">
			<input type="button" value="회원가입" onclick="location.href='Insert.jsp'">
			<input type="button" value="로그인" onclick="location.href='loginhe.jsp'">
		</div>
		<%
	}

	if (rs != null) rs.close();
	if (rs2 != null) rs2.close();
	if (con != null) con.close();
%>
</body>
</html>