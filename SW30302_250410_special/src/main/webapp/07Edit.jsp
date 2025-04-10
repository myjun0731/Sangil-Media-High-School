<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	section{
		position: fixed;
		top: 100px;
		width: 100%;
		height: 100%;
		width: 100%;
	}
	section h1{
		text-align: center;
	}
	section p{
		margin-left: 25px;
	}
	section table{
		margin: auto;
	}
</style>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	String number = request.getParameter("custno");
	String name = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String date = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	if(grade.equals("VIP")){
		grade = "A";
	}else if(grade.equals("일반")){
		grade = "B";
	}else if(grade.equals("직원")){
		grade = "C";
	}
%>
<title>Insert</title>
</head>
<body>
	<jsp:include page="01Header.jsp"></jsp:include>
	<section>
		<h1>홈쇼핑 회원 수정</h1>
		<form action="08Edit.jsp" name="form">
			<table border="1">
				<tr>
					<th>학원번호</th>
					<td>
						<input type="text" name="number" readonly="readonly" value="<%=number%>">
					</td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td>
						<input type="text" name="name" value="<%=name%>">
					</td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td>
						<input type="text" name="phone" value="<%=phone%>">
					</td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td>
						<input type="text" name="address" value="<%=address%>">
					</td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td>
						<input type="text" name="date" value="<%=date%>">
					</td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td>
						<input type="text" name="rank" value="<%=grade%>">
					</td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td>
						<input type="text" name="code" value="<%=city%>">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<%
						 int after = Integer.parseInt(number) + 1;
						 int before = Integer.parseInt(number) - 1;
						
							
						%>
						<input type="button" value="<<=이전" onclick="location.href='0701Edit.jsp?num=<%=before%>'">
						<input type="submit" value="수 정" onclick="son(); return false;">
						<input type="button" value="조 회" onclick="location.href='05List.jsp'">
						<input type="button" value="이후=>>" onclick="location.href='0701Edit.jsp?num=<%=after%>'"> 
					</td>
				</tr>
			</table>
		</form>
		<form action="10Delete.jsp" style="text-align: center; margin-top: 10px;" onsubmit="return confirm('회원탈퇴 할거임??');">
			<input type="hidden" name="delete" value="<%=number%>">
			<input type="submit" value="회원탈퇴">
		</form>
	</section>
	<script type="text/javascript">
		function son() {
			var f = document.form;
			
			if(f.name.value == ""){
				alert("회원성명을 입력하세여!");
				f.name.focus();
				return false;				
			}else if(f.phone.value == ""){
				alert("회원전화를 입력하세여!");
				f.phone.focus();
				return false;
			}else if(f.address.value == ""){
				alert("회원주소를 입력하세여!");
				f.address.focus();
				return false;
			}else if(f.date.value == ""){
				alert("가입일자른 입력하세여!");
				f.date.focus();
				return false;
			}else if(f.rank.value == ""){
				alert("고객등급을 입력하세여!");
				f.rank.focus();
				return false;
			}else if(f.code.value == ""){
				alert("도시코드를 입력하세여!");
				f.code.focus();
				return false;
			}
			f.submit();
		}
	</script>
</body>
</html>