<%@ page contentType="text/html;charset=UTF-8" language="java" info="meta태그를 사용한 페이지 이동." %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta http-equiv="refresh" content="10;http://sist.co.kr" charset="UTF-8">
  <title>meta</title>
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
  접속하신 서버주소인 http://test.com은 2024-11-01 부터
  <strong>http://sist.co.kr</strong>로 변경됩니다.<br>
  이전 도메인은 추후로 사용불가 이므로 변경된 도메인으로만 접속하실 수 있습니다.<br>
  <span class="seconds"></span>초 후 변경된 도메인으로 자동 연결됩니다.<br>
  바로 이동하시려면 <a href="http://sist.co.kr">여기</a>를 클릭해주세요.
  <%
    for(int i =10; i<=0; i--){
        out.print(i);
    }
  %>
</div>
<script>
    $(function () {
        var seconds = 10;
        function counting() {
            $(".seconds").html(seconds--);
            setTimeout(counting, 1000);
        }
        counting();

    })
</script>
</body>
</html>
</html>
