<%@ page contentType="text/html;charset=UTF-8" language="java" info="web param을 useBean action을 통해 VO로 손쉽게 받기" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>bean_parameter_frm_process</title>
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
  <%request.setCharacterEncoding("UTF-8");%>
  <%-- 1. VO객체를 생성--%>
  <jsp:useBean id="fcVO" class="day1016.FormControlVO" scope="page"/>
  <%-- 2. setter 메소드 호출(*을 설정하면 Web param명과 VO의 인스턴스 변수이름이 같은 것을 모두 가져옴)--%>
  <jsp:setProperty name="fcVO" property="*"/>
  <h2>입력값</h2>
  <ul>
    <li>이름 :
      <jsp:getProperty property="name" name="fcVO"/>
    </li>
    <li>나이 :
      <jsp:getProperty property="age" name="fcVO"/>
    </li>
    <li>성별 :
      <jsp:getProperty property="gender" name="fcVO"/>
    </li>
    <li>취미 :
    <%
      String[] hobby = fcVO.getHobby();
      if (hobby == null) {
        out.println("<strong>선택한 취미가 없습니다.</strong>");
      } else {
        for (String temp : hobby) {
          out.print(temp +",");
        }
      }

    %>
    </li>
  </ul>
</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
