<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="" %>
<%
  // 세션 체크를 가장 먼저 수행
  String prevSessionId = (String)session.getAttribute("UPLOAD_SESSION_ID");
  String currentSessionId = request.getSession().getId();

  // 이전 업로드 세션이 있으면 리스트 페이지로 리다이렉트
  if (prevSessionId != null) {
    response.sendRedirect("file_list.jsp");
    return;
  }

  // 1. 업로드 된 파일의 저장 디렉토리 얻기
  File saveDir = new File("/Users/chaseongho/Desktop/2019219071/demo/src/main/webapp/upload");

  // 2. 업로드 파일의 최대 크기
  int maxSize = 1024 * 1024 * 10;
  int uploadSize = 1024 * 1024 * 600;

  try {
    MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(),
        uploadSize, "UTF-8",
        new DefaultFileRenamePolicy());

    // 웹 파라미터 받기
    String uploader = mr.getParameter("uploader");
    String extArr[] = mr.getParameterValues("ext");
    String originName = mr.getOriginalFileName("upfile");
    String fileSysName = mr.getFilesystemName("upfile");

    // 업로드 된 파일이 최대 크기를 초과하는지 체크
    File uploadFile = new File(saveDir.getAbsolutePath() + "/" + fileSysName);
    if (uploadFile.length() > maxSize) {
      uploadFile.delete();
%>
<%=originName%>은 10Mbyte ( <%=maxSize%> byte)를 초과합니다.<br>
업로드 파일의 크기내의 파일로 변환하여 해주세용. <br>
<a href="javascript:history.back()">뒤로</a>
<%
} else {
  // 업로드 성공 시에만 세션 ID 저장
  session.setAttribute("UPLOAD_SESSION_ID", currentSessionId);
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
} catch (Exception e) {
  session.setAttribute("uploadMessage", "파일 업로드 중 오류가 발생했습니다: " + e.getMessage());
  response.sendRedirect("upload_frm.jsp");
%>
파일업로드 실패!
<%
  }
%>