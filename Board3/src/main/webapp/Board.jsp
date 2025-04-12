<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 Ver1.0</title>
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
}
.content-section {
	display: flex;
	margin-top: 80px;
}
.sidebar {
	width: 300px;
	background-color: #dcdde1;
	min-height: calc(100vh - 80px);
}
</style>
</head>
<body>
	<jsp:include page="Header.jsp" />

	<section class="content-section">
		<div style="padding: 40px; flex: 1;">

			<!-- 검색 폼 -->
			<div style="display: flex; justify-content: center; margin-bottom: 20px;">
				<form action="Search.jsp" method="get" style="display: flex; gap: 10px;">
					<input type="text" name="keyword" placeholder="검색어를 입력하세요"
						style="padding: 10px 15px; width: 300px; border: 1px solid #ccc; border-radius: 6px;" />
					<button type="submit"
						style="padding: 10px 20px; background-color: #1f2a40; color: white; border: none; border-radius: 6px; cursor: pointer;">
						검색</button>
				</form>
			</div>

			<!-- 태그 필터 버튼 -->
			<div style="display: flex; justify-content: center; overflow-x: auto; white-space: nowrap; margin-bottom: 30px; padding: 10px 0;">
				<%
					String[] tags = { "전체", "개발", "디자인", "마케팅", "여행" };
					for (int i = 0; i < tags.length; i++) {
						String actionPage = (i == 0) ? "Board.jsp" : "BoardTag.jsp";
						String tagValue = (i == 0) ? "all" : String.valueOf(i);
				%>
				<form action="<%= actionPage %>" method="get" style="display: inline-block;">
					<button type="submit" name="tag" value="<%= tagValue %>"
						style="display: inline-block; margin-right: 10px; padding: 8px 16px; border: none; border-radius: 20px;
							background-color: <%= (i == 0) ? "#1f2a40" : "#dcdde1" %>; color: <%= (i == 0) ? "white" : "#2c3e50" %>; 
							cursor: pointer; font-size: 14px;">
						<%= tags[i] %>
					</button>
				</form>
				<% } %>
			</div>

			<!-- 게시글 테이블 -->
			<table style="width: 100%; border-collapse: collapse; background-color: white; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);">
				<thead>
					<tr style="background-color: #1f2a40; color: white;">
						<th style="padding: 12px;">번호</th>
						<th style="padding: 12px;">제목</th>
						<th style="padding: 12px;">작성자</th>
						<th style="padding: 12px;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs2 = null;

					try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
						String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 또는 :orcl, DB에 맞게 조정
						String user = "system";
						String password = "1234";

						con = DriverManager.getConnection(url, user, password);
						String sql2 = "SELECT bid, title, mname, TO_CHAR(bdate, 'YY-MM-DD') AS bdate, mid FROM board_tbl ORDER BY bid";
						pstmt = con.prepareStatement(sql2);
						rs2 = pstmt.executeQuery();

						while (rs2.next()) {
					%>
					<tr style="text-align: center; border-bottom: 1px solid #ddd;">
						<td style="padding: 12px;"><%= rs2.getString("bid") %></td>
						<td style="padding: 12px;"><a
							href="view.jsp?id=<%= rs2.getString("bid") %>&&mid=<%= rs2.getString("mid") %>"
							style="text-decoration: none; color: #2c3e50;"><%= rs2.getString("title") %></a></td>
						<td style="padding: 12px;"><%= rs2.getString("mname") %></td>
						<td style="padding: 12px;"><%= rs2.getString("bdate") %></td>
					</tr>
					<%
						}
					} catch (Exception e) {
						out.println("<tr><td colspan='4' style='padding: 12px; text-align: center;'>데이터를 불러오는 중 오류 발생: " + e.getMessage() + "</td></tr>");
					} finally {
						try { if (rs2 != null) rs2.close(); } catch (Exception e) {}
						try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
						try { if (con != null) con.close(); } catch (Exception e) {}
					}
					%>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>
