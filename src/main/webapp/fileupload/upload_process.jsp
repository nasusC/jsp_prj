<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
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
  <%-- 업로더 : <%= request.getParameter("uploader")%><br>--%>
  <%--  EL : ${param.uploader}--%>
  요청방식 : <%= request.getMethod()%>
  <%
    // 1. 업로드 된 파일의 저장 디렉토리 얻기
    File saveDir = new File("/Users/chaseongho/Desktop/2019219071/demo/src/main/webapp/upload");

    // 2 . 업로드 파일의 최대 크기 ( byte -> kb -> mb -> gb)
    int maxSize = 1024 * 1024 * 10; // 사이즈가 10mb 까지만 저장가능 -> 높으면 예외발생. (자바에서 예외처리불가)
    int uploadSize = 1024 * 1024 * 600; // 큰 파일도 업로드는 가능 하도록 설정


    // 3. FileUpload Component를 생성 - 생성과 동시에  업로드가 진행.
    // 매개 변수가 5개인데 (request, 파일디렉토리, 파일크기, 인코딩방식, 동일파일명처리)
    try {
      MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), uploadSize, "UTF-8", new DefaultFileRenamePolicy());

      // 웹 파라미터 받기
      // ( request가 아닌 MultipartRequest 파일 컴포넌트를 사용하여 파라매터를 받는다.)
      String uploader = mr.getParameter("uploader");
      String extArr[] = mr.getParameterValues("ext");

      // 파일명 처리
      // - 원본 파일명
      String originName = mr.getOriginalFileName("upfile");

      // - 변경된 파일명
      String fileSysName = mr.getFilesystemName("upfile");


      // 업로드 된 파일이 최대 크기를 초과하는지 체크
      File uploadFile = new File(saveDir.getAbsolutePath() + "/" + fileSysName);
      if (uploadFile.length() > maxSize) { // 업로드 최대 크기를 초과
        uploadFile.delete();

  %>
    <%=originName%>은 10Mbyte ( <%=maxSize%> byte)를 초과합니다.<br>
    업로드 파일의 크기내의 파일로 변환하여 해주세용. <br>
    <a href="javascript:history.back()">뒤로</a>
    <%
  }else {
  %>
  <h2>파일 업로드 성공</h2>
  <div>
    업로더 : <%= uploader %><br>
    확장자 : <%
    if (extArr == null) {
      out.print("선택 확장자 없음");
    } else {
      for (String tempExt : extArr) {
        out.print(tempExt);
        out.print("&nbsp;");
      }
    }
  %>
    <br>
    원본 파일명 : <%= originName%><br>
    변경된 파일명 : <%= fileSysName%><br>
    <a href="file_list.jsp">파일 리스트 보기</a>
  </div>
  <%
    }
  } catch (Exception e) { // 파일 크기가 커도 예외처리가 안된다.

    e.printStackTrace();
  %>
  파일업로드 실패!
  <%
    }
  %>
</div>
<script>
    $(function () {
        $('#btn').click(() => {
            chkNull();
        });

    })

    function chkNull() {
        if ($('#uploader').val() == "") {
            alert("업로더는 필수 입력!!");
            $('#uploader').focus();
            return;
        }

    }
</script>
</body>
</html>
</html>
