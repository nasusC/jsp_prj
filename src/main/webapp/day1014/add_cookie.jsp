<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>쿠키 추가</title>
  <link rel="stylesheet" href="../common/css/main_20240911.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<div id="wrap">
  <%
    // 1. 쿠키를 생성 (한글 값은 인코딩)
    Cookie cookie = new Cookie("name", URLEncoder.encode("차성호", "UTF-8"));
    // 2. 생존시간 설정
    cookie.setMaxAge(60*2);
    // 3. 쿠키 심기
    response.addCookie(cookie);
  %>
  <h2>쿠키 심기 완료.</h2>
  <a href="read_cookie.jsp">쿠키 읽기</a>
</div>
<script>
    $(function() {
        // jQuery 코드를 여기에 작성하세요.
    });
</script>
</body>
</html>