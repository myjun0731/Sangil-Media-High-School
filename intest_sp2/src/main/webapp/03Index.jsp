<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

h2{
padding: 20px 0;
}
section {
	text-align: center;
	padding: 40px;
}

section form {
	display: inline-block;
	text-align: left;
}

section table {
	margin: 0 auto;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ccc;
	padding: 8px 12px;
}

input[type="text"] {
	width: 200px;
	padding: 4px;
}

.btn {
	padding: 6px 12px;
	margin: 0 5px;
}
</style>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<section>
		<h2>지역별 특산물 매출관리 프로그램</h2>
		<p>
			지역별 특산물 팬매를 관리하기 위한 프로그램입니다. <br> <br> 1. 특산물 정보 테이블, 지역 정보
			테이블, 판매테이블을 추가한다. <br> 2. 특산물 등록, 특산물 판매현황, 지역별판매액, 특산물 판매액 페이지를
			작성한다.<br> 3. 올바르게 구현되었는지 확인한다.
		</p>
	</section>
</body>
</html>