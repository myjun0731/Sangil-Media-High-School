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
	
	String sql = "select max(custno+1) from member_tbl_02";
	
	ResultSet rs = con.prepareStatement(sql).executeQuery();
	
	rs.next();
%>
<title>Insert</title>
</head>
<body>
	<jsp:include page="01Header.jsp"></jsp:include>
	
	<section>
		<h1>홈쇼핑 회원 등록</h1>
		<form action="04InserConfirm.jsp" name="form">
			<table border="1">
				<tr>
					<th>학원번호(자동발생)</th>
					<td>
						<input type="text" name="number" readonly="readonly" value="<%=rs.getString(1)%>">
					</td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td>
						<input type="text" name="name">
					</td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td>
						<input type="text" name="phone">
					</td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td>
						<input type="text" name="address">
					</td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td>
						<input type="text" name="date">
					</td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td>
						<input type="text" name="rank">
					</td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td>
						<input type="text" name="code">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="등 록" onclick="son(); return false;">
						<input type="button" value="조 회" onclick="location.href='01Header.jsp'"> 
					</td>
				</tr>
			</table>
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