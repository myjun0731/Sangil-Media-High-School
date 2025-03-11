<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
/*
아래 순서대로 따라하면 돼요! 😊
1. 데이터베이스와 연결해요.
2. <form>에서 입력된 회원 정보를 가져와요.
3. SQL 문을 사용해 회원 정보를 데이터베이스에서 수정해요.
4. 회원 수정이 성공하면 알림창을 띄우고 목록 페이지로 이동해요.
*/
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정 확인</title>
</head>
<body>

<%
    // 1. 오라클 데이터베이스에 연결
    Class.forName("oracle.jdbc.OracleDriver"); // 오라클 드라이버 불러오기
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234"); // DB 연결

    int result = 0; // 회원 수정 결과 저장 (성공: 1, 실패: 0)

    // 2. 회원 정보를 수정하는 SQL 문 작성
    String sql = "update member_tbl_03 set custname = ?, phone = ?, address = ?, joindate = ?, grade = ?, city = ? where custno = ?";

    // 3. SQL 실행을 위한 준비
    PreparedStatement pstmt = conn.prepareStatement(sql);

    // 4. 수정할 회원 정보 가져와서 SQL 문에 넣기
    pstmt.setString(1, request.getParameter("custname")); // 회원성명
    pstmt.setString(2, request.getParameter("phone"));   // 회원전화
    pstmt.setString(3, request.getParameter("address")); // 회원주소
    pstmt.setString(4, request.getParameter("joindate"));// 가입일자
    pstmt.setString(5, request.getParameter("grade"));   // 고객등급 (A, B, C)
    pstmt.setString(6, request.getParameter("city"));    // 도시코드
    pstmt.setString(7, request.getParameter("custno"));  // 회원번호 (어떤 회원을 수정할지)

    // 5. SQL 실행 (회원 정보 수정 수행)
    result = pstmt.executeUpdate();

    // 6. 회원 수정이 성공했을 때 실행할 코드
    if(result == 1) {
%>
    <script type="text/javascript">
        alert("회원수정이 완료되었습니다!"); // 알림창 띄우기
        location = "5.List.jsp"; // 회원 목록 페이지로 이동
    </script>
<%
    }
%>

</body>
</html>
