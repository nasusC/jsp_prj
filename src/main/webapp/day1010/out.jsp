<%@ page contentType="text/html;charset=UTF-8" language="java" info="out 내장객체의 사용" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>out</title>
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
    String msg = "오늘은 목요일 입니다.";
    out.print("<strong>");
    out.print(msg);
    out.print("</strong>");
    out.println("<br>");

    out.println("<strong>");
    out.println(msg);
    out.println("</strong>");

    for (int i = 1; i < 7; i++) {
      out.print("<h");
      out.print(i);
      out.print(">");
      out.print(msg);
      out.print("</h");
      out.print(i);
      out.println(">");
    }

    String[] url = {"http://google.com","http://naver.com","http://daum.net"};
    String[] urlText = {"구글","네이버","다음"};
    for (int i = 0; i < url.length; i++) {
      out.print("<a href='");
      out.print(url[i]);
      out.print("'>");
      out.print(urlText[i]);
      out.println("</a>");
    }
  %>

</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
