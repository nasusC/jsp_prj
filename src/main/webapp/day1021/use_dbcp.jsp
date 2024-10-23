<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="kr.co.sist.dao.DbConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="DBCP에서 커넥션 얻기" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>use_dbcp</title>
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
    // 1. JNDI 사용 객체 생성
    Context ctx = new InitialContext();

    // 2. 설정된 DBCP에서 DB연결 객체(javax.sql.DataSource) 얻기
    DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/dbcp");

    // 3. DBCP에서 가져온 연결 객체로 부터 커넥션 얻기.
    Connection con = ds.getConnection();
  %>
  <%=con%>
  <br>
  <%
    if(con != null){
        con.close();
    }
  %>

  <%
    DbConnection dbConn = DbConnection.getInstance();
    con = dbConn.getConnection();
  %>
  <%=con%>
  <%
    dbConn.dbClose(null,null,con);
  %>

</div>
<script>
    $(function () {

    })
</script>
</body>
</html>
</html>
