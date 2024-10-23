<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>쿠키 읽기</title>
  <link rel="stylesheet" href="../common/css/main_20240911.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<div id="wrap">
  <%
    // 1. 쿠키들 읽기
    Cookie[] cookies = request.getCookies();
    boolean readFlag = false;
    if (cookies != null) {
      for (Cookie cookie : cookies) {
        String cookieName = cookie.getName();
        if (!"JSESSIONID".equals(cookieName)) {
          readFlag = true;
          String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
  %>
  쿠키명: <%=cookieName%>, 쿠키값: <%=cookieValue%> <br>
  <%
        }
      }
    }
    if (!readFlag) {
  %>
  <h2>쿠키가 존재하지 않습니다.</h2>
  <a href="add_cookie.jsp">쿠키 심기</a>
  <%
  } else {
  %>
  <h2>쿠키 삭제</h2>
  <a href="remove_cookie.jsp">쿠키 삭제하기</a>
  <%
    }
  %>
</div>
<script>
    $(function() {
        // jQuery 코드를 여기에 작성하세요.
    });
</script>
</body>
</html>