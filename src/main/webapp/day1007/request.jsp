<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>request</title>
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
  <h2>request(javax.servlet.HttpRequest) 내장객체 사용</h2>
  <ul>
    <li>요청 방식 : <%= request.getMethod()%></li>
    <li>요청 URL : <%= request.getRequestURL()%></li>
    <li>요청 Protocol : <%= request.getProtocol()%></li>
    <li>요청 서버명 : <%= request.getServerName()%></li>
    <li>요청 서버포트 : <%= request.getServerPort()%></li>
    <li>요청 ServletPath : <%= request.getServletPath()%></li>
    <li>요청 URI : <%= request.getRequestURI()%></li>
    <li>요청 스키마 : <%= request.getScheme()%></li>
    <li>요청 쿼리스트링 : <%= request.getQueryString()%></li>
    <li>접속자의 IP주소 : <%= request.getRemoteAddr()%></li>
    <li>접속자의 서버포트 : <%= request.getRemotePort()%></li>
    <li>이름이 유일한 웹 파라미터 : <%= request.getParameter("name")%></li>
    <li>이름이 중복되는 웹 파라미터 :
      <%
        String[] ages = request.getParameterValues("age");
        if(ages != null){
          for (String age : ages){
            out.print(age);
            out.print(" ");
          }
        }
      %>
    </li>
  </ul>
  <a href="request.jsp?name=kim&age=20&age=21">GET요청</a>
  <form action="request.jsp" method="post">
    <%--    자신페이지를 다시 요청할때에는 action 속성을 생략해도 된다--%>
    <input type="hidden" name="name" value="park"/>
    <input type="hidden" name="age" value="25"/>
    <input type="hidden" name="age" value="26"/>
<%--    <input type="button" name="age" value="26"/>--%>
    <button id="btn" class="btn btn-primary">POST방식의 요청</button>
  </form>
</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
