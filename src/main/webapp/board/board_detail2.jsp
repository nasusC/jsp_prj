<%@ page import="kr.co.sist.user.board.BoardDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="kr.co.sist.user.board.BoardVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
  // 실제 글의 고유 번호를 받는다.
  String tempNum = request.getParameter("num");
  int num = 0;
  try {
    num = Integer.parseInt(tempNum);
  } catch (NumberFormatException nfe) {
    response.sendRedirect("board_list.jsp");
    return;
  }

  // 입력된 글 번호로 상세조회를 수행.
  BoardDAO bDAO = BoardDAO.getInstance();
  BoardVO bVO = null;
  try {
    bVO = bDAO.selectOneBoard(num);
  } catch (SQLException se) {
    se.printStackTrace();
  }

  pageContext.setAttribute("bVO", bVO);

%>
<c:if test="${empty bVO}">
  <script>
      alert("존재하지 않는 게시글입니다.");
      location.href = "board_list.jsp";
  </script>
</c:if>
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
      <form name="readFrm" id="readFrm" method="POST">
        <table>
          <tr>
            <th colspan="2">
              <h2>글 조회</h2>
            </th>
          </tr>
          <tr>
            <td style="width: 80px">제목</td>
            <td style="width: 390px">
              <input type="text" name="subject" id="subject" value="${bVO.subject}" autofocus required>
            </td>
          </tr>
          <tr>
            <td style="width: 80px">내용</td>
            <td><textarea name="content" id="content" readonly="readonly">${bVO.content}</textarea></td>
          </tr>
          <tr>
            <td>작성자</td>
            <td><c:out value="${bVO.writer}"/></td>
          </tr>
          <tr>
            <td>작성일</td>
            <td><fmt:formatDate value="${bVO.input_date}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
          </tr>
          <tr>
            <td>ip</td>
            <td>
              <c:out value="${bVO.ip}"/>
              <input type="hidden" name="num" value="${bVO.num}">
              <input type="hidden" name="currentPage" value="${param.currentPage}">
            </td>
          </tr>
          <tr>
            <td colspan="2" style="text-align: center">
              <c:if test="${bVO.writer eq userData.id}">
                <button type="button" class="btn btn-primary" id="updateBtn">글수정</button>
                <button type="button" class="btn btn-warning" id="deleteBtn">글삭제</button>
              </c:if>
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
        });

        $('#writeBtn').click(() => {
            checkNull();
        })
        $('#listBtn').click(() => {
            var url = '../board/board_list.jsp?currentPage=${param.currentPage}'
            if(${not empty param.keyword}){
                url += '&field=${param.field}&keyword=${param.keyword}';
            }
            location.href = url;
        })
        $('#updateBtn').click(() => {
            movePage('u');
        })
        $('#deleteBtn').click(() => {
            movePage('d');
        })

        function movePage(flag) {
            // form 태그의 액션을 변경 document.폼이름.action = "변경할 action";
            // form 태그의 메소드를 변경 document.폼이름.method = "변경할 요청 방식 get|post";
            var action = "board_update.jsp";
            let msg = "글을 수정하시겠습니까?"
            if (flag == 'd') {
                action = "board_delete.jsp"
                msg = '정말 글을 삭제하시겠습니까?'
            }


            if (confirm(msg)) { // 사용자에게 한번 더 확인을 거친다.
                // 폼태그(read.frm)의 action 변경
                document.readFrm.action = action;
                // 변경(update)은 내용이 존재하는지 판단.
                // summernote는 <p><br><p>를 기본적으로 가진다(12자).
                if (flag == 'u') {
                    if ($('#content').val().length < 14) {
                        alert('내용은 필수 입력 입니다. 6자이상.');
                        return;
                    }
                }

                $("#readFrm").submit(); //form 전송
            }
        }

            function checkNull() {
                if ($('#subject').val().trim() == "") {
                    alert('제목은 필수 입력입니다.');
                    $('#subject').focus();
                    return;
                }
                if ($('#content').val().trim() == "") {
                    alert('내용은 필수 입력입니다.');
                    $('#content').focus();
                    return;
                }
                $('#writeFrm').submit();
            }
        }

    )
        ;
</script>
</body>
</html>