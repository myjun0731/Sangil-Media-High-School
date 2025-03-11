<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
/*
아래 순서대로 따라하면 돼요! 😊
1. <h1> 태그로 제목을 만들어요.
2. <nav> 태그로 메뉴(버튼들)를 만들어요.
3. <footer> 태그로 아래쪽에 저작권 표시를 해요.
4. <header> 태그로 페이지의 맨 위 부분을 꾸며요.
5. <style> 태그로 글자 크기와 색상을 정해요.
*/
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쇼핑몰 회원관리</title>

    <style type="text/css">
        /* 모든 요소의 크기를 자동으로 조정하고, 여백을 없애요 */
        * {
            box-sizing: border-box;
            margin: 0;
        }

        /* 메뉴 버튼(링크) 스타일 */
        .HeadA {
            text-decoration: none; /* 밑줄 없애기 */
            color: white; /* 글자색을 흰색으로 */
            padding-left: 10px; /* 왼쪽 여백 */
            font-size: 20px; /* 글자 크기 */
        }
    </style>
</head>
<body>

    <!-- 페이지의 맨 위, 제목 부분 -->
    <header style="background: silver; width: 100%; padding: 20px 0;">
        <h1 style="text-align: center;">쇼핑몰 회원관리 ver 1.0</h1>
    </header>

    <!-- 메뉴(네비게이션) 영역 -->
    <nav style="background: black; width: 100%; padding: 15px 0;">
        <a href="3.Regi.jsp" class="HeadA">회원등록</a> <!-- 회원 등록 페이지로 이동 -->
        <a href="5.List.jsp" class="HeadA">회원목록조회/수정</a> <!-- 회원 목록을 보고 수정 가능 -->
        <a href="8.Result.jsp" class="HeadA">회원매출조회</a> <!-- 회원의 매출 정보를 확인 -->
        <a href="2.Index.jsp" class="HeadA">홈으로</a> <!-- 홈 페이지로 이동 -->
    </nav>

    <!-- 페이지의 맨 아래, 저작권 표시 부분 -->
    <footer style="position: absolute; bottom: 0; background: silver; width: 100%; padding: 20px 0;">
        <h2 style="text-align: center;">HRDKOREA COPYRIGHT @ 2016 all right reserved dohoon kim</h2>
    </footer>

</body>
</html>
