<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.OutputStream" %>
<%@ page contentType="application/octet-stream" language="java" info="무조건 다운로드" %>
<%
  String fileName = request.getParameter("fileName"); // 조.txt
  // 한국어 파일에 대한 처리 ( 다운로드가 안되므로 인코딩해줘야함)
  if (!"".equals(fileName)) {
    fileName = URLEncoder.encode(URLDecoder.decode(fileName, "8859_1"), "UTF-8");
    // 조.txt => %EC%A1%BO.txt
  }
  System.out.println(fileName);
  // 2. 응답헤더 변경
  response.setHeader("Content-Disposition", "attchement;filename=" + fileName);

  fileName = URLDecoder.decode(fileName, "UTF-8");
  // %EC%A1%BO.txt => 조.txt

  // 3. 다운로드 할 파일의 정보얻기
  File file = new File("/Users/chaseongho/Desktop/2019219071/demo/src/main/webapp/upload/" + fileName);

  System.out.println(file + " / " + file.exists());

  // 4. 다운로드 할 파일에 읽기 스트림 연결
  FileInputStream fis = new FileInputStream(file);
  // 접속자에게 응답하기 위해 출력 스트림 얻기
  OutputStream os = response.getOutputStream();
  System.out.println(os);

  // 5. 읽어들인 파일의 내용을 출력스트림으로 출력
  byte[] readData = new byte[512];
  int readSize = 0;
  while ((readSize = fis.read(readData)) != -1) {
    os.write(readData, 0, readSize);
  }
  os.flush();

  // 6. 출력 스틀미 초기화
  out.clear();

  // 7. 응답헤더 초기화
  out = pageContext.pushBody();
  if (fis != null) {
    fis.close();
  }
  System.out.println(out);
%>