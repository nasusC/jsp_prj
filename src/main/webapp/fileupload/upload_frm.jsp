<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>upload_frm</title>
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
<%--  웹 파라미터 전송방식에서 file전송방식으로 변경하는방법--%>
  <form action="upload_process.jsp" method="post" enctype="multipart/form-data" id="frm" name="frm">
    <label for="uploader">업로더</label>
    <input type="text" name="uploader" id="uploader"><br>
    <label for="upfile">업로더</label>
    <input type="file" name="upfile" id="upfile"><br>
    <input type="submit" value="업로드" id="btn" class="btn btn-primary btn-sm">

  </form>

</div>
<script>
    $(function () {
      $('#btn').click(()=>{
         chkNull();
      });

    })

    function chkNull(){
        if($('#uploader').val() == ""){
            alert("업로더는 필수 입력!!");
            $('#uploader').focus();
            return;
        }

    }
</script>
</body>
</html>
</html>
