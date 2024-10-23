<%@ page contentType="text/html;charset=UTF-8" language="java" info="사용자가 입력하는 폼" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>parameter_frm</title>
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
  <h2>GET방식 HTML Form Contorl의 값 전송</h2>
  <form name="frmGet" id="frmGet" action="parameter_frm_process.jsp" method="get">
    <table>
      <tr>
        <td>
          <label for="text">text</label></td>
        <td>
          <input type="text" name="text" id="text" class="inputBox" style="width: 150px">
        </td>
      </tr>
      <tr>
        <td>
          <label for="pass">password</label></td>
        <td>
          <input type="password" name="pass" id="pass" class="inputBox" style="width: 150px">
        </td>
      </tr>
      <tr>
        <td>
          <label for="chk">checkbox</label></td>
        <td>
          <input type="checkbox" name="chk" id="chk" class="inputBox">
        </td>
      </tr>
      <tr>
        <td>
          <label>hidden</label></td>
        <td>
          <input type="hidden" name="hid" id="hid" value="숨김값">
        </td>
      </tr>
<%--      <tr>--%>
<%--        <td>--%>
<%--          <label for="upFile">file</label></td>--%>
<%--        <td>--%>
<%--          <input type="file" name="upFile" id="upFile" style="width: 300px">--%>
<%--        </td>--%>
<%--      </tr>--%>
      <tr>
        <td>
          <label for="select">select</label></td>
        <td>
          <select name="select" id="select" class="inputBox" style="width: 150px;">
            <option value="자바">Java SE</option>
            <option value="오라클">Oracle DBMS</option>
            <option value="JDBC">JDBC</option>
            <option value="흐트믈">HTML5</option>
            <option value="크스스">CSS3</option>
            <option value="js">JavaScript ES6</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>
          <label for="ta">textarea</label></td>
        <td>
          <textarea name="ta" class="inputBox" style="width: 300px; height: 100px" id="ta" name="ta"></textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="button" value="GET 값 전송" id="btnGet" class="btnMy" onclick="getValue()">
        <td>
      </tr>
    </table>
    <div id="div"></div>
  </form>
  </div>
  <hr>
  <div>
  <h2>POST방식 HTML Form Contorl의 값 전송</h2>
  <form name="frmPost" id="frmPost" action="parameter_frm_process.jsp" method="post">
    <table>
      <tr>
        <td>
          <label for="text">text</label></td>
        <td>
          <input type="text" name="text" id="text" class="inputBox" style="width: 150px">
        </td>
      </tr>
      <tr>
        <td>
          <label for="pass">password</label></td>
        <td>
          <input type="password" name="pass" id="pass" class="inputBox" style="width: 150px">
        </td>
      </tr>
      <tr>
        <td>
          <label for="chk">checkbox</label></td>
        <td>
          <input type="checkbox" name="chk" id="chk" class="inputBox">
        </td>
      </tr>
      <tr>
        <td>
          <label>hidden</label></td>
        <td>
          <input type="hidden" name="hid" id="hid" value="숨김값">
        </td>
      </tr>
<%--      <tr>--%>
<%--        <td>--%>
<%--          <label for="upFile">file</label></td>--%>
<%--        <td>--%>
<%--          <input type="file" name="upFile" id="upFile" style="width: 300px">--%>
<%--        </td>--%>
<%--      </tr>--%>
      <tr>
        <td>
          <label for="select">select</label></td>
        <td>
          <select name="select" id="select" class="inputBox" style="width: 150px;">
            <option value="자바">Java SE</option>
            <option value="오라클">Oracle DBMS</option>
            <option value="JDBC">JDBC</option>
            <option value="흐트믈">HTML5</option>
            <option value="크스스">CSS3</option>
            <option value="js">JavaScript ES6</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>
          <label for="ta">textarea</label></td>
        <td>
          <textarea name="ta" class="inputBox" style="width: 300px; height: 100px" id="ta" name="ta"></textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="button" id="btnPost" value="POST 값 전송" class="btnMy" onclick="getValue()">
        <td>
      </tr>
    </table>

  </form>
  </div>

</div>
<script>
    $(function (){
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
