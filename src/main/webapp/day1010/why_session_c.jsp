<%@ page contentType="text/html;charset=UTF-8" language="java" info="이동한 페이지 - 이전 페이지에서 사용한 값을 사용할 수 없다." %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>why_session_a</title>
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
  <%--<%= <%=name%> 페이지에서 존재하는 변수느 사용할 수 있는 방법이 없다%>
    scriplet - 지역변수 -> 사용불가

    declaration - 인스턴수변수 -> 개발자가 이전 페이지의 객체를 사용할 수 없으므로 -> 사용불가
                - static 변수 -> 개발자가 이전페이지의 클래스명을 사용할 수 없으므로 -> 사용불가

                -> 로컬 스토리지에 담아서 JS로 사용가능
  --%>
</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
