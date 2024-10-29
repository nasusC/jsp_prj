<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.File" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>file_list</title>
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
  <div>
    <a href="upload_frm.jsp">업로드</a>
  </div>
  <table class="table table-hover">
    <thead>
    <tr>
      <th style="width: 80px">번호</th>
      <th style="width: 120px">이미지</th>
      <th style="width: 200px">파일명</th>
      <th style="width: 150px">파일 크기</th>
      <th style="width: 200px">업로드 일</th>
    </tr>
    </thead>
    <tbody>
    <%
      File loadDir = new File("/Users/chaseongho/Desktop/2019219071/demo/src/main/webapp/upload");
      File[] listFile = loadDir.listFiles();
      pageContext.setAttribute("listFile", listFile);
    %>
    <c:choose>
      <c:when test="${empty listFile}">
        <tr>
          <td colspan="5">업로드 된 파일이 없습니다.</td>
        </tr>
      </c:when>
      <c:otherwise>
        <%
          session.removeAttribute("UPLOAD_SESSION_ID");
          int ind = 0;
          SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd EEEE HH:mm:ss");
          for (File tempFile : listFile) {%>
        <tr>
          <td><%=++ind%>
          </td>
            <%--              <td><img src="../upload/<%=tempFile.getName()%>" style="width: 100%; height: 50%"/></td>--%>
          <td>
            <%
              String fileName = tempFile.getName();
              String fileExt = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
              // 확장자가 jpg,gif, png, bmp, txt, js, css, html인 경우는 링크를 설정하여
              // 웹브라우저에서 보이도록 만들어보세요.
              String[] allowedExt = {".jpg", ".gif", ".png", ".bmp", ".txt", ".js", ".css", ".html"};
              for (String ext : allowedExt) {
                if (ext.equals(fileExt)) {
            %>
            <img src="../upload/<%=tempFile.getName()%>" style="width: 100px; height: 100px"/>
            <%
                  break;
                }
              }
            %>
            <%=fileName%>
            (<a href="download.jsp?fileName=<%=tempFile.getName()%>">다운로드</a>)
          </td>
          <td><%=tempFile.getName()%>
          </td>
          <td><%=tempFile.length()%>
          </td>
          <td><%=sdf.format(new Date(tempFile.lastModified()))%>
          </td>
        </tr>
        <%
          }
        %>
      </c:otherwise>
    </c:choose>
    </tbody>
  </table>

</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
