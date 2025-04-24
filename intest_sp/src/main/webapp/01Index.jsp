<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
section {
	text-align: center;
	padding: 40px;
	width: 90%;
	margin: 0 auto;
}
section h2 {
	font-size:25px;
	margin-bottom: 20px; 
}
section p {
	font-size: 21px;
	line-height: 2;
}
</style>
</head>
<body>
<jsp:include page="02Header.jsp"></jsp:include>
<section>
<h2>
	지역별 특산물 매출관리 프로그램
</h2>
	<p>
		지역별 특산물 팬매를 관리하기 위한 프로그램입니다. <br><br>
		
		1. 특산물 정보 테이블, 지역 정보 테이블, 판매테이블을 추가한다. <br>
		2. 특산물 등록, 특산물 판매현황, 지역별판매액, 특산물 판매액 페이지를 작성한다.<br>
		3. 올바르게 구현되었는지 확인한다.
	</p>
</section>
<jsp:include page="03Footer.jsp"></jsp:include>
</body>
</html>