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
    <label for="">파일확장자</label><br>
    <input type="checkbox" name="ext" value="jpg">jpg
    <input type="checkbox" name="png" value="png">png
    <input type="checkbox" name="exe" value="exe">exe
    <input type="checkbox" name="svg" value="svg">svg
    <input type="checkbox" name="sql" value="sql">sql<br>
    <label for="upfile">파일</label>
    <input type="file" name="upfile" id="upfile"><br>
    <input type="submit" value="업로드" id="btn" class="btn btn-primary btn-sm">
    <a href="file_list.jsp">파일 리스트 보기</a>

  </form>

</div>
<script>
    $(function () {
      $('#btn').click((e)=>{
          e.preventDefault();  // 기본 제출 동작 막기
         chkNull();
      });

    })

    function chkNull(){
        if($('#uploader').val() == ""){
            alert("업로더는 필수 입력!!");
            $('#uploader').focus();
            return;
        }
        if($('#upfile').val() == ""){
            alert("업로더 파일은 필수 입력!!");
            return;
        }
        // 업로드 가능 확장자는 이미지 관련 확장자만 가능하도록 유효성 검증
        // jpg, gif, png, bmp 확장자만 업로드 가능
        // 위의 확장자가 아니면 alert("업로드 가능 확장자가 아닙니다.")를 보여주고 얼리리턴
        var ext = ['jpg','gif','png','bmp'];

        var fileName = $('#upfile').val();
        var fileExt = fileName.split('.').pop().toLowerCase();


        if(!ext.includes(fileExt)){
            alert("업로드가 가능한 확장자가 아닙니다.");
            $('#upfile').val('');
            return;
        }



        $('#frm').submit();

    }
</script>
</body>
</html>
</html>
