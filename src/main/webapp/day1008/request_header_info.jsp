<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>request_header_info</title>
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
  <ul
  <%
    //1. protocol header의 이름 Enumeration 얻기.
    String headerName = "";
    Enumeration<String> en = request.getHeaderNames();
    while(en.hasMoreElements()){
        headerName=en.nextElement();
  %>
  <li><strong><%= headerName%></strong> :
  <%= request.getHeader(headerName)%></li>
  <%
    }
  %>
  </ul>


</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
