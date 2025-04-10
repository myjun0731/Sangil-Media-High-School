<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
</head>
<body>
	<jsp:include page="Header.jsp" />

	<%
	String custnoParam = request.getParameter("custno");
	int custno = Integer.parseInt(custnoParam);
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	// 전체 회원번호 목록
	ArrayList<Integer> memberList = new ArrayList<>();
	PreparedStatement psList = con.prepareStatement("SELECT custno FROM member_tbl_02 ORDER BY custno");
	ResultSet rsList = psList.executeQuery();
	while (rsList.next()) {
	memberList.add(rsList.getInt("custno"));
	}
	int index = memberList.indexOf(custno);
	int prev = Math.max(index - 1, 0);
	int next = Math.min(index + 1, memberList.size() - 1);
	
	// 선택된 회원 정보 조회
	String sql = "SELECT custno, custname, phone, address, to_char(joindate,'YYYY-MM-DD') as joindate, "
			+ "CASE grade WHEN 'A' THEN 'VIP' WHEN 'B' THEN '일반' WHEN 'C' THEN '직원' END as grade, city "
			+ "FROM member_tbl_02 WHERE custno = ?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, custno);
	ResultSet rs = ps.executeQuery();

	if (rs.next()) {
	%>
		<h2 style="text-align: center; padding: 20px;">홈쇼핑 회원 수정</h2>
	<section style="justify-content: center; display: flex;">
		<form action="2Member_list_Update.jsp" name="form">
			<table border="1">
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="number" readonly
						value="<%=rs.getString("custno")%>"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="name"
						value="<%=rs.getString("custname")%>"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone"
						value="<%=rs.getString("phone")%>"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address"
						value="<%=rs.getString("address")%>"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="date"
						value="<%=rs.getString("joindate")%>"></td>
				</tr>
				<tr>
					<th>고객등급</th>
					<td><input type="text" name="rank"
						value="<%=rs.getString("grade")%>"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="code"
						value="<%=rs.getString("city")%>"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="button" value="이전" onclick="location.href='2Member_list_Detail.jsp?custno=<%=memberList.get(prev)%>'">
						<input type="submit" value="수정" onclick="return validateForm();">
						<input type="button" value="조회" onclick="location.href='2Member_list.jsp'"> <input type="button" value="다음" onclick="location.href='2Member_list_Detail.jsp?custno=<%=memberList.get(next)%>'">
					</td>
				</tr>
			</table>
		</form>
	</section>
		<form action="2Member_list_Delete.jsp" method="post" style="text-align: center; margin-top: 10px;"
			onsubmit="return confirm('회원탈퇴 하시겠습니까?');">
			<input type="hidden" name="custno" value="<%=custno%>"> <input
				type="submit" value="회원탈퇴">
		</form>
	<%
	}
	con.close();
	%>

	<script>
		function validateForm() {
			const f = document.form;
			const fields = [ "name", "phone", "address", "date", "rank", "code" ];
			const labels = [ "회원성명", "회원전화", "회원주소", "가입일자", "고객등급", "도시코드" ];

			for (let i = 0; i < fields.length; i++) {
				if (f[fields[i]].value.trim() === "") {
					alert(labels[i] + "을(를) 입력하세요!");
					f[fields[i]].focus();
					return false;
				}
			}
			return true;
		}
	</script>
</body>
</html>
