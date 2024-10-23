<%@ page import="java.util.Calendar" %>
<%@ page import="day1001.DataProcess" %>
<%@ page import="java.util.List" %>
<%@ page import="day1001.ImgVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="scriptlet과 expression 연습" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>날짜 선택</title>
  <link rel="stylesheet" href="../common/css/main_20240911.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<style>
</style>
<body>
<div id="wrap">
  <%
    Calendar cal = Calendar.getInstance();
    int yy = cal.get(Calendar.YEAR);
    int mm = cal.get(Calendar.MONTH) + 1;
    int dd = cal.get(Calendar.DATE);

    // 현재 월의 마지막 날짜를 구하기 위해 날짜를 1일로 설정
    cal.set(Calendar.YEAR, yy);
    cal.set(Calendar.MONTH, mm - 1);
    cal.set(Calendar.DAY_OF_MONTH, 1);
    int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
  %>
  <select name="year" id="year">
    <% for (int i = yy; i >= 1950; i--) { %>
    <option value="<%=i%>"<%= (i == yy) ? " selected" : "" %>><%=i%>년</option>
    <% } %>
  </select>
  <select name="month" id="month">
    <% for (int i = 1; i <= 12; i++) { %>
    <option value="<%= i %>"<%= (i == mm) ? " selected" : "" %>><%= i %>월</option>
    <% } %>
  </select>
  <select name="day" id="day">
    <% for (int i = 1; i <= lastDay; i++) { %>
    <option value="<%= i %>"<%= (i == dd) ? " selected" : "" %>><%= i %>일</option>
    <% } %>
  </select>
  <input type="button" value="날짜얻기" class="btn btn-primary btn-sm" id="btn">
  <div id="output" style="height: 40px"></div>
  <div>
    <%for (int i = 1; i < 7; i++) {%>
    <img src="imges/dice_<%=i%>.png" alt="">
    <%}%>
  </div>
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
          <% for (int i = 0; i <= 10; i++) { %>
          <input type="radio" id="<%= name %>score<%= i %>" name="score_<%= name %>"
                 value="<%= i %>" <%= i==0 ? "checked='checked'" : "" %>><%=i%>점
          <% } %>
        </td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </div>

  <%
    // List에 저장된 이미지와 설명을 Card로 출력
    DataProcess dp = new DataProcess();
    List<ImgVO> list = dp.searchDate();
    if (list.isEmpty()) {
  %>
  <marquee behavior="" direction="">로딩된 이미지가 없습니다.</marquee>
  <%}
    String info ="";
    for (ImgVO iVO : list){
    info = iVO.getInfo();
  %>
  <div class="card" style="width: 18rem; float: left">
    <img src="imges/<%=iVO.getImg()%>" style="width: 260px; height: 200px" class="card-img-top" alt="...">
    <div class="card-body">
      <p class="card-text"><%= info.length()>50? info.substring(0,50)+"..." :""%></p>
    </div>
  </div>
  <%}%>
</div>
<%--<%--%>
<%--  // scriptlet에서는 메소드 선언 불가 => 자바의 문법 (메소드안에 메소드 선언 불가)--%>
<%--  public void test(){--%>
<%--      --%>
<%--  }--%>
<%--%>>--%>
</div>
<script>
    $(function () {
        $('#btn').click(() => {
            var year = $('#year').val()
            var month = $('#month').val()
            var day = $('#day').val()
            $('#output').html(year + '년 ' + month + '월 ' + day + '일 ')
        })


    })
</script>
</body>
</html>