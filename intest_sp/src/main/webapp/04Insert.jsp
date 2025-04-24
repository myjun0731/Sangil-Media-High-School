<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmtCode = conn.createStatement();
	ResultSet rs = stmtCode.executeQuery("select count(*) +1 as next_seq from tbl_specialty");
	rs.next();
	int nextSeq = rs.getInt("next_seq");
	String newCode = "T"+ String.format("%02d",nextSeq);
	rs.close();
%>

 <style>
    /* 
      이 코드는 웹페이지의 본문(section)과 그 안의 폼(form)을 예쁘게 보이게 하기 위한 스타일입니다.
      각 줄마다 무엇을 하는지 아주 쉽게 설명해드릴게요.
    */

    /* 본문 전체를 꾸며요 */
    section {
      text-align: center; /* 글씨를 가운데로 정렬해요 */
      padding: 40px;      /* 안쪽 여백을 위, 아래, 왼쪽, 오른쪽 모두 40픽셀로 줘요 */
    }

    /* 폼을 꾸며요 */
    section form {
      display: inline-block; /* 폼을 인라인 블록으로 만들어요 */
      text-align: left;      /* 폼 안의 글씨는 왼쪽 정렬로 해요 */
    }

    /* 테이블을 꾸며요 */
    section table {
      margin: 0 auto;        /* 테이블을 가운데로 위치시켜요 */
      border-collapse: collapse; /* 테이블 셀의 경계를 합쳐서 깔끔하게 보여줘요 */
    }

    /* 테이블의 헤더(th)와 데이터(td)를 꾸며요 */
    th, td {
      border: 1px solid #ccc; /* 셀의 테두리를 연한 회색으로 해요 */
      padding: 8px 12px;      /* 셀 안의 여백을 위아래 8픽셀, 좌우 12픽셀로 해요 */
    }

    /* 텍스트 입력창을 꾸며요 */
    input[type="text"] {
      width: 200px;           /* 입력창의 너비를 200픽셀로 해요 */
      padding: 4px;           /* 입력창 안의 여백을 4픽셀로 해요 */
    }

    /* 버튼을 꾸며요 */
    .btn {
      padding: 6px 12px;      /* 버튼 안의 여백을 위아래 6픽셀, 좌우 12픽셀로 해요 */
      margin: 0 5px;          /* 버튼의 좌우 바깥 여백을 5픽셀로 해요 */
    }
  </style>
</head>
<body>
	<jsp:include page="02Header.jsp"></jsp:include>
	<section>
		<h2>특산물 등록</h2>
		<form action="05InsertDetail.jsp" name="form" onsubmit="return fn_submit();">
			<table border="1">
				<tr>
					<th>특산물 번호(자동생성)</th>
					<td><input type="text" name="s_code" value="<%=newCode%>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>특산물 이름</th>
					<td><input type="text" name="s_name"></td>
				</tr>
				<tr>
					<th>특산물 가격</th>
					<td><input type="text" name="s_price"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록">
						<input type="button" value="조회" onclick="location.href='06List.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<script type="text/javascript">
	function fn_submit() {
		var f = document.form;
		
		if(f.s_name.value.trim() == ""){
			alert("특산물 이름이 입력되지 않았습니다.");
			f.s_name.focus();
			return false;
		}
		if(f.s_price.value.trim() == ""){
			alert("특산물 가격이 입력되지 않았습니다.");
			f.s_price.focus();
			return false;
		}
			alert("정상적으로 등록되었습니다.");
			return true;
		
		
	}
	</script>


	<jsp:include page="03Footer.jsp"></jsp:include>
</body>
</html>