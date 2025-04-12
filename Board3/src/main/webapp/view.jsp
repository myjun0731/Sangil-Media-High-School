<%@page import="javax.websocket.Session"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<style>
body {
	font-family: sans-serif;
	background-color: #f4f4f4;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
}

section {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 80%;
	max-width: 600px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

td {
	padding: 10px;
	border-bottom: 1px solid #eee;
	text-align: left;
}

td:first-child {
	font-weight: bold;
	width: 100px;
}

input[type="button"] {
	background-color: #1f2a40;
	color: white;
	border: none;
	padding: 10px 15px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	margin-right: 10px;
}

input[type="button"]:last-child {
	margin-right: 0;
}

input[type="button"]:hover {
	background-color: #34495e;
}
</style>
</head>
<body>
	<%
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");

    String id = request.getParameter("id");

    String sql1 = "select mid, title, mname, contents, bdate from board_tbl where bid = '"+id+"'";

    ResultSet rs = con.prepareStatement(sql1).executeQuery();

    rs.next();

    String mid = (String)application.getAttribute("mid");

%>
	<jsp:include page="Header.jsp" />
	<section>
		<table>
			<tr>
				<td>제목</td>
				<td><%=rs.getString("title") %></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=rs.getString("mname") %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><pre style="font-family: sans-serif;"><%=rs.getString("contents") %></pre></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=rs.getString("bdate") %></td>
			</tr>

			<tr>
				<td colspan="2" style="text-align: center;"><input
					type="button" value="뒤로가기" onclick="location.href='Board.jsp'">
					<%if(mid != null && mid.equals(request.getParameter("mid"))){ %> <input
					type="button" value="삭제"
					onclick="location.href='Delete.jsp?id=<%=request.getParameter("id")%>'">
					<input type="button" value="수정"
					onclick="location.href='Edit.jsp?id=<%=request.getParameter("id")%>'">
					<%} %></td>
			</tr>
		</table>
	</section>
</body>
</html>