<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/session_chk.jsp" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>board_list</title>
  <link rel="stylesheet" href="../common/css/main_20240911.css">

  <!-- jQuery 먼저 로드 -->
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Summernote CSS -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

  <!-- Summernote JS -->
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

  <style>
      /* 기존 스타일 유지 */
  </style>
</head>
<body>
<div id="wrap">
  <div id="header">
    <c:import url="../common/header.jsp"/>
  </div>
  <div id="contents">
    <div id="writeFrmDiv">
      <form action="board_write_frm_process.jsp" name="writeFrm" id="writeFrm" method="POST">
        <table>
          <tr>
            <th colspan="2">
              <h2>글쓰기</h2>
            </th>
          </tr>
          <tr>
            <td style="width: 80px">제목</td>
            <td style="width: 390px">
              <input type="text" name="subject" id="subject" style="width: 390px" autofocus required>
            </td>
          </tr>
          <tr>
            <td style="width: 80px">내용</td>
            <td><textarea id="content" name="content" required></textarea></td>
          </tr>
          <tr>
            <td style="width: 80px">작성자</td>
            <td style="width: 400px">
              <input type="text" name="writer" id="writer" style="width: 390px" value="${userData.id}" readonly>
            </td>
          </tr>
          <tr>
            <td colspan="2" style="text-align: center">
              <button type="button" class="btn btn-primary" id="writeBtn">글쓰기</button>
              <button type="reset" class="btn btn-warning" id="resetBtn">초기화</button>
              <button type="button" class="btn btn-secondary" id="listBtn">글목록</button>
            </td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>

<script>
    $(function () {
        $('#content').summernote({
            placeholder: '내용을 입력해주세요.',
            tabsize: 2,
            height: 300,
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'underline', 'clear']],
                ['insert', ['picture']],
                ['view', ['fullscreen', 'help']]
            ]
        });

        $('#writeBtn').click(()=>{
            checkNull();
        })
        $('#listBtn').click(()=>{
            if(confirm('목록으로 이동하실겨?')) {
                location.href = '../board/board_list.jsp';
            }
        })

        function checkNull(){
            if($('#subject').val().trim() == ""){
                alert('제목은 필수 입력입니다.');
                $('#subject').focus();
                return;
            }
            if($('#content').val().trim() == ""){
                alert('내용은 필수 입력입니다.');
                $('#content').focus();
                return;
            }
            $('#writeFrm').submit();
        }
    });
</script>
</body>
</html>