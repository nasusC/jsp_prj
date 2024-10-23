<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="redirect 사용" %>
<%
  boolean flag = new Random().nextBoolean();
  if (flag) { // 세션의 값이 존재하는 지 유무를 판단기준으로 사용한다.
    response.sendRedirect("redirect_b.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>redirect_a</title>
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
  정상적인 내용이 있을때 제공할 내용들.
</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
<%
  System.out.println("---------------코드실행------------------");
%>
