<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>parameter_values_frm</title>
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
  <h2>form</h2>
  <form name="frmPost" action="bean_parameter_frm_process.jsp" method="post" id="frmPost">
    <label for="">이름</label>
    <input type="text" name="name">
    <label for="">나이</label>
    <input type="password" name="age">
    <h2>checked 속성으로 값 얻기</h2>
    <input type="radio" name="gender" value="M">남자 |
    <input type="radio" name="gender" value="F">여자
    <br>
    <input type="checkbox" name="hobby" value="영화감상">영화감상
    <input type="checkbox" name="hobby" value="음악감상">음악감상
    <input type="checkbox" name="hobby" value="게임">게임
    <input type="checkbox" name="hobby" value="운동">운동
    <input type="checkbox" name="hobby" value="등산">등산
    <input type="checkbox" name="hobby" value="낚시">낚시
    <div>
      <input type="button" value="GET방식 값 전송" class="btn btn-primary" onclick="getCheckedValue()" id="btnPost">
    </div>
  </form>
</div>
<script>
    $(function () {
        $("#btnGet").click(()=>{
            //HTML Form의 값을 전달하려면 <form>의 submit()을 호출해야한다.
            $('#frmGet').submit()
        })
        $("#btnPost").click(()=>{
            //HTML Form의 값을 전달하려면 <form>의 submit()을 호출해야한다.
            $('#frmPost').submit()
        })

    })
</script>
</body>
</html>
</html>
