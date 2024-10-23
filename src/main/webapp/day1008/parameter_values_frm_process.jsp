<%@ page contentType="text/html;charset=UTF-8" language="java" info="이름이 중복되는 HTML Form Control 값 받기" %>
<%
  //POST 방식일 때 한글처리
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>parameter_values_frm_process</title>
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
      .blue {
          color: blue
      }

      .red {
          color: red
      }

  </style>
</head>
<body>
<div id="wrap">
  <%
    String method = request.getMethod();
    String css = "blue";
    if ("POST".equals(method)) {
      css = "red";
    }
  %>
  <h2><span class="<%=css%>"><%=method%></span></h2>
  <%
    String gender = request.getParameter("gender");
    String[] hobbies = request.getParameterValues("hobby");

  %>
  <ul>
    <li>성별 : <%=gender%>
    </li>
    <% if(hobbies== null) {%>
    <li>선택한 취미가 없습니다.</li>
    <%} else {%>
    <li>취미 :
      <%for(String hobby : hobbies){
        out.print(hobby);
      }
    }%></li>
  </ul>


</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
