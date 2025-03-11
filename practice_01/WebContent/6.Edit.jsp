<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
/*
아래 순서대로 따라하면 돼요! 😊
1. <jsp:include> 태그로 Header.jsp 파일을 불러와요.
2. <form> 태그를 사용해 회원 정보를 수정할 수 있는 입력칸을 만들어요.
3. 수정할 회원 정보를 request.getParameter()로 가져와서 입력칸에 표시해요.
4. 수정 버튼을 누르면 회원 정보가 7.EditConfirm.jsp로 전송돼요.
*/
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>홈쇼핑 회원 정보 수정</title>
</head>
<body>

<%
    // 1. 회원 정보를 요청(request)에서 가져오기
    String custno = request.getParameter("custno");     // 회원번호
    String custname = request.getParameter("custname"); // 회원성명
    String phone = request.getParameter("phone");       // 회원전화
    String address = request.getParameter("address");   // 회원주소
    String joindate = request.getParameter("joindate"); // 가입일자
    String grade = request.getParameter("grade");       // 고객등급
    String city = request.getParameter("city");         // 도시코드
%>

<!-- 2. Header.jsp 파일을 불러와서 상단 메뉴를 추가 -->
<jsp:include page="1.Header.jsp"></jsp:include>

<br>

<!-- 3. 프로그램 제목 -->
<h2 style="text-align: center;">홈쇼핑 회원 정보 수정</h2>

<br>

<!-- 4. 회원 정보 수정 폼 -->
<section style="display: flex; justify-content: center;">
    <form action="7.EditConfirm.jsp">
        <table border="1" style="border-spacing: 0px;">
            <tr>
                <th>회원번호 (자동 생성)</th>
                <td><input type="text" readonly name="custno" value="<%=custno%>"></td>
            </tr>

            <tr>
                <th>회원성명</th>
                <td><input type="text" name="custname" value="<%=custname%>"></td>
            </tr>

            <tr>
                <th>회원전화</th>
                <td><input type="text" name="phone" value="<%=phone%>"></td>
            </tr>

            <tr>
                <th>회원주소</th>
                <td><input type="text" name="address" value="<%=address%>"></td>
            </tr>

            <tr>
                <th>가입일자</th>
                <td><input type="text" name="joindate" value="<%=joindate.substring(0, 10)%>"></td>
            </tr>

            <tr>
                <th>고객등급 [A: VIP, B: 일반, C: 직원]</th>
                <td><input type="text" name="grade" value="<%=grade%>"></td>
            </tr>

            <tr>
                <th>도시코드</th>
                <td><input type="text" name="city" value="<%=city%>"></td>
            </tr>

            <!-- 5. 수정 버튼과 회원 목록 조회 버튼 -->
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" value="수정">
                    <a href="5.List.jsp">조회</a> <!-- 회원 목록 페이지로 이동 -->
                </td>
            </tr>
        </table>
    </form>
</section>

</body>
</html>
