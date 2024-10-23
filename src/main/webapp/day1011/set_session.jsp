<%@ page contentType="text/html;charset=UTF-8" language="java" info="입력된 값을 받아서 세션에 값을 설정하는 페이지" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>set_session</title>
  <link rel="stylesheet" href="../common/css/main_20240911.css">
  <!--    bootstrap CDN  start-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
  <!--    JQuery CDN start-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

  <style>

  </style>
</head>
<body>
<div id="wrap">
<%
  String name = request.getParameter("name");
  String paramAge = request.getParameter("age");
  Integer age = null;

  // 세션에 기본 생존 시간 30분 => 바꾸기
  session.setMaxInactiveInterval(60); // 하나의 JSP에서만 설정해도 모든 JSP에 적용된다.

  if (paramAge != null && !paramAge.isEmpty()) {
    try {
      age = Integer.parseInt(paramAge);
    } catch (NumberFormatException e) {
      // 에러 처리 (로깅 등)
    }
  }

  if (name != null && !name.isEmpty()) {
    session.setAttribute("name", name);
  }
  if (age != null) {
    session.setAttribute("age", age);
  }
%>
세션에 설정된 값<a href="get_session.jsp">읽기</a>

</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
