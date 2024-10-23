<%@ page import="day1016.TestVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="useBean 표준액션태그의 사용" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>use_bean</title>
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
    // 1. 생성(객체화)
    TestVO tVO = new TestVO();

    // 2. scope객체에 할당
    pageContext.setAttribute("tVO",tVO);

    // 3. setter 메소드 호출(값 할당)
    tVO.setName("김지훈");
    tVO.setMyAge(20);

  %>
  tVO<br>
  이름 : <%=tVO.getName()%><br>
  나이 : <%=tVO.getMyAge()%><br>

  <%
    //scope 객체에 저장된 값 얻기
    TestVO tVO2 = (TestVO) pageContext.getAttribute("tVO");
  %>
  tVO2<br>
  이름 : <%=tVO2.getName()%><br>
  나이 : <%=tVO2.getMyAge()%><br>
  <h2>useBean 표준액션 사용</h2>
<%--  객체화 + scope 할당--%>
  <jsp:useBean id="tVO3" class="day1016.TestVO" scope="page"/>
<%--  setter method로 값 할당--%>
  <jsp:setProperty name="tVO3" property="name" value="차성호"/>
  <jsp:setProperty name="tVO3" property="myAge" value="25"/>
<%--  getter method로 값 얻기--%>
  이름 : <jsp:getProperty name="tVO3" property="name"/><br>
  나이 : <jsp:getProperty name="tVO3" property="myAge"/><br>
  <%
    tVO3.setName("정미영");
    tVO3.setMyAge(19);
  %>
  이름 : <jsp:getProperty name="tVO3" property="name"/><br>
  나이 : <jsp:getProperty name="tVO3" property="myAge"/><br>

</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
