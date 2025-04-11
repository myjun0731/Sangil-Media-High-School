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
	
	String id = request.getParameter("id");
	
	String sql1 = "select mid, title, mname, contents, bdate from board_tbl where bid = '"+id+"'";

	ResultSet rs = con.prepareStatement(sql1).executeQuery();
	
	rs.next();
	
	String mid = (String)application.getAttribute("mid");
	
%>

<section>
	<table>
		<tr>
			<td><%=rs.getString(2) %></td>
		</tr>
		<tr>
			<td><%=rs.getString(3) %></td>
		</tr>
		<tr>
			<td><%=rs.getString(4) %></td>
		</tr>
		<tr>
			<td><%=rs.getString(5) %></td>
		</tr>
		
		<%if(mid.equals(request.getParameter("mid"))){ %>
		<tr>
			<td>
				<input type="button" value="뒤로가기" onclick="location.href='Board.jsp'">
				<input type="button" value="삭제" onclick="location.href='Delete.jsp?id=<%=request.getParameter("id")%>'">
				<input type="button" value="수정" onclick="location.href='Edit.jsp?id=<%=request.getParameter("id")%>'">
			</td>
		</tr>
		<%}else{ %>
		<tr>
			<td>
				<input type="button" value="뒤로가기" onclick="location.href='Board.jsp'">
			</td>
		</tr>
		<%} %>
	</table>
</section>
</body>
</html>