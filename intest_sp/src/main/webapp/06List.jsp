<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        /* 
          이 코드는 웹페이지의 본문(section)과 그 안의 테이블을 예쁘게 보이게 하기 위한 스타일입니다.
          각 줄마다 무엇을 하는지 아주 쉽게 설명해드릴게요.
        */

        /* 본문 전체를 꾸며요 */
        section {
            width: 90%;           /* 본문의 너비를 화면의 90%로 설정해요 */
            margin: 0 auto;       /* 본문을 화면 가운데로 위치시켜요 */
            padding: 20px 0;      /* 위아래로 20픽셀의 안쪽 여백을 줘요 */
        }

        /* 제목을 꾸며요 */
        section h1 {
            text-align: center;   /* 제목 글씨를 가운데로 정렬해요 */
        }

        /* 테이블을 꾸며요 */
        table {
            width: 100%;          /* 테이블의 너비를 본문 너비에 맞춰요 */
            border-collapse: collapse; /* 테이블 셀의 경계를 합쳐서 깔끔하게 보여줘요 */
            margin: 20px auto;    /* 위아래로 20픽셀의 바깥 여백을 주고, 테이블을 가운데로 위치시켜요 */
        }

        /* 테이블의 헤더(th)와 데이터(td)를 꾸며요 */
        th, td {
            border: 1px solid #ccc; /* 셀의 테두리를 연한 회색으로 해요 */
            padding: 8px 12px;      /* 셀 안의 여백을 위아래 8픽셀, 좌우 12픽셀로 해요 */
            text-align: center;     /* 셀 안의 글씨를 가운데로 정렬해요 */
        }

        /* 테이블의 헤더(th)를 강조해요 */
        th {
            background-color: #f2f2f2; /* 헤더 셀의 배경색을 연한 회색으로 해요 */
        }

        /* 테이블의 짝수 행을 꾸며요 */
        tr:nth-child(even) {
            background-color: #f9f9f9; /* 짝수 행의 배경색을 아주 연한 회색으로 해요 */
        }
    </style>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	Statement stmtCode = conn.createStatement();

	String sql = "select sa.sale_num, sp.s_name, to_char(sa.sale_date, 'YYYY-MM-DD'), re.r_name, sa.sale_count, to_char(sp.s_price,'999,999'), " +
			"to_char(sum(sp.s_price*sale_count), '999,999,999') " +
			"from tbl_sales sa, tbl_specialty sp, tbl_region re " +
			"where sa.r_code = re.r_code and sa.s_code = sp.s_code " +
			"group by sa.sale_num, sp.s_name, sa.sale_date, re.r_name, sa.sale_count, sp.s_price " +
			"order by sa.sale_num";
	
	ResultSet rs = stmtCode.executeQuery(sql);
	
	String Sql2 = "select to_char(sum(sum(sp.s_price*sa.sale_count)),'999,999,999') " +
			"from tbl_specialty sp, tbl_sales sa " +
			"where sa.s_code = sp.s_code " +
			"group by sa.sale_count, sp.s_price";
	
	%>

	<jsp:include page="02Header.jsp"></jsp:include>

	<section>
	<h2>특산물 판매 내역</h2>
		<form action="05InsertDetail.jsp" name="form"
			onsubmit="return fn_submit();">
			<table border="1">
				<tr>
					<th>번호</th>
					<th>상품명</th>
					<th>판매일자</th>
					<th>지역</th>
					<th>수량</th>
					<th>단가(원)</th>
					<th>총액(원)</th>
				</tr>

				<%
				int Count = 0;
				while (rs.next()) {
					Count += rs.getInt(5);
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
				</tr>
				<%
				}
	ResultSet rs2 = stmtCode.executeQuery(Sql2);
				rs2.next();
				%>

				<tr>
					<td colspan="3"></td>

					<td style="text-align: right;">합계</td>
					<td><%=Count%></td>
					<td></td>
					<td><%=rs2.getString(1)%></td>
				</tr>
			</table>
		</form>

	</section>

	<jsp:include page="03Footer.jsp"></jsp:include>

</body>
</html>