<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>쿠키 삭제</title>
  <link rel="stylesheet" href="../common/css/main_20240911.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<div id="wrap">
  <%
    // 1. 삭제하려는 이름의 쿠키를 생성 (값은 "")
    Cookie rm1 = new Cookie("name", "");

    // 2. 파기시간을 즉시 (0)으로 설정
    rm1.setMaxAge(0);

    // 3. 접속자에게 생성된 쿠키 심기
    response.addCookie(rm1);
  %>
  <h2>쿠키가 삭제되었습니다.</h2>
  <a href="read_cookie.jsp">쿠키 읽기 페이지로 돌아가기</a>
</div>
<script>
    $(function() {
        // jQuery 코드를 여기에 작성하세요.
    });
</script>
</body>
</html>