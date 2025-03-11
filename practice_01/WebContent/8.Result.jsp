<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
/*
아래 순서대로 따라하면 돼요! 😊
1. 데이터베이스에서 회원 매출 정보를 가져와요.
2. <jsp:include> 태그로 Header.jsp 파일을 불러와요.
3. <h2> 태그로 '회원정보조회' 제목을 만들어요.
4. <table> 태그를 사용해 회원 매출 정보를 표로 출력해요.
*/
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 매출 조회</title>

    <style type="text/css">
        /* 표 안의 글자를 가운데 정렬 */
        td {
            text-align: center;
        }
    </style>
</head>
<body>

<%
    // 1. 데이터베이스 연결
    Class.forName("oracle.jdbc.OracleDriver"); // 오라클 드라이버 불러오기
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234"); // DB 연결

    // 2. 회원별 총 매출을 조회하는 SQL 문
    String sql = "select mem.custno, mem.custname, mem.grade, sum(mon.amount * mon.pcost) as total "
                + "from member_tbl_03 mem, money_tbl_03 mon "
                + "where mem.custno = mon.custno "
                + "group by mem.custno, mem.custname, mem.grade "
                + "order by mem.custno";

    // 3. SQL 실행
    ResultSet rs = conn.prepareStatement(sql).executeQuery();
%>

<!-- 2. Header.jsp 파일을 불러와서 상단 메뉴를 추가 -->
<jsp:include page="1.Header.jsp"></jsp:include>

<br>

<!-- 3. 프로그램 제목 -->
<h2 style="text-align: center;">회원정보조회</h2>

<br>

<!-- 4. 회원 매출 정보를 표로 출력 -->
<section style="display: flex; justify-content: center;">
    <table border="1" style="border-spacing: 0px;">
        <tr>
            <th>회원번호</th>
            <th>회원성명</th>
            <th>고객등급</th>
            <th>매출</th>
        </tr>

        <%
        // 5. 조회된 회원 정보를 한 줄씩 출력
        while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getString(1) %></td> <!-- 회원번호 -->
            <td><%= rs.getString(2) %></td> <!-- 회원성명 -->
            <td><%= rs.getString(3) %></td> <!-- 고객등급 -->
            <td><%= rs.getString(4) %></td> <!-- 총 매출 -->
        </tr>
        <%
        }
        %>
    </table>
</section>

</body>
</html>
