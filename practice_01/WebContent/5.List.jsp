<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
/*
아래 순서대로 따라하면 돼요! 😊
1. 데이터베이스에서 회원 목록을 가져와요.
2. <jsp:include> 태그로 Header.jsp 파일을 불러와요.
3. <h2> 태그로 '회원목록조회/수정' 제목을 만들어요.
4. <table> 태그를 사용해 회원 정보를 표로 출력해요.
5. 회원번호를 클릭하면 회원 정보 수정 페이지(6.Edit.jsp)로 이동해요.
*/
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 목록 조회</title>

    <style type="text/css">
        /* 표 안의 글자를 가운데 정렬 */
        td {
            text-align: center;
        }

        /* 링크 스타일 설정 */
        a {
            color: black;
            text-decoration: none; /* 밑줄 없애기 */
        }
    </style>
</head>
<body>

<%
    // 1. 데이터베이스 연결
    Class.forName("oracle.jdbc.OracleDriver"); // 오라클 드라이버 불러오기
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234"); // DB 연결

    // 2. 회원 목록을 가져오는 SQL 문
    String sql = "select custno, custname, phone, address, joindate, grade, city from member_tbl_03";

    // 3. SQL 실행
    ResultSet rs = conn.prepareStatement(sql).executeQuery();
%>

<!-- 2. Header.jsp 파일을 불러와서 상단 메뉴를 추가 -->
<jsp:include page="1.Header.jsp"></jsp:include>

<br>

<!-- 3. 프로그램 제목 -->
<h2 style="text-align: center;">회원목록조회/수정</h2>

<br>

<!-- 4. 회원 정보를 표로 출력 -->
<section style="display: flex; justify-content: center;">
    <table border="1" style="border-spacing: 0px;">
        <tr>
            <th>회원번호</th>
            <th>회원성명</th>
            <th>전화번호</th>
            <th>주소</th>
            <th>가입일자</th>
            <th>고객등급</th>
            <th>거주지역</th>
        </tr>

        <%
        // 5. 회원 목록을 한 줄씩 출력
        while(rs.next()) { 
        %>
        <tr>
            <!-- 회원번호를 클릭하면 6.Edit.jsp로 이동하여 정보 수정 가능 -->
            <td>
                <a href="6.Edit.jsp?custno=<%= rs.getString(1) %>
                &custname=<%= rs.getString(2) %>
                &phone=<%= rs.getString(3) %>
                &address=<%= rs.getString(4) %>
                &joindate=<%= rs.getString(5) %>
                &grade=<%= rs.getString(6) %>
                &city=<%= rs.getString(7) %>">
                <%= rs.getString(1) %></a>
            </td>
            <td><%= rs.getString(2) %></td> <!-- 회원성명 -->
            <td><%= rs.getString(3) %></td> <!-- 전화번호 -->
            <td><%= rs.getString(4) %></td> <!-- 주소 -->
            <td><%= rs.getString(5).substring(0, 10) %></td> <!-- 가입일자 (날짜만 표시) -->
            <td><%= rs.getString(6) %></td> <!-- 고객등급 -->
            <td><%= rs.getString(7) %></td> <!-- 거주지역 -->
        </tr>
        <%
        }
        %>
    </table>
</section>

</body>
</html>
