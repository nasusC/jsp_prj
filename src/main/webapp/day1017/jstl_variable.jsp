<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%--1. jstl 지시자 선언--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="http://192.168.10.213:8080/jsp_prj/common/css/main_20240911.css">
    <link rel="icon" type="image/png" sizes="16x16" href="../common/images/favicon-16x16.png">
    <!--bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

    <!-- jQuery CDN 시작 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <style type="text/css">

    </style>

    <script type="text/javascript">

    </script>

    <script type="text/javascript">
        $(function () {

        });
    </script>

</head>
<body>
<div>
<%--    2. Tag Lib에서 제공하는 태그를 사용한다.--%>
<%--    변수 선언--%>
    <c:set var="msg" value="오늘은 목요일 이다라"/>
    <c:set var="day" value="17"/>

    <h2>변수 출력</h2>
    <%-- 출력 EL--%>
    ${msg} <br>
    <c:out value="msg"/>
    <c:out value="${msg}"/>
    <c:out value="${day+1}"/>

    <%--변수 삭제--%>
    <h2>변수 삭제</h2>
    <c:remove var="msg"/>
    <c:out value="${msg}"/>

    <h2>태그 출력</h2>
    <c:set var="tag" value="오늘은 <strong>목요일</strong> 입니다."/>
    EL : ${tag} <br>
    <c:out value="${tag}" escapeXml="false"/>


    <c:set var="name" value="정미영"/>
    <input type="checkbox" value="${name}">${name}
</div>

</body>
</html>
