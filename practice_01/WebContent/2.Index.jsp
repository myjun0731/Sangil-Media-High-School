<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
/*
아래 순서대로 따라하면 돼요! 😊
1. <jsp:include> 태그로 Header.jsp 파일을 불러와요.
2. <h2> 태그로 프로그램 제목을 만들어요.
3. <p> 태그로 프로그램 설명을 적어요.
4. <p> 태그를 사용해 회원관리 프로그램을 만드는 순서를 정리해요.
5. <style> 태그로 글자의 크기를 정해요.
*/
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쇼핑몰 회원관리 프로그램</title>

    <style type="text/css">
        /* 글자 크기를 크게 설정 */
        p {
            font-size: 20px;
        }
    </style>
</head>
<body>

    <!-- 1. Header.jsp 파일을 불러와서 상단 메뉴를 추가 -->
    <jsp:include page="1.Header.jsp"></jsp:include>
    
    <br> <!-- 줄 바꿈 -->
    
    <!-- 2. 프로그램 제목 -->
    <h2 style="text-align: center;">쇼핑몰 회원관리 프로그램</h2>
    
    <br>

    <!-- 3. 프로그램 설명 -->
    <p>이 프로그램은 쇼핑몰의 회원정보와 매출정보를 저장하는 데이터베이스를 만들고, 회원을 관리할 수 있도록 해줍니다.</p>
    
    <!-- 4. 프로그램을 만드는 순서 -->
    <p><strong>회원관리 작성 순서</strong></p>
    <p>1. 회원정보를 저장할 테이블을 만든다.</p>
    <p>2. 회원이 구매한 매출정보를 저장할 테이블을 만든다.</p>
    <p>3. 문제지에 나와 있는 예제 데이터를 추가한다.</p>
    <p>4. 회원 정보를 입력할 수 있는 화면을 만든다.</p>
    <p>5. 회원 정보를 조회(검색)할 수 있는 화면을 만든다.</p>
    <p>6. 회원 매출 정보를 조회(검색)할 수 있는 화면을 만든다.</p>

</body>
</html>
