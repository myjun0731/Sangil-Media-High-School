<%@ page import="java.sql.*" %>
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
	ResultSet rs; 
	PreparedStatement pstmt;
	
	String InputID = request.getParameter("mid");
	String InputPW = request.getParameter("mpw");
	
	String mid = "";
	String mpw = "";
	
	String sql = "select * from member_tbl";
	String sql2 = "Update member_tbl set tf = 1 where mid = ?";
	
	rs = con.prepareStatement(sql).executeQuery();
	pstmt = con.prepareStatement(sql2);
	pstmt.setString(1, request.getParameter("mid"));
	
	System.out.println(request.getParameter("mid"));
	
	
	
	while(rs.next()){
		mid = rs.getString(1);
		mpw = rs.getString(3);
		if(mid.equals(InputID)&&mpw.equals(InputPW)){ 
		%>
			<script type="text/javascript">
				alert("성공했어 인혁아 이 븅신같은 년아");
				location.href='Board.jsp';
			</script>
				
		<%
		application.setAttribute("mid", InputID);
		pstmt.executeUpdate();
		}
		
		} if(!(mid.equals(InputID)&&mpw.equals(InputPW))) {
			%>
			<script type="text/javascript">
				alert("실패했어 인혁아 이 븅신같은 년아");
				location.href='loginhe.jsp';
			</script>
			<%
		}
	%>
</body>
</html>