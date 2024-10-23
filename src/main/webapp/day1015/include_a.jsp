<%@ page contentType="text/html;charset=UTF-8" language="java" info="공통디자인을 사용하는 페이지" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>include_a</title>
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
    #title{
        color: red;
        font-size: 25px;
    }

  </style>
</head>
<body>
<div id="wrap">

  <div id="header">
    <jsp:include page="header.jsp"></jsp:include>

  </div>
  <div id="container">
    <br>
    사용자에게 제공하는 내용 : <%--<%=msg%>--%>
    <a href="include_a.jsp?birth=20241015">요청</a>
    <br>
    요청값 : ${param.birth}
  </div>
  <div id="footer">
    <br>
    <jsp:include page="footer.jsp"></jsp:include>
  </div>
</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
