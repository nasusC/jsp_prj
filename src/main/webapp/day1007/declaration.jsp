<%@ page contentType="text/html;charset=UTF-8" language="java" info="JSP에서 class field로 코드를 생성."%>
<%!
  String name;
%>
<%!
  public String getName(){
      return name;
  }
%>
<%!
    /**
     * @param type 생성할 타입(radio, check)
     * @param radioCnt 라디오 버튼의 갯수
     * @param radioName 라디오버튼 이름
     * @param checkedNum check할 라디오 버튼
     * @return
     */
    public String createRadioCheck(String type, int radioCnt, String radioName, int checkedNum) {
      StringBuilder tempRadio = new StringBuilder();
      for (int i = 0; i < radioCnt + 1; i++) {
        tempRadio.append(("<input type='"))
            .append(type)
            .append("' name='")
            .append(radioName)
            .append("' value='")
            .append(i)
            .append("'")
            .append(i == checkedNum ? " checked='checked'" : "")
            .append("/>")
            .append(i)
            .append("점 ");
      }
      return tempRadio.toString();
    }

%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>declaration</title>
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
    name = "테스트";
  %>
  이름은 : <%= getName() %> 입니다.

  <div>
    <%
      String[] names = {"김지훈", "김현우", "이일환", "이인혁", "황찬욱"};
    %>
    <div style="width: 740px;">
      <table class="table table-striped">
        <thead>
        <tr>
          <th style="width: 90px">이름</th>
          <th style="width: 610px">점수</th>
        </tr>
        </thead>
        <tbody>
        <% for (String name : names) { %>
        <tr>
          <td><%= name %>
          </td>
          <td>
            <%= createRadioCheck("radio",10, "score_"+name, 0)%>
          </td>
        </tr>
        <% } %>
        </tbody>
      </table>
      <%= createRadioCheck("checkbox",5, "temp", 0)%>
    </div>
</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
