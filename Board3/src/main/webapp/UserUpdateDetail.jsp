<%@ page import="java.sql.*"%>
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
		
		int result = 0;
		String mid1 = request.getParameter("mid1");
		String sql = "update member_tbl set mid=?, mpw=? where mid = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("mid"));
		pstmt.setString(2, request.getParameter("mpw"));
		pstmt.setString(3, mid1);
		
		result = pstmt.executeUpdate();
		if(result == 1) {
			
	%>
	<script type="text/javascript">
		alert("회원수정 성공");
		location = "Board.jsp";
	</script>
	<%
		}
	%>
</body>
</html>