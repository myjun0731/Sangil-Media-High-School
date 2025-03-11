<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
/*
아래 순서대로 따라하면 돼요! 😊
1. 데이터베이스에서 회원번호를 자동으로 가져와요.
2. <jsp:include> 태그로 Header.jsp 파일을 불러와요.
3. <h2> 태그로 '홈쇼핑 회원 등록' 제목을 만들어요.
4. <form> 태그를 사용해 회원 정보를 입력하는 칸을 만들어요.
5. <script> 태그로 입력되지 않은 값이 있으면 경고창을 띄워요.
*/
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>홈쇼핑 회원 등록</title>
</head>
<body>

<%
    // 1. 데이터베이스 연결
    Class.forName("oracle.jdbc.OracleDriver"); // 오라클 데이터베이스 드라이버 불러오기
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234"); // DB 연결

    // 2. 현재 가장 큰 회원번호를 찾아 +1 해서 새로운 회원번호로 설정
    String sql = "select max(custno)+1 from member_tbl_03";
    ResultSet rs = conn.prepareStatement(sql).executeQuery();
    rs.next();
%>

<!-- 2. Header.jsp 파일을 불러와서 상단 메뉴를 추가 -->
<jsp:include page="1.Header.jsp"></jsp:include>

<br>

<!-- 3. 프로그램 제목 -->
<h2 style="text-align: center;">홈쇼핑 회원 등록</h2>

<br>

<!-- 4. 회원 등록 폼 (회원 정보를 입력하는 칸) -->
<section style="display: flex; justify-content: center;">
    <form action="4.Regiconfirm.jsp" name="form">
        <table border="1" style="border-spacing: 0px;">
            <tr>
                <th>회원번호 (자동 생성)</th>
                <td><input type="text" readonly name="custno" value="<%=rs.getString(1)%>"></td>
            </tr>

            <tr>
                <th>회원성명</th>
                <td><input type="text" name="custname"></td>
            </tr>

            <tr>
                <th>회원전화</th>
                <td><input type="text" name="phone"></td>
            </tr>

            <tr>
                <th>회원주소</th>
                <td><input type="text" name="address"></td>
            </tr>

            <tr>
                <th>가입일자</th>
                <td><input type="text" name="joindate"></td>
            </tr>

            <tr>
                <th>고객등급 [A: VIP, B: 일반, C: 직원]</th>
                <td><input type="text" name="grade"></td>
            </tr>

            <tr>
                <th>도시코드</th>
                <td><input type="text" name="city"></td>
            </tr>

            <!-- 5. 등록 버튼 -->
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" value="등록" onclick="fn_submit(); return false;">
                    <a href="5.List.jsp">조회</a> <!-- 회원 목록 페이지로 이동 -->
                </td>
            </tr>
        </table>
    </form>
</section>

<!-- 5. 입력값이 비어있으면 경고창을 띄우는 기능 -->
<script type="text/javascript">
function fn_submit() {
    var f = document.form;

    // 각 입력칸이 비어있는지 확인하고, 비어있으면 경고창을 띄운 후 입력칸으로 이동
    if(f.custname.value == "") {
        alert("회원성명이 입력되지 않았습니다!");
        f.custname.focus(); return false;
    }
    if(f.phone.value == "") {
        alert("회원전화가 입력되지 않았습니다!");
        f.phone.focus(); return false;
    }
    if(f.address.value == "") {
        alert("회원주소가 입력되지 않았습니다!");
        f.address.focus(); return false;
    }
    if(f.joindate.value == "") {
        alert("가입일자가 입력되지 않았습니다!");
        f.joindate.focus(); return false;
    }
    if(f.grade.value == "") {
        alert("고객등급이 입력되지 않았습니다!");
        f.grade.focus(); return false;
    }
    if(f.city.value == "") {
        alert("도시코드가 입력되지 않았습니다!");
        f.city.focus(); return false;
    }
    f.submit(); // 모든 값이 입력되었으면 폼을 제출
}
</script>

</body>
</html>
