<%@ page contentType="text/html;charset=UTF-8" language="java" info="세션에 설정된 값을 얻는 페이지" session="true" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>get_session</title>
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
    // 세션은 내장객체이므로, scriptlet이나 expression에서 사용가능
    // 1. 세션의 값 읽기
    String name = (String)session.getAttribute("name");
    Integer age = (Integer) session.getAttribute("age");
  %>
  <%if(name==null || age==null){%>
  세션에 값이 존재하지 않습니다. <br>
  <form action="set_session.jsp">
    <label for="name">이름</label>
    <input type="text" name="name" id="name"/><br>
    <label for="age">나이</label>
    <select name="age" id="age">
      <%for (int i = 20; i < 40; i++) {%>
      <option value="<%=i%>"><%=i%></option>
      <%}%>
    </select>
  <button class="btn btn-primary">입력</button>
  </form>
  <%}else{%>
  세션에 값이 있습니다.<br>
  <button type="button" class="btn btn-primary">
    <%=name%>님 안녕하세요 ? 나이는<%=age%>입니다.<span class="badge text-bg-secondary">4</span>
  </button>
  <br>
  <a href="remove_session.jsp">세션 값 삭제</a>
  <%}%>
</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
