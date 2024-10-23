<%@ page import="day1016.CounterVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="scope의 생성 및 사용범위" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>use_scope</title>
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
  <%--  객체생성--%>
  <%--  page - JSP페이지가 요청될때마다 객체 생성, 생성된 객체는 해당 JSP에서만 사용된다.--%>
  <%--  request - JSP페이지가 요청될때마다 객체 생성, 생성된 객체는 해당 JSP와 forward로 이동한 JSP에서 사용가능--%>
  <%--  session - 웹 브라우저마다 하나의 객체가 생성, 생성된 객체는 모든 JSP에서 사용 가능.--%>
  <%--  application - 최초 접속자에 의해 단 하나의 객체가 생성, 생성된 객체는 모든 JSP에서 사용 가능.--%>
  <%--                모든 접속자는 하나의 객체를 사용한다--%>
  <jsp:useBean id="cVO" class="day1016.CounterVO" scope="application"/>
  <%--  setter 호출--%>
  <jsp:setProperty property="cnt" name="cVO" value="1"/>
  당신은 이 페이지에 <strong>
  <jsp:getProperty name="cVO" property="cnt"/>
</strong>번째 방문자 입니다.
  <a href="use_scope2.jsp">이동</a>
  <%
    String cnt = Integer.toString(cVO.getCnt());
    for (int i = 0; i<cnt.length(); i++) {%>
    <img src="images/num_<%=cnt.charAt(i)%>.png" alt="">
  <%
    }
  %>
  <%--  <%--%>
  <%--    RequestDispatcher rd = request.getRequestDispatcher("use_scope2.jsp");--%>
  <%--    rd.forward(request, response);--%>
  <%--  %>--%>
</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
