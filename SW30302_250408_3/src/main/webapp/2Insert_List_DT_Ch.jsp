<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보 수정</title>
</head>
<body>
	<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

    Class.forName("oracle.jdbc.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

    String resvno = request.getParameter("resvno");

    // 1. 기존 jumin 조회
    String selectSql = "SELECT jumin FROM tbl_vaccresv_202109 WHERE resvno = ?";
    pstmt = con.prepareStatement(selectSql);
    pstmt.setString(1, resvno);
    rs = pstmt.executeQuery();

    String oldJumin = null;
    if (rs.next()) {
        oldJumin = rs.getString("jumin");
    }

    // 기존 pstmt/rs 닫기
    rs.close();
    pstmt.close();

    // 2. 예약 정보 업데이트
    String updateSql = "UPDATE tbl_vaccresv_202109 SET jumin = ?, vcode = ?, hospcode = ?, resvdate = ?, resvtime = ? WHERE resvno = ?";
    pstmt = con.prepareStatement(updateSql);

    pstmt.setString(1, request.getParameter("jumin"));
    pstmt.setString(2, request.getParameter("vcode"));
    pstmt.setString(3, request.getParameter("hospcode"));
    pstmt.setString(4, request.getParameter("resvdate"));
    pstmt.setString(5, request.getParameter("resvtime"));
    pstmt.setString(6, resvno);

    pstmt.executeUpdate();

    // 원래 jumin 값 로그 출력 또는 필요한 처리 가능
    System.out.println("기존 주민번호: " + oldJumin);

    response.sendRedirect("2Insert_List.jsp");
%>
</body>
</html>
